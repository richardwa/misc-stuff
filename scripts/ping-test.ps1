Import-Module -Scope Local -Name "$PSScriptRoot\logger.psm1" -Force

function Get-Ping($target){
    try{
        $measure = Test-Connection $target | Measure-Object -Property ResponseTime -Average
        [int] $measure.Average
    }catch{
        -1
    }
}

do {
    
    $local = Get-Ping "mars"
    $laptop = Get-Ping "silverhawk"
    $ext = Get-Ping "google.com"
    Write-Log "{1,4} {2,4} {3,4}" -f $local, $laptop, $ext
    Start-Sleep -Seconds 30
}while($true)