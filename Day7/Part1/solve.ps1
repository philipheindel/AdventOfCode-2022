[String]$inputFileName = "..\input.txt"

$inputFile = Get-Content $inputFileName



[xml]$fs = New-Object System.Xml.XmlDocument
$fs.AppendChild($fs.CreateXmlDeclaration("1.0","UTF-8",$null))
$root = $fs.CreateNode("element","root",$null)
$fs.AppendChild($root)
[System.Xml.XmlElement]$currentNode = $root

Function Check-Existence
{
    Param([int]$offset, [String]$line)
    [String]$target = ($line.Substring($offset,($line.Length - $offset)))
    $nodes = $currentNode.GetElementsByTagName($target)
    return (-not ($nodes -eq $null -or $nodes.Count -eq 0))
}

Function Create-Current
{
    Param([String]$tag)
    [System.Xml.XmlElement]$newNode = $fs.CreateNode("element",$tag,$null)
    $currentNode.AppendChild($newNode)
    $currentNode = $newNode
}

ForEach ($line in $inputFile)
{
    If (($line.Substring(0,1)) -eq '$')
    {
        [String]$command = $line.Substring(2,2)
        If ($command -eq "cd")
        {
            If (($line.Substring(5,1)) -eq '/')
            {
                $currentNode = $root
                continue
            }
            ElseIf (($line.Substring(5,2)) -eq '..')
            {
                If ($currentNode -eq $root)
                {
                    continue
                }
                $currentNode = $currentNode.ParentNode
                continue
            }

            [bool]$exists = Check-Existence -offset 5 -line $line
            If (-not $exists)
            {
                Create-Current -tag ($line.Substring(5,($line.Length - 5)))
            }
        }
        ElseIf ($command -eq "ls")
        {
            $state = ""
        }
    }
    Else
    {
        If (($line.Substring(0,3)) -eq "dir")
        {
            [String]$targetDir = ($line.Substring(4,($line.Length - 4)))
            $nodes = $currentNode.GetElementsByTagName($targetDir)
            If ($nodes -eq $null -or $nodes.Count -eq 0)
            {
                [System.Xml.XmlElement]$newNode = $fs.CreateNode("element",$targetDir,$null)
                $currentNode.AppendChild($newNode)
                $currentNode = $newNode
            }            
        }
        Else
        {

        }
    }
}

Set-Content -Value $fs.OuterXml -Path .\FileSystem.xml
