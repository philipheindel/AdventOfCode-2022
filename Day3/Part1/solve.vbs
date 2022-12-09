strInputFile = "..\input.txt"

Set objFileSystem = CreateObject("Scripting.FileSystemObject")
Set objFile = objFileSystem.OpenTextFile(strInputFile)

Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    intLineLength = Len(strLine)

    strFrstHalf = Mid(strLine, 1, (intLineLength/2))
    strScndHalf = Mid(strLine, 1 + (intLineLength/2), intLineLength)

    WScript.Echo strLine
    WScript.Echo strFrstHalf
    WScript.Echo strScndHalf
Loop

objFile.Close
