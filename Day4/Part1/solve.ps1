[String]$inputFileName = "..\input.txt"

$inputFile = Get-Content $inputFileName

[int]$fullyOverlappedCount = 0

ForEach ($line in $inputFile)
{
    [String]$range1 = ($line -split ",")[0]
    [String]$range2 = ($line -split ",")[1]

    [int]$range1Lower = ($range1 -split "-")[0]
    [int]$range1Upper = ($range1 -split "-")[1]
    [int]$range2Lower = ($range2 -split "-")[0]
    [int]$range2Upper = ($range2 -split "-")[1]

    If (($range1Lower -le $range2Lower -and $range1Upper -ge $range2Upper) -or ($range2Lower -le $range1Lower -and $range2Upper -ge $range1Upper))
    {
        $fullyOverlappedCount++
    }
}

Write-Output $fullyOverlappedCount
