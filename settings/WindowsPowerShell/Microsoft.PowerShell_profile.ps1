# Generate intersect of aliases to remove

# $a = dir C:\Users\rwang\scoop\shims\*.exe | % {$_.Name.substring(0,$_.Name.length-4)}
# $b = alias | % {$_.Name}
# compare $a $b -PassThru -IncludeEqual -ExcludeDifferent | % { "Remove-Item alias:$_"} >> $profile
Remove-Item alias:cat
Remove-Item alias:echo
Remove-Item alias:pwd
Remove-Item alias:ls
Remove-Item alias:rm

function ls { ls.exe --color $args }
function vi { nvim.exe $args }
function lspci() {
    Get-WmiObject win32_pnpentity | 
    Where-Object { $_.deviceid -match "PCI" } | 
    Select-Object deviceid, name | 
    Format-List
}
function iperf { ~\.bin\iperf-2.0.9-win64\iperf.exe $args }

Write-Host "Profile Loaded"