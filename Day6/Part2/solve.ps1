[String]$inputFileName = "..\input.txt"

[char[]]$charArray = (Get-Content $inputFileName).ToCharArray()

[int]$substringLength = 14

Function Test-Substring
{
    Param([int]$i)

    For ([int]$j = 0; $j -lt $substringLength; $j++)
    {
        [String]$substring = ""
        For ([int]$k = ($j + 1); $k -lt $substringLength; $k++)
        {
            $substring = "$($substring)$($charArray[$i+$k])"
        }

        If ($substring.Contains($charArray[$i+$j]))
        {
            return
        }
    }
    return ($i + $substringLength)
}

For ([int]$i = 0; $i -lt $charArray.Length; $i++)
{
    [int]$currentTest = (Test-Substring -i $i)
    If ($currentTest -gt 0)
    {
        Write-Output $currentTest
        break;
    }
}
