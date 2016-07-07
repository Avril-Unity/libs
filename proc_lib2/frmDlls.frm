VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDlls 
   Caption         =   "Dll Viewer"
   ClientHeight    =   4155
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7815
   LinkTopic       =   "Form1"
   ScaleHeight     =   4155
   ScaleWidth      =   7815
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ListView lv 
      Height          =   4155
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7575
      _ExtentX        =   13361
      _ExtentY        =   7329
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Base"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Size"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PATH"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuDumpModule 
         Caption         =   "Dump Module"
      End
   End
End
Attribute VB_Name = "frmDlls"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private curPid As Long
Private selli As ListItem
Dim cpi As New CProcessLib
Public dlg As New clsCmnDlg

Private Sub Form_Load()
    On Error Resume Next
    
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    
End Sub

Private Sub lv_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
    LV_ColumnSort lv, ColumnHeader
End Sub

Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set selli = Item
End Sub

Private Sub lv_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then
        DoEvents
        PopupMenu mnuPopup
    End If
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
'    If Button = 2 Then
'        DoEvents
'        PopupMenu mnuPopup
'    End If
End Sub

Public Sub LV_ColumnSort(ListViewControl As ListView, Column As ColumnHeader)
     On Error Resume Next
    With ListViewControl
       If .SortKey <> Column.index - 1 Then
             .SortKey = Column.index - 1
             .SortOrder = lvwAscending
       Else
             If .SortOrder = lvwAscending Then
              .SortOrder = lvwDescending
             Else
              .SortOrder = lvwAscending
             End If
       End If
       .Sorted = -1
    End With
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    lv.Width = Me.Width - lv.Left - 200
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    lv.Height = Me.Height - lv.Top - 500 - Command1.Height
    Command1.Top = Me.Height - Command1.Height - 400
    Command1.Left = Me.Width - Command1.Width - 400
End Sub

Sub ShowDllsFor(pid As Long, Optional owner As Object)
    On Error Resume Next
    Dim cm As CModule
    Dim c As Collection
    Dim li As ListItem
    
    lv.ListItems.Clear
    curPid = pid
    Set c = cpi.GetProcessModules(pid)
    
    For Each cm In c
        Set li = lv.ListItems.Add(, , cm.HexBase)
        li.SubItems(1) = cm.HexSize
        li.SubItems(2) = cm.path
        Set li.Tag = cm
    Next
    
    Me.Visible = True
    If Not owner Is Nothing Then Me.Show 1, owner
    
End Sub

Private Sub mnuDumpModule_Click()
    If selli Is Nothing Then Exit Sub
    Dim cm As CModule
    Dim pth As String
    
    pth = dlg.SaveDialog(AllFiles, , "Save dump as")
    If Len(pth) = 0 Then Exit Sub
    
    Set cm = selli.Tag
    
    MsgBox "Dump saved? " & cpi.DumpMemory(curPid, cm.HexBase, cm.HexSize, pth)
End Sub
