$input = Get-Content .\input.txt

[int]$groupSum = 0
[int]$totalSum = 0
[int]$currentMax = 0

[System.Collections.ArrayList]$sums = New-Object -TypeName System.Collections.ArrayList

ForEach ($line in $input)
{
    If ($line -eq "")
    {
        $sums.Add($groupSum)
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
$sums.Sort()

Write-Output "Bronze carry: $($sums[$sums.Count - 3])"
Write-Output "Silver carry: $($sums[$sums.Count - 2])"
Write-Output "Gold carry: $($sums[$sums.Count - 1])"

[int]$topCarriersTotal = ($sums[$sums.Count - 1]) + ($sums[$sums.Count - 2]) + ($sums[$sums.Count - 3])
Write-Output "Top 3 carriers totaled: $($topCarriersTotal)"
