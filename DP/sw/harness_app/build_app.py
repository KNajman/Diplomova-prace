"""
Sestavení měřicí aplikace testovacího řetězce (Vitis 2025.2 Unified, bare-metal A53).

Použití (na Ababelu, z DP/sw/harness_app):  vitis -s build_app.py [O0 O2 O3]
Vstup:   DP/hw/build/harness/harness.xsa a harness_map.h (build_harness.tcl)
Výstup:  DP/sw/build/workspace/harness_app_<opt>/build/harness_app_<opt>.elf

Platforma (standalone, psu_cortexa53_0) se vytvoří z XSA, aplikace ze zdrojů src/ + lib_imgproc
(stejný golden model jako pro verifikaci HW, tedy i SW měření je nad stejným kódem).
Jedna aplikace na úroveň optimalizace (-O0/-O2/-O3), úroveň se vypisuje v CSV (SW_OPT_LEVEL).
"""
import glob
import os
import shutil
import sys

import vitis

HERE = os.path.dirname(os.path.abspath(__file__))
DP = os.path.normpath(os.path.join(HERE, "..", ".."))
XSA = os.path.join(DP, "hw", "build", "harness", "harness.xsa")
MAP_HEADER = os.path.join(DP, "hw", "build", "harness", "harness_map.h")
LIB = os.path.join(DP, "model", "lib_imgproc")
WORKSPACE = os.path.join(DP, "sw", "build", "workspace")
PLATFORM = "harness_platform"
DOMAIN = "standalone_a53"

levels = sys.argv[1:] if len(sys.argv) > 1 else ["O0", "O2", "O3"]
for path in (XSA, MAP_HEADER):
    if not os.path.isfile(path):
        sys.exit(f"Chybi {path} (spust frontu hw_harness)")

# zdroje aplikace do jednoho adresáře: src/, vygenerovaná mapa, lib_imgproc (moduly + konfigurace)
staging = os.path.join(DP, "sw", "build", "src_staging")
shutil.rmtree(staging, ignore_errors=True)
os.makedirs(os.path.join(staging, "imgproc"))
for f in glob.glob(os.path.join(HERE, "src", "*.[ch]")):
    shutil.copy(f, staging)
shutil.copy(MAP_HEADER, staging)
shutil.copy(os.path.join(LIB, "imgproc.h"), staging)
shutil.copy(os.path.join(LIB, "template", "imgproc_custom.h"), staging)
for f in glob.glob(os.path.join(LIB, "imgproc", "*.[ch]")):
    shutil.copy(f, os.path.join(staging, "imgproc"))

shutil.rmtree(WORKSPACE, ignore_errors=True)
client = vitis.create_client()
client.set_workspace(path=WORKSPACE)

platform = client.create_platform_component(name=PLATFORM, hw_design=XSA, os="standalone",
                                            cpu="psu_cortexa53_0", domain_name=DOMAIN)
platform.build()
xpfm = os.path.join(WORKSPACE, PLATFORM, "export", PLATFORM, f"{PLATFORM}.xpfm")

for level in levels:
    name = f"harness_app_{level}"
    app = client.create_app_component(name=name, platform=xpfm, domain=DOMAIN, template="empty_application")
    top_files = sorted(f for f in os.listdir(staging) if os.path.isfile(os.path.join(staging, f)))
    app.import_files(from_loc=staging, files=top_files, dest_dir_in_cmp="src")
    app.import_files(from_loc=os.path.join(staging, "imgproc"),
                     files=sorted(os.listdir(os.path.join(staging, "imgproc"))), dest_dir_in_cmp="src/imgproc")
    # <imgproc.h> a <imgproc/...> hledá překladač v src komponenty (absolutní cesta - nezávislé na build adresáři)
    app.set_app_config(key="USER_INCLUDE_DIRECTORIES", values=[os.path.join(WORKSPACE, name, "src")])
    app.set_app_config(key="USER_COMPILE_DEFINITIONS", values=[f'SW_OPT_LEVEL="{level}"'])
    app.set_app_config(key="USER_COMPILE_OPTIMIZATION_LEVEL", values=[f"-{level}"])
    app.set_app_config(key="USER_LINK_LIBRARIES", values=["m"])
    app.build()
    elf = glob.glob(os.path.join(WORKSPACE, name, "build", "*.elf"))
    print(f"APP HOTOVO: {name} -> {elf[0] if elf else 'ELF nenalezen'}")

vitis.dispose()
