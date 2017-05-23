VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Ejemplo de como poner im�genes en la barra de men�"
   ClientHeight    =   4770
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   7095
   LinkTopic       =   "Form2"
   ScaleHeight     =   4770
   ScaleWidth      =   7095
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu Mnu_0 
      Caption         =   "Men�_0"
      Begin VB.Menu SubMnu0_0 
         Caption         =   "SubMen�_0"
         Index           =   0
      End
      Begin VB.Menu SubMnu0_1 
         Caption         =   "SubMen�_1"
         Index           =   1
      End
      Begin VB.Menu SubMnu0_2 
         Caption         =   "SubMen�_2"
         Index           =   2
      End
   End
   Begin VB.Menu Mnu_1 
      Caption         =   "Men�_1"
      Begin VB.Menu SubMnu1_0 
         Caption         =   "SubMen�_0"
         Index           =   0
      End
      Begin VB.Menu SubMnu1_0 
         Caption         =   "SubMen�_1"
         Index           =   1
      End
      Begin VB.Menu SubMnu1_0 
         Caption         =   "SubMen�_2"
         Index           =   2
      End
   End
   Begin VB.Menu Mnu_2 
      Caption         =   "Men�_2"
      Begin VB.Menu SubMnu2_0 
         Caption         =   "SubMen�_0"
         Index           =   0
      End
      Begin VB.Menu SubMnu2_0 
         Caption         =   "SubMen�_1"
         Index           =   1
      End
      Begin VB.Menu SubMnu2_0 
         Caption         =   "SubMen�_2"
         Index           =   2
      End
   End
   Begin VB.Menu Mnu3_0 
      Caption         =   "Men�_3"
      Begin VB.Menu SubMnu3_0 
         Caption         =   "SubMen�_0"
         Index           =   0
      End
      Begin VB.Menu SubMnu3_0 
         Caption         =   "SubMen�_1"
         Index           =   1
      End
      Begin VB.Menu SubMnu3_0 
         Caption         =   "SubMen�_2"
         Index           =   2
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
 
' ------------------------------------------------------
' Autor:    Leandro I. Ascierto
' Fecha:    17 de Julio de 2010
' Web:      www.leandroascierto.com.ar
' ------------------------------------------------------

Dim cMenuImage As clsMenuImage


Private Sub Form_Load()

    Dim i As Long
    Set cMenuImage = New clsMenuImage

    With cMenuImage
        ' Inicializamos la clase e indicamos que queremos mostrar im�genes de 22x22.
        .Init Me.HWnd, 22, 22
        
        ' Cargamos cuatro im�genes PNG desde archivo.
        
        For i = 1 To 4
           .AddImageFromFile App.Path & "\Iconos PNG\Icon" & i & ".PNG"
        Next
        
        ' El primer par�metro es el ID de la im�gen en la lista interna de la clase.
        ' El segundo par�metro es la posici�n del men� (comienza desde cero).
        ' Al no indicar un tercer par�metro significa que la im�gen estar� en la barra de men�.
        .PutImageToVBMenu 0, 0
        .PutImageToVBMenu 1, 1
        .PutImageToVBMenu 2, 2
        .PutImageToVBMenu 3, 3
                
        ' Cargamos cuatro im�genes ICO desde archivo.
        For i = 1 To 4
           .AddImageFromFile App.Path & "\Iconos ICO\Icon" & i & ".ICO"
        Next
        
        ' Asignamos tres im�genes al primer PopUpMen�.
        .PutImageToVBMenu 4, 0, 0
        .PutImageToVBMenu 5, 1, 0
        .PutImageToVBMenu 6, 2, 0
        
        ' Si no es en Windows Vista o Windows 7 removemos el style check del men�.
        If Not .IsWindowVistaOrLater Then
            .RemoveMenuCheckVB 0 ' (Menu_0)
        End If

    End With
       
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Set cMenuImage = Nothing            ' Descargamos la clase.
End Sub
