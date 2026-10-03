@echo off
rem =============================================================================
rem  Spuštění Vitis HLS 2025.2 (unified CLI) pro jednu komponentu - Windows
rem
rem  Použití:  run_hls.bat <cesta\k\hls_config_*.cfg> [csim|syn|cosim|impl|all]
rem  Příklad:  run_hls.bat ..\csc\hls_config_rgb.cfg all
rem
rem  Spouštět z "Vitis 2025.2 Command Prompt" (nebo po zavolání settings64.bat),
rem  aby byly v PATH příkazy vitis-run a v++. .bat soubory nepodléhají PowerShell
rem  execution policy, takže je lze spustit i bez administrátorských práv.
rem  Výstupy: DP\hls\build\<jádro>_<varianta>\  a  DP\hls\ip_repo\*.zip
rem =============================================================================
setlocal EnableExtensions

if "%~1"=="" (
    echo Pouziti: run_hls.bat ^<cesta\k\hls_config_*.cfg^> [csim^|syn^|cosim^|impl^|all]
    exit /b 1
)

set "CFG=%~f1"
set "CFGDIR=%~dp1"
set "STEP=%~2"
if "%STEP%"=="" set "STEP=all"

for %%I in ("%CFGDIR%.") do set "CORE=%%~nxI"
set "VARIANT=%~n1"
set "VARIANT=%VARIANT:hls_config_=%"
set "VARIANT=%VARIANT:hls_config=%"
for %%I in ("%~dp0..") do set "HLSDIR=%%~fI"
if "%VARIANT%"=="" (set "WORK=%HLSDIR%\build\%CORE%") else (set "WORK=%HLSDIR%\build\%CORE%_%VARIANT%")
set "IPREPO=%HLSDIR%\ip_repo"

if not exist "%WORK%" mkdir "%WORK%"
if not exist "%IPREPO%" mkdir "%IPREPO%"
rem relativní cesty v .cfg jsou vůči adresáři konfigurace
pushd "%CFGDIR%"

if /i "%STEP%"=="csim"  goto do_csim
if /i "%STEP%"=="syn"   goto do_syn
if /i "%STEP%"=="cosim" goto do_cosim
if /i "%STEP%"=="impl"  goto do_impl
if /i "%STEP%"=="all"   goto do_csim
echo Neznamy krok: %STEP% (csim^|syn^|cosim^|all)
popd & exit /b 1

:do_csim
echo == C simulace: %CFG%
call vitis-run --mode hls --csim --config "%CFG%" --work_dir "%WORK%"
if errorlevel 1 goto failed
if /i not "%STEP%"=="all" goto done

:do_syn
echo == Synteza + IP: %CFG%
call v++ -c --mode hls --config "%CFG%" --work_dir "%WORK%"
if errorlevel 1 goto failed
echo == Baleni IP: %CFG%
call vitis-run --mode hls --package --config "%CFG%" --work_dir "%WORK%"
if errorlevel 1 goto failed
for /r "%WORK%" %%F in (*.zip) do copy /y "%%F" "%IPREPO%\" >nul
if /i not "%STEP%"=="all" goto done

:do_cosim
echo == C/RTL cosim: %CFG%
call vitis-run --mode hls --cosim --config "%CFG%" --work_dir "%WORK%"
if errorlevel 1 goto failed

:done
echo == HOTOVO: %STEP%
popd & exit /b 0

:do_impl
echo == Vivado OOC impl: %CFG%
call vitis-run --mode hls --impl --config "%CFG%" --work_dir "%WORK%"
if errorlevel 1 goto failed
goto done

:failed
echo == CHYBA v kroku %STEP% - viz log v %WORK%
popd & exit /b 1
