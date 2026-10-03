# =============================================================================
#  Golden model DP (lib_imgproc) - CMake build pro Windows (clang, MinGW, MSVC) i Linux (Ababel)
#
#  Konfigurace a překlad (z adresáře DP/model):
#    cmake -S . -B build -G Ninja            (nebo bez -G, CMake zvolí výchozí generátor)
#    cmake --build build
#    ctest --test-dir build --output-on-failure
#  Generování konstant pro HLS/VHDL:
#    cmake --build build --target gen
#
#  Poznámky k volbám:
#   - CMAKE_EXPORT_COMPILE_COMMANDS vytvoří build/compile_commands.json, ze kterého clangd ve VS Code
#     zjistí include cesty (bez něj hlásí "imgproc/types.h file not found" i když překlad projde).
#   - Matematická knihovna 'm' existuje jen na Unixu a v MinGW; clang/MSVC s Windows SDK ji nemají
#     (math funkce jsou v UCRT) - proto se linkuje jen když ji CMake najde.
#   - Varování jsou nastavená jako chyby (zero warning policy podle Jablotron standardu).
# =============================================================================

cmake_minimum_required(VERSION 3.20)
project(imgproc_model VERSION 0.1 LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Typ sestavení" FORCE)
endif()

# --- Varování podle překladače ------------------------------------------------
if(MSVC AND NOT CMAKE_C_COMPILER_ID STREQUAL "Clang")
    set(IMGPROC_WARNINGS /W4 /WX)                     # MSVC (cl.exe)
elseif(CMAKE_C_COMPILER_FRONTEND_VARIANT STREQUAL "MSVC")
    set(IMGPROC_WARNINGS /W4 /WX -Wconversion -Wsign-conversion -Wshadow)   # clang-cl
else()
    set(IMGPROC_WARNINGS -Wall -Wextra -Wpedantic -Wconversion -Wsign-conversion -Wshadow -Werror)
endif()

find_library(IMGPROC_MATH_LIB m)

# --- Knihovna -----------------------------------------------------------------
add_library(imgproc STATIC
    lib_imgproc/imgproc/csc.c
    lib_imgproc/imgproc/filter.c
    lib_imgproc/imgproc/histogram.c
    lib_imgproc/imgproc/hsv.c
    lib_imgproc/imgproc/image.c
    lib_imgproc/imgproc/median.c
    lib_imgproc/imgproc/threshold.c
)
target_include_directories(imgproc PUBLIC lib_imgproc lib_imgproc/template)
target_compile_options(imgproc PRIVATE ${IMGPROC_WARNINGS})
if(IMGPROC_MATH_LIB)
    target_link_libraries(imgproc PUBLIC ${IMGPROC_MATH_LIB})
endif()

# --- Nástroje pro PC ----------------------------------------------------------
add_library(pc_file STATIC tools/pc_file.c)
target_include_directories(pc_file PUBLIC tools)
target_compile_options(pc_file PRIVATE ${IMGPROC_WARNINGS})

foreach(tool gen_coeffs imgproc_cli)
    add_executable(${tool} tools/${tool}.c)
    target_link_libraries(${tool} PRIVATE imgproc pc_file)
    target_compile_options(${tool} PRIVATE ${IMGPROC_WARNINGS})
    if(WIN32)
        # UCRT označuje fscanf/sscanf jako "unsafe" (C4996, clang -Wdeprecated-declarations).
        # Nástroj čte jen hlavičku PNM s omezenou šířkou (%2s), proto je varování potlačeno
        # jen pro nástroje na PC, ne pro knihovnu, která poběží na A53.
        target_compile_definitions(${tool} PRIVATE _CRT_SECURE_NO_WARNINGS)
    endif()
endforeach()

# --- Testy --------------------------------------------------------------------
enable_testing()
add_executable(test_imgproc lib_imgproc/test/test_imgproc.c)
target_link_libraries(test_imgproc PRIVATE imgproc)
target_compile_options(test_imgproc PRIVATE ${IMGPROC_WARNINGS})
add_test(NAME unit_tests COMMAND test_imgproc)

# Porovnání s OpenCV - jen pokud je k dispozici Python s numpy a opencv
add_library(imgproc_shared SHARED $<TARGET_OBJECTS:imgproc>)
set_target_properties(imgproc PROPERTIES POSITION_INDEPENDENT_CODE ON)
set_target_properties(imgproc_shared PROPERTIES OUTPUT_NAME imgproc_shared WINDOWS_EXPORT_ALL_SYMBOLS ON)
if(IMGPROC_MATH_LIB)
    target_link_libraries(imgproc_shared PRIVATE ${IMGPROC_MATH_LIB})
endif()
find_package(Python3 COMPONENTS Interpreter QUIET)
if(Python3_FOUND)
    add_test(NAME verify_opencv
             COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/lib_imgproc/test/verify_opencv.py
                     $<TARGET_FILE:imgproc_shared>)
endif()

# --- Generování konstant pro HLS a VHDL ---------------------------------------
add_custom_target(gen
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_SOURCE_DIR}/generated
    COMMAND gen_coeffs ${CMAKE_CURRENT_SOURCE_DIR}/generated
    DEPENDS gen_coeffs
    COMMENT "Generuji generated/imgproc_coeffs.h a generated/imgproc_coeffs_pkg.vhd"
)
