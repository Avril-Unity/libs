VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VB PE Framework v .2 - dzzie  http://sandsprite.com"
   ClientHeight    =   4995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7890
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4995
   ScaleWidth      =   7890
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtLoadTime 
      Height          =   315
      Left            =   5700
      TabIndex        =   25
      Top             =   2700
      Width           =   1575
   End
   Begin VB.TextBox txtImpHash 
      Height          =   285
      Left            =   1020
      TabIndex        =   23
      Top             =   2760
      Width           =   3555
   End
   Begin VB.CommandButton cmdRes 
      Caption         =   "Res"
      Height          =   375
      Left            =   4920
      TabIndex        =   21
      Top             =   2280
      Width           =   975
   End
   Begin VB.CheckBox chkx64 
      Caption         =   "is64Bit"
      Height          =   255
      Left            =   2160
      TabIndex        =   20
      Top             =   480
      Width           =   975
   End
   Begin VB.TextBox txtCompiled 
      Height          =   285
      Left            =   1020
      TabIndex        =   19
      Top             =   2370
      Width           =   3525
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      ForeColor       =   &H00FF0000&
      Height          =   1875
      Left            =   3300
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   17
      Text            =   "frmMain.frx":0000
      Top             =   360
      Width           =   4515
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Offset Calculator"
      Height          =   375
      Left            =   6060
      TabIndex        =   16
      Top             =   2280
      Width           =   1755
   End
   Begin MSComctlLib.ListView lvSects 
      Height          =   1755
      Left            =   0
      TabIndex        =   15
      Top             =   3180
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   3096
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton cmdListImports 
      Caption         =   "List"
      Height          =   255
      Left            =   2340
      TabIndex        =   14
      Top             =   1680
      Width           =   915
   End
   Begin VB.CommandButton cmdListExports 
      Caption         =   "List "
      Height          =   255
      Left            =   2340
      TabIndex        =   13
      Top             =   1320
      Width           =   915
   End
   Begin VB.TextBox txtImportAddressTable 
      Height          =   315
      Left            =   960
      TabIndex        =   11
      Top             =   2040
      Width           =   1155
   End
   Begin VB.TextBox txtImportTable 
      Height          =   315
      Left            =   960
      TabIndex        =   10
      Top             =   1620
      Width           =   1155
   End
   Begin VB.TextBox txtExportTable 
      Height          =   315
      Left            =   960
      TabIndex        =   9
      Top             =   1260
      Width           =   1155
   End
   Begin VB.TextBox txtImageBase 
      Height          =   315
      Left            =   960
      TabIndex        =   8
      Top             =   900
      Width           =   1155
   End
   Begin VB.TextBox txtEntryPoint 
      Height          =   315
      Left            =   960
      TabIndex        =   7
      Top             =   480
      Width           =   1155
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Load File"
      Height          =   315
      Left            =   6540
      TabIndex        =   2
      Top             =   0
      Width           =   1335
   End
   Begin VB.TextBox txtFile 
      Height          =   315
      Left            =   2040
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   0
      Width           =   4395
   End
   Begin VB.Label Label5 
      Caption         =   "Load time"
      Height          =   255
      Left            =   4740
      TabIndex        =   24
      Top             =   2760
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "ImpHash"
      Height          =   315
      Left            =   180
      TabIndex        =   22
      Top             =   2760
      Width           =   795
   End
   Begin VB.Label Label3 
      Caption         =   "Compiled"
      Height          =   255
      Left            =   240
      TabIndex        =   18
      Top             =   2400
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "IAT"
      Height          =   255
      Index           =   4
      Left            =   420
      TabIndex        =   12
      Top             =   2100
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "ImportTable"
      Height          =   255
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "ExportTable"
      Height          =   255
      Index           =   2
      Left            =   60
      TabIndex        =   5
      Top             =   1320
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "ImageBase"
      Height          =   255
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "EntryPoint"
      Height          =   255
      Index           =   0
      Left            =   60
      TabIndex        =   3
      Top             =   540
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "PE File: (Drop file in txtbox)"
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'dzzie@yahoo.com
'http://sandsprite.com
 

Public pe As New CPEEditor
Dim isLoaded As Boolean


Private Declare Function GetTickCount Lib "kernel32" () As Long



Private Sub cmdRes_Click()
    Dim res As CResources
    Dim b() As Byte, r As String, fp As String, f As Long
    Dim cre As CResourceEntry
    
    Form2.ShowResources pe
    
'    Set res = pe.Resources
'
'    For Each cre In res.Entries
'        r = r & "   " & cre.path & " - Size: " & cre.Size & vbCrLf
'    Next
'
'    MsgBox "Resources: " & res.Entries.Count & vbCrLf & r
'
'    r = "\ICON\30001\0"
'    'r = "\VERSION\1\1033"
'
'    fp = "C:\res.bin"
'    If res.GetResourceData(r, b) Then
'        MsgBox "Size: " & UBound(b) & vbCrLf & HexDump2(b)
'        If res.SaveResource(fp, r) Then
'            MsgBox "Saved as " & fp
'        Else
'            MsgBox "Save to file failed?"
'        End If
'    End If
    
End Sub

Private Sub Command2_Click()
    pe.ShowOffsetCalculator
End Sub

Private Sub Form_Load()
    ConfigureListView lvSects
    'txtFile = App.path & "\sppe_demo.exe"
    txtFile = App.path & "\..\_sppe2.dll"
End Sub

Private Sub cmdListImports_Click()
    Dim i As CImport
    Dim ret() As String
    Dim j
    
    On Error Resume Next
    
    For Each i In pe.Imports.Modules
        push ret(), i.DllName & " " & Hex(i.pLookupTable)
        For Each j In i.functions
            push ret(), vbTab & j
        Next
    Next
    
    frmLister.ShowList ret
    
End Sub
 
Private Sub cmdListExports_Click()
    
    Dim exp As CExport
    Dim ret() As String

    push ret(), "Ordial" & vbTab & "Address" & vbTab & "Name"
    
    If pe.Exports.functions.Count = 0 Then
        MsgBox "No Exports Found in this File", vbInformation
        Exit Sub
    End If
    
    For Each exp In pe.Exports.functions
        push ret(), exp.FunctionOrdial & vbTab & Hex(exp.FunctionAddress) & vbTab & exp.FunctionName
    Next
    
    frmLister.ShowList ret
    
End Sub

Private Sub Command1_Click()
    Dim st As Long, et As Long
    
    st = GetTickCount
    
    If Not pe.LoadFile(txtFile) Then
        MsgBox pe.errMessage
        isLoaded = False
    Else
        isLoaded = True
        txtImpHash = pe.impHash
        et = GetTickCount
        txtLoadTime = ((et - st) / 1000) & "s"
        
        chkx64.value = IIf(pe.is64Bit, 1, 0)
        txtEntryPoint = pe.OptionalHeader.EntryPoint
        txtImageBase = pe.OptionalHeader.ImageBase
        txtExportTable = pe.OptionalHeader.ddVirtualAddress(Export_Table)
        txtImportTable = pe.OptionalHeader.ddVirtualAddress(Import_Table)
        txtImportAddressTable = pe.OptionalHeader.ddVirtualAddress(Import_Address_Table)
        txtCompiled = pe.CompiledDate
        toHex txtImageBase, txtEntryPoint, txtExportTable, txtImportTable, txtImportAddressTable
    
        FilloutListView lvSects, pe.Sections
        
    End If
    
    
End Sub

Private Sub txtFile_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, Y As Single)
    txtFile = Data.Files(1)
End Sub



Function toHex(ParamArray elems())
    On Error Resume Next
    Dim i As Long
    For i = 0 To UBound(elems)
        elems(i).Text = Hex(elems(i).Text)
    Next
End Function



Sub push(ary, value) 'this modifies parent ary object
    On Error GoTo init
    Dim x As Long
    x = UBound(ary) '<-throws Error If Not initalized
    ReDim Preserve ary(UBound(ary) + 1)
    ary(UBound(ary)) = value
    Exit Sub
init:     ReDim ary(0): ary(0) = value
End Sub

Function GetHextxt(t As TextBox, v As Long) As Boolean
    
    On Error Resume Next
    v = CLng("&h" & t)
    If Err.Number > 0 Then
        MsgBox "Error " & t.Text & " is not valid hex number", vbInformation
        Exit Function
    End If
    
    GetHextxt = True
    
End Function



Sub Enable(t As TextBox, Optional enabled = True)
    t.BackColor = IIf(enabled, vbWhite, &H80000004)
    t.enabled = enabled
    t.Text = Empty
End Sub

Function Align(ByVal valu) As Long
    While valu Mod 16 <> 0
        valu = valu + 1
    Wend
    Align = valu
End Function

Function FileExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
End Function


Sub ConfigureListView(lv As Object)
        
        Dim i As Integer
        
        lv.FullRowSelect = True
        lv.GridLines = True
        lv.HideColumnHeaders = False
        lv.View = 3 'lvwReport
    
        lv.ColumnHeaders.Clear
        lv.ColumnHeaders.Add , , "Section Name"
        lv.ColumnHeaders.Add , , "VirtualAddr"
        lv.ColumnHeaders.Add , , "VirtualSize"
        lv.ColumnHeaders.Add , , "RawOffset"
        lv.ColumnHeaders.Add , , "RawSize"
        lv.ColumnHeaders.Add , , "Characteristics"
        
        lv.Width = (1250 * 6) + 250
        lv.Height = 1800
        
        For i = 1 To 6
            lv.ColumnHeaders(i).Width = 1250
        Next
        
End Sub

Sub FilloutListView(lv As Object, Sections As Collection)
        
    If Sections.Count = 0 Then
        MsgBox "Sections not loaded yet"
        Exit Sub
    End If
    
    Dim cs As CSection, li As Object 'ListItem
    lv.ListItems.Clear
    
    For Each cs In Sections
        Set li = lv.ListItems.Add(, , cs.nameSec)
        li.SubItems(1) = Hex(cs.VirtualAddress)
        li.SubItems(2) = Hex(cs.VirtualSize)
        li.SubItems(3) = Hex(cs.PointerToRawData)
        li.SubItems(4) = Hex(cs.SizeOfRawData)
        li.SubItems(5) = Hex(cs.Characteristics)
    Next
    
    Dim i As Integer
    For i = 1 To lv.ColumnHeaders.Count
        lv.ColumnHeaders(i).Width = 1000
    Next
    With lv.ColumnHeaders(i - 1)
        .Width = lv.Width - .Left - 100
    End With
    
    
End Sub

Function HexDump2(b() As Byte, Optional hexOnly = 0) As String
    Dim tmp As String
    tmp = StrConv(b, vbUnicode)
    HexDump2 = HexDump(tmp, hexOnly)
End Function

Function HexDump(ByVal str, Optional hexOnly = 0) As String
    Dim s() As String, chars As String, tmp As String
    On Error Resume Next
    Dim ary() As Byte
    Dim offset As Long
    Const LANG_US = &H409
    
    offset = 0
    str = " " & str
    ary = StrConv(str, vbFromUnicode, LANG_US)
    
    chars = "   "
    For i = 1 To UBound(ary)
        tt = Hex(ary(i))
        If Len(tt) = 1 Then tt = "0" & tt
        tmp = tmp & tt & " "
        x = ary(i)
        'chars = chars & IIf((x > 32 And x < 127) Or x > 191, Chr(x), ".") 'x > 191 causes \x0 problems on non us systems... asc(chr(x)) = 0
        chars = chars & IIf((x > 32 And x < 127), Chr(x), ".")
        If i > 1 And i Mod 16 = 0 Then
            h = Hex(offset)
            While Len(h) < 6: h = "0" & h: Wend
            If hexOnly = 0 Then
                push s, h & "   " & tmp & chars
            Else
                push s, tmp
            End If
            offset = offset + 16
            tmp = Empty
            chars = "   "
        End If
    Next
    'if read length was not mod 16=0 then
    'we have part of line to account for
    If tmp <> Empty Then
        If hexOnly = 0 Then
            h = Hex(offset)
            While Len(h) < 6: h = "0" & h: Wend
            h = h & "   " & tmp
            While Len(h) <= 56: h = h & " ": Wend
            push s, h & chars
        Else
            push s, tmp
        End If
    End If
    
    HexDump = Join(s, vbCrLf)
    
    If hexOnly <> 0 Then
        HexDump = Replace(HexDump, " ", "")
        HexDump = Replace(HexDump, vbCrLf, "")
    End If
    
End Function



