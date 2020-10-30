# install script can be run on admin cmd prompt using:
# powershell -ExecutionPolicy Bypass -File .\install.ps1

$destination = "c:\RW_PROG\gpu-monitor"
New-Item -ItemType Directory -Path $destination -Force
Copy-Item $PSScriptRoot\target\release\rust-monitor.exe $destination


