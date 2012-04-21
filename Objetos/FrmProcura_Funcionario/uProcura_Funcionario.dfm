object frmProcura_Funcionario: TfrmProcura_Funcionario
  Left = 428
  Top = 177
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 351
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Funcion'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -33
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 57
    Width = 454
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 16
      Top = 13
      Width = 120
      Height = 16
      Caption = 'Pesquisar por Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 142
      Top = 1
      Width = 311
      Height = 39
      Align = alRight
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
      OnKeyPress = edtPesquisaKeyPress
      ExplicitHeight = 46
    end
  end
  object grdFunc: TDBGrid
    Left = 0
    Top = 98
    Width = 454
    Height = 216
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsUsuario
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = grdFuncKeyPress
    OnTitleClick = grdFuncTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_USER'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'NOME DO FUNCION'#193'RIO'
        Width = 324
        Visible = True
      end>
  end
  object pnl3: TPanel
    Left = 0
    Top = 314
    Width = 454
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl2: TLabel
      Left = 0
      Top = 8
      Width = 428
      Height = 18
      Alignment = taCenter
      Caption = 'Pressione: ESC >> Fechar       ENTER >> Selecionar Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
end
