$input = Get-Content .\input.txt

[int]$groupSum = 0
[int]$totalSum = 0
[int]$currentMax = 0

ForEach ($line in $input)
{
    If ($line -eq "")
    {
        If ($groupSum -gt $currentMax)
        {
            $currentMax = $groupSum
        }
        $groupSum = 0
    }
    Else
    {
        $groupSum += ([int]$line)
        $totalSum += ([int]$line)
    }
}

Write-Output "Absolute total: $($totalSum)"
Write-Output "Largest single calory carry: $($currentMax)"
