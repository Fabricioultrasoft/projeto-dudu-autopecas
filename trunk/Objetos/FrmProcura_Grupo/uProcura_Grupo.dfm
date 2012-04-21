object frmProcura_Grupo: TfrmProcura_Grupo
  Left = 777
  Top = 176
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 351
  ClientWidth = 462
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 462
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 142
      Height = 16
      Caption = 'Pesquisar por Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 164
      Top = 1
      Width = 297
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
  object dbgrdForn: TDBGrid
    Left = 0
    Top = 98
    Width = 462
    Height = 216
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsGrupo
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
    OnKeyPress = dbgrdFornKeyPress
    OnTitleClick = dbgrdFornTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO GRUPO'
        Width = 336
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 314
    Width = 462
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
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
