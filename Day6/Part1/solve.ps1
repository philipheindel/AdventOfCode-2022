[String]$inputFileName = "..\input.txt"

[char[]]$charArray = (Get-Content $inputFileName).ToCharArray()

For ([int]$i = 0; $i -lt $charArray.Length; $i++)
{
    [String]$substring1 = "$($charArray[$i+1])$($charArray[$i+2])$($charArray[$i+3])"
    [String]$substring2 = "$($charArray[$i+2])$($charArray[$i+3])"
    
    If ((-not $substring1.Contains($charArray[$i])) -and (-not $substring2.Contains($charArray[$i+1])) -and ($charArray[$i+2] -ne $charArray[$i+3]))
    {
        Write-Output "$($charArray[$i])$($substring1)"
        Write-Output ($i + 4)
        break
    }

}

#Write-Output $charArray