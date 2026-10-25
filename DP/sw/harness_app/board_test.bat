@echo off
rem Automatizovaný test na KV260 - spuštění board_test.ps1 bez změny ExecutionPolicy (parametry se předají dál)
rem Příklad: board_test.bat -Levels O2  (výstup přes DCC/JTAG; s -Uart přes COM port)
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0board_test.ps1" %*
