strInputFile = "..\input.txt"

Set objFileSystem = CreateObject("Scripting.FileSystemObject")
Set objFile = objFileSystem.OpenTextFile(strInputFile)
Set arrItemList = CreateObject("System.Collections.ArrayList")

Function IsUpper(strTestString)
    If strTestString = UCase(strTestString) Then
        IsUpper = true
    Else
        IsUpper = false
    End If
End Function

Function GetCommonChar(strLineOne, strLineTwo, strLineThree)
    For i=1 To Len(strLineOne)
        strLineOneChar = Mid(strLineOne,i,1)
        For j=1 To Len(strLineTwo)
            strLineTwoChar = Mid(strLineTwo,j,1)
            If strLineOneChar = strLineTwoChar Then
                For k=1 To Len(strLineThree)
                    strLineThreeChar = Mid(strLineThree,k,1)
                    If strLineOneChar = strLineThreeChar Then
                        WScript.Echo strLineOneChar
                        GetCommonChar = strLineOneChar
                        Exit Function
                    End If
                Next
            End If
        Next
    Next
End Function

Function EvaluateChars(arrItemList)
    intTotal = 0

    For i=0 To arrItemList.Count - 1
        strCurrent = arrItemList(i)
        strCurrentLower = LCase(strCurrent)
        intPriority = 0

        Select Case strCurrentLower
            Case "a"
                intPriority = 1
            Case "b"
                intPriority = 2
            Case "c"
                intPriority = 3
            Case "d"
                intPriority = 4
            Case "e"
                intPriority = 5
            Case "f"
                intPriority = 6
            Case "g"
                intPriority = 7
            Case "h"
                intPriority = 8
            Case "i"
                intPriority = 9
            Case "j"
                intPriority = 10
            Case "k"
                intPriority = 11
            Case "l"
                intPriority = 12
            Case "m"
                intPriority = 13
            Case "n"
                intPriority = 14
            Case "o"
                intPriority = 15
            Case "p"
                intPriority = 16
            Case "q"
                intPriority = 17
            Case "r"
                intPriority = 18
            Case "s"
                intPriority = 19
            Case "t"
                intPriority = 20
            Case "u"
                intPriority = 21
            Case "v"
                intPriority = 22
            Case "w"
                intPriority = 23
            Case "x"
                intPriority = 24
            Case "y"
                intPriority = 25
            Case "z"
                intPriority = 26
        End Select

        If IsUpper(strCurrent) Then
            intPriority = intPriority + 26
        End If

        intTotal = intTotal + intPriority
    Next

    EvaluateChars = intTotal
End Function

'========== Mainline Execution Below =========='

strLineOne = ""
strLineTwo = ""
strLineThree = ""
intLineCounter = 0

Do Until objFile.AtEndOfStream
    strLine = objFile.ReadLine
    intLineLength = Len(strLine)

    Select Case intLineCounter
        Case 0
            strLineOne = strLine
        Case 1
            strLineTwo = strLine
        Case 2
            strLineThree = strLine
    End Select

    If intLineCounter = 2 Then
        arrItemList.Add GetCommonChar(strLineOne, strLineTwo, strLineThree)
        intLineCounter = 0
    Else
        intLineCounter = intLineCounter + 1
    End If
Loop

objFile.Close

intFinalTotal = EvaluateChars(arrItemList)

WScript.Echo intFinalTotal
