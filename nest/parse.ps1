

$hash = New-Object System.Collections.Specialized.OrderedDictionary
foreach ($month in '01','02','03','04'){
    $data = Get-Content -Raw -Path "$PSScriptRoot\data\2020\$month\2020-$month-summary.json" | ConvertFrom-Json 
    $monthlyTotal = 0
    foreach ($property in $data.PSObject.Properties) {
        # day
        $dailyTotal = 0
        foreach ($cycle in $property.Value.cycles){
            $dailyTotal += [int] $cycle.duration.Substring(0,$cycle.duration.Length -1)
        }
        $hours = $dailyTotal / 3600
        $hash.Add($property.Name, $hours)
        $monthlyTotal += $hours
    }
    $hash.Add($month, $monthlyTotal)
}

$hash