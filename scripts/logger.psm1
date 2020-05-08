function Write-log([parameter(ValueFromPipeLine)][string[]] $inputs){
    process { 
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        foreach($input in $inputs){
            Write-Host $input
            Add-Content "$PSScriptRoot\app.log" -value "$timestamp $input"
        }
    }
}