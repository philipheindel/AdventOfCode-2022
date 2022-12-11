[String]$inputFileName = "..\input.txt"

$inputFile = Get-Content $inputFileName

$stacks = [System.Collections.Generic.Dictionary[int,System.Collections.Generic.Stack[System.String]]]::new()

Function Initialize-Stack
{
    Param([int]$StackId, [String[]]$Elements)
    $stacks.Add($StackId, [System.Collections.Generic.Stack[String]]::new())
    ForEach ($element in $Elements)
    {
        $stacks[$StackId].Push($element)
    }

}

Function Restack
{
    Param([int]$Quantity, [int]$Source, [int]$Target)
    For ([int]$i = 0; $i -lt $Quantity; $i++)
    {
        $stacks[$Target].Push($stacks[$Source].Pop())
    }
}

Function Summarize-Stacks
{
    [String]$summary = ""
    ForEach ($stackKey in $stacks.Keys)
    {
        $summary = "$($summary)$($stacks[$stackKey].Peek())"
    }
    
    Return $summary
}

Initialize-Stack -StackId 1 -Elements @("F","H","B","V","R","Q","D","P")
Initialize-Stack -StackId 2 -Elements @("L","D","Z","Q","W","V")
Initialize-Stack -StackId 3 -Elements @("H","L","Z","Q","G","R","P","C")
Initialize-Stack -StackId 4 -Elements @("R","D","H","F","J","V","B")
Initialize-Stack -StackId 5 -Elements @("Z","W","L","C")
Initialize-Stack -StackId 6 -Elements @("J","R","P","N","T","G","V","M")
Initialize-Stack -StackId 7 -Elements @("J","R","L","V","M","B","S")
Initialize-Stack -StackId 8 -Elements @("D","P","J")
Initialize-Stack -StackId 9 -Elements @("D","C","N","W","V")

ForEach ($line in $inputFile)
{
    Write-Output $line
    [int]$quantity = (($line -split " from ")[0] -split "move ")[1]
    [int]$source = (($line -split " from ")[1] -split " to ")[0]
    [int]$target = (($line -split " from ")[1] -split " to ")[1]

    Restack -Quantity $quantity -Source $source -Target $target
}

Write-Output $(Summarize-Stacks)
