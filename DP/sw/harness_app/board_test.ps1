<#
.SYNOPSIS
  Automatizovaný test testovacího řetězce na KV260: nahraje bitstream a aplikaci přes JTAG (xsdb run_board.tcl),
  zachytí výstup z UART a uloží výsledky do DP\results\deska.

.DESCRIPTION
  Pro každou úroveň optimalizace SW (výchozí O2, O0, O3):
    1. otevře všechny sériové porty FTDI desky (KV260 má převodník FT4232H se čtyřmi rozhraními),
    2. spustí "xsdb run_board.tcl <úroveň>" (přepnutí bootu na JTAG, bitstream, psu_init, ELF, spuštění),
    3. čte UART, dokud aplikace nevypíše "== HOTOVO ==" (nebo nevyprší časový limit),
    4. uloží celý výpis (uart_<datum>_<úroveň>.txt) a řádky CSV (deska_<datum>_<úroveň>.csv)
       a vypíše souhrn PASS/FAIL.
  Port s výstupem aplikace se pozná sám (ten, na kterém se objeví hlavička "== DP testovaci retezec"),
  takže není potřeba vědět, které rozhraní FTDI je UART procesoru.

  Poznámka k volbě PowerShellu: je součástí každých Windows, nepotřebuje Python ani další balíky.
  Při první chybě (xsdb skončí chybou, žádný port, časový limit) skript skončí a nic nezkouší znovu.

.PARAMETER Levels   Úrovně optimalizace SW, které se změří (ELF harness_app_<úroveň>), výchozí O2 O0 O3.
.PARAMETER Port     Pevně zvolený COM port (např. COM7). Prázdné = automatická detekce mezi porty FTDI.
.PARAMETER TimeoutMin  Časový limit na jeden běh aplikace v minutách (SW -O0 je nejpomalejší).
.PARAMETER Xsdb     Cesta k xsdb.bat. Prázdné = PATH (Vitis Command Prompt), jinak hledání v obvyklých složkách.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File board_test.ps1
  powershell -ExecutionPolicy Bypass -File board_test.ps1 -Levels O2 -Port COM7
#>
param(
    [string[]]$Levels = @('O2', 'O0', 'O3'),
    [string]$Port = '',
    [int]$Baud = 115200,
    [int]$TimeoutMin = 20,
    [string]$Xsdb = ''
)

$ErrorActionPreference = 'Stop'
$scriptDir  = $PSScriptRoot
$repoRoot   = (Resolve-Path (Join-Path $scriptDir '..\..\..')).Path
$resultsDir = Join-Path $repoRoot 'DP\results\deska'
$stamp      = Get-Date -Format 'yyyy-MM-dd_HHmm'
$appHeader  = '== DP testovaci retezec'
$appDone    = '== HOTOVO =='

function Stop-Test([string]$message) {
    Write-Host ''
    Write-Host "CHYBA: $message" -ForegroundColor Red
    Write-Host 'Test zastaven, nic se nezkouší znovu.' -ForegroundColor Red
    exit 1
}

# --- xsdb ------------------------------------------------------------------------------------------
function Find-Xsdb {
    if ($Xsdb -ne '') {
        if (Test-Path $Xsdb) { return $Xsdb }
        Stop-Test "xsdb nenalezen na zadané cestě $Xsdb"
    }
    foreach ($name in @('xsdb.bat', 'xsdb')) {
        $cmd = Get-Command $name -ErrorAction SilentlyContinue
        if ($cmd) { return $cmd.Source }
    }
    foreach ($root in @('C:\AMDDesignTools', 'C:\Xilinx', 'D:\AMDDesignTools', 'D:\Xilinx')) {
        if (Test-Path $root) {
            $hit = Get-ChildItem -Path $root -Filter 'xsdb.bat' -Recurse -Depth 4 -ErrorAction SilentlyContinue |
                   Where-Object { $_.FullName -match '2025\.2' -and $_.FullName -match 'Vitis' } |
                   Select-Object -First 1
            if ($hit) { return $hit.FullName }
        }
    }
    Stop-Test 'xsdb (Vitis 2025.2) nenalezen. Spusť skript z "Vitis 2025.2 Command Prompt" nebo zadej -Xsdb <cesta>.'
}

# --- sériové porty ------------------------------------------------------------------------------------
function Get-CandidatePorts {
    if ($Port -ne '') { return @($Port) }
    $ftdi = Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue |
            Where-Object { ($_.Name -match '\((COM\d+)\)') -and ($_.PNPDeviceID -match 'FTDI') } |
            ForEach-Object { if ($_.Name -match '\((COM\d+)\)') { $Matches[1] } }
    $ports = @($ftdi | Sort-Object -Unique)
    if ($ports.Count -eq 0) {
        Stop-Test 'žádný sériový port FTDI (je deska připojená přes micro-USB a zapnutá?). Port lze zadat ručně: -Port COMx'
    }
    return $ports
}

function Open-Ports([string[]]$names) {
    $opened = @{}
    foreach ($name in $names) {
        try {
            $sp = New-Object System.IO.Ports.SerialPort $name, $Baud, ([System.IO.Ports.Parity]::None), 8, ([System.IO.Ports.StopBits]::One)
            $sp.ReadTimeout = 100
            $sp.Open()
            $sp.DiscardInBuffer()
            $opened[$name] = @{ Port = $sp; Text = (New-Object System.Text.StringBuilder) }
        } catch {
            Write-Host "  $name nejde otevřít (obsazený terminálem, nebo rozhraní JTAG) - přeskočen"
        }
    }
    if ($opened.Count -eq 0) { Stop-Test 'žádný port nejde otevřít - zavři PuTTY nebo jiný terminál na COM portech desky.' }
    return $opened
}

function Read-Ports($opened) {
    foreach ($entry in $opened.Values) {
        $chunk = $entry.Port.ReadExisting()
        if ($chunk.Length -gt 0) { [void]$entry.Text.Append($chunk) }
    }
}

function Close-Ports($opened) {
    foreach ($entry in $opened.Values) { try { $entry.Port.Close() } catch { } }
}

# --- jeden běh ------------------------------------------------------------------------------------------
function Invoke-BoardRun([string]$level, [string]$xsdbPath, [string[]]$portNames) {
    Write-Host ''
    Write-Host "=== Úroveň $level ===" -ForegroundColor Cyan
    $opened = Open-Ports $portNames
    $xsdbLog = Join-Path $resultsDir "xsdb_${stamp}_$level.txt"
    try {
        Write-Host "  xsdb run_board.tcl $level  (log: $xsdbLog)"
        $proc = Start-Process -FilePath $xsdbPath -ArgumentList @('run_board.tcl', $level) -WorkingDirectory $scriptDir `
                              -RedirectStandardOutput $xsdbLog -RedirectStandardError "$xsdbLog.err" -NoNewWindow -PassThru
        $null = $proc.Handle    # bez uložení handle by ExitCode po skončení procesu bylo prázdné (známé chování .NET)
        while (-not $proc.HasExited) { Read-Ports $opened; Start-Sleep -Milliseconds 200 }
        Read-Ports $opened
        if ($proc.ExitCode -ne 0) {
            Get-Content $xsdbLog, "$xsdbLog.err" -ErrorAction SilentlyContinue | Select-Object -Last 15 | ForEach-Object { Write-Host "    $_" }
            Stop-Test "xsdb skončil s kódem $($proc.ExitCode) (výpis výše a v $xsdbLog)"
        }

        $deadline = (Get-Date).AddMinutes($TimeoutMin)
        $active = $null
        while ((Get-Date) -lt $deadline) {
            Read-Ports $opened
            if (-not $active) {
                foreach ($name in $opened.Keys) {
                    if ($opened[$name].Text.ToString().Contains($appHeader)) {
                        $active = $name
                        Write-Host "  aplikace běží, výstup na $name"
                    }
                }
            }
            if ($active -and $opened[$active].Text.ToString().Contains($appDone)) { break }
            Start-Sleep -Milliseconds 200
        }
        if (-not $active) { Stop-Test "aplikace do $TimeoutMin min nic nevypsala na žádný z portů $($opened.Keys -join ', ')" }

        $text = $opened[$active].Text.ToString()
        $uartFile = Join-Path $resultsDir "uart_${stamp}_$level.txt"
        Set-Content -Path $uartFile -Value $text -Encoding UTF8
        if (-not $text.Contains($appDone)) { Stop-Test "časový limit $TimeoutMin min vypršel bez '$appDone' (výpis: $uartFile)" }

        $csvLines = $text -split "`r?`n" | Where-Object { $_ -match '^CSV,' } | ForEach-Object { $_.Substring(4) }
        $csvFile = Join-Path $resultsDir "deska_${stamp}_$level.csv"
        Set-Content -Path $csvFile -Value $csvLines -Encoding UTF8
        $rows = $csvLines | ConvertFrom-Csv
        $fail = @($rows | Where-Object { $_.vysledek -ne 'PASS' })
        Write-Host "  hotovo: $(@($rows).Count) měření, FAIL: $($fail.Count)  -> $csvFile"
        $rows | Format-Table algoritmus, implementace, hw_us_snimek, hw_fps, sw_us, chybne_bajty, status, vysledek -AutoSize | Out-String | Write-Host
        return $fail.Count
    } finally {
        Close-Ports $opened
    }
}

# --- hlavní část ----------------------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path $resultsDir | Out-Null
$xsdbPath  = Find-Xsdb
$portNames = Get-CandidatePorts
Write-Host "xsdb:   $xsdbPath"
Write-Host "porty:  $($portNames -join ', ')"
Write-Host "úrovně: $($Levels -join ', ')"

$totalFail = 0
foreach ($level in $Levels) {
    $totalFail += Invoke-BoardRun $level $xsdbPath $portNames
}
Write-Host ''
if ($totalFail -eq 0) {
    Write-Host "VÝSLEDEK: PASS - všechna jádra bitově shodná s golden modelem (výsledky v $resultsDir)" -ForegroundColor Green
    exit 0
}
Write-Host "VÝSLEDEK: FAIL - $totalFail měření s chybou (podrobnosti v uart_*.txt v $resultsDir)" -ForegroundColor Red
exit 2
