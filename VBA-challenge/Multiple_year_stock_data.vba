Attribute VB_Name = "Module1"
Sub stockmarket()

Dim ws As Worksheet
For Each ws In ActiveWorkbook.Worksheets
    ws.Activate

Dim LastRow As Long
    With ws
        LastRow = ws.Cells(.Rows.Count, "A").End(xlUp).Row
    End With
    
'set ranges for summary table
ws.Range("P1").Value = "Ticker"
ws.Range("Q1").Value = "Value"
ws.Range("O2").Value = "Greatest % Increase"
ws.Range("O3").Value = "Greatest % Decrease"
ws.Range("O4").Value = "Greatest Total Vol"

    
'set ranges
ws.Range("I1").Value = "Ticker"
ws.Range("J1").Value = "Yearly Chg"
ws.Range("K1").Value = "Percent Chg"
ws.Range("L1").Value = "Stock Volume"
    
'set summary table variables
Dim Ticker As String
Dim Yearly_Chg As Double
Dim Percent_Chg As Double
Dim Stock_Vol As Double
Dim Open_Value As Double

'set summary table starting Row
Dim Summary_Table_Row As Integer
  Summary_Table_Row = 2
  
'loop through rows to get rid of blank cells
For i = 2 To LastRow
        If IsEmpty(ws.Cells(i, 3).Value) = True Then
        ws.Cells(i, 3).Value = 0
    End If
Next i

        
'loop through rows to get summary table values
For i = 2 To LastRow

If ws.Cells(i - 1, 1).Value <> ws.Cells(i, 1).Value Then
        Open_Value = ws.Cells(i, 3).Value

    End If
    
    If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
       
        
        Ticker = ws.Cells(i, 1).Value
        Stock_Vol = Stock_Vol + ws.Cells(i, 7).Value
        Yearly_Chg = ws.Cells(i, 6).Value - Open_Value
        If Open_Value <> 0 Then
            Percent_Chg = Yearly_Chg / Open_Value
        Else: Percent_Chg = 0
        End If
        
        
        ws.Range("I" & Summary_Table_Row).Value = Ticker
        ws.Range("J" & Summary_Table_Row).Value = Yearly_Chg
        ws.Range("K" & Summary_Table_Row).Value = Percent_Chg
        ws.Range("L" & Summary_Table_Row).Value = Stock_Vol
        
        Summary_Table_Row = Summary_Table_Row + 1
        Stock_Vol = 0
        
    Else
    
        Stock_Vol = Stock_Vol + ws.Cells(i, 7).Value
    
    End If
    
    
Next i


'find greatest % increase
For i = 2 To LastRow
        If ws.Cells(i, 11).Value = Application.WorksheetFunction.max(ws.Range("K2:K" & LastRow)) Then
            ws.Range("P2").Value = ws.Cells(i, 9).Value
            ws.Range("Q2").Value = ws.Cells(i, 11).Value
        End If
            
        'find greatest % decrease
        If ws.Cells(i, 11).Value = Application.WorksheetFunction.Min(ws.Range("K2:K" & LastRow)) Then
            ws.Range("P3").Value = ws.Cells(i, 9).Value
            ws.Range("Q3").Value = ws.Cells(i, 11).Value
        End If
            
        'find greatest total vol
        If ws.Cells(i, 12).Value = Application.WorksheetFunction.max(ws.Range("L2:L" & LastRow)) Then
            ws.Range("P4").Value = ws.Cells(i, 9).Value
            ws.Range("Q4").Value = ws.Cells(i, 12).Value
            
        End If
        
Next i
Next ws

        
End Sub
