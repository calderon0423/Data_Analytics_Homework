Attribute VB_Name = "Module1"
Sub stockmarket()

Dim LastRow As Long
    With ActiveSheet
        LastRow = .Cells(.Rows.Count, "A").End(xlUp).Row
    End With
    

Dim Ticker As String
Dim Yearly_Chg As Double
Dim Percent_Chg As Double
Dim Stock_Vol As Double
Dim Open_Value As Double

Dim Summary_Table_Row As Integer
  Summary_Table_Row = 2

For i = 2 To LastRow

If Cells(i - 1, 1).Value <> Cells(i, 1).Value And Cells(i, 3).Value > 0 Then
        Open_Value = Cells(i, 3).Value
End If
  
  
        'ElseIf Cells(i - 1, 1).Value <> Cells(i, 1).Value And Cells(1, 3).Value = 0 Then
        'Open_Value = Null


    
    If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
    
        Ticker = Cells(i, 1).Value
        Stock_Vol = Stock_Vol + Cells(i, 7).Value
        Yearly_Chg = Cells(i, 6).Value - Open_Value
        If Open_Value > 0 Then
            Percent_Chg = Yearly_Chg / Open_Value
        Else: Percent_Chg = 0
        End If
        
        Range("I" & Summary_Table_Row).Value = Ticker
        Range("J" & Summary_Table_Row).Value = Yearly_Chg
        Range("K" & Summary_Table_Row).Value = Percent_Chg
        Range("L" & Summary_Table_Row).Value = Stock_Vol
        
        Summary_Table_Row = Summary_Table_Row + 1
        Stock_Vol = 0
        
    Else
    
        Stock_Vol = Stock_Vol + Cells(i, 7).Value
    
    End If
    
    
    
    
Next i
End Sub

Sub max()
Dim max As Double, j As Long

For j = 1 To 3
        max = WorksheetFunction.max(max, Sheets(j).Range("K:K"))
Next j

Range("Q2").Value = max

For j = 1 To 3
        maxvol = WorksheetFunction.max(maxvol, Sheets(j).Range("L:L"))
Next j

Range("Q4").Value = maxvol
End Sub
