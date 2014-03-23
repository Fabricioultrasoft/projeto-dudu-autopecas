object frmProcura_Fornecedor: TfrmProcura_Fornecedor
  Left = 353
  Top = 194
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 488
  ClientWidth = 854
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
    Width = 854
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Fornecedor'
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
    Width = 854
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 198
      Height = 16
      Caption = 'Pesquisar por Nome/Raz'#227'o Social:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 220
      Top = 1
      Width = 633
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
    Width = 854
    Height = 353
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsFornecedor
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
    OnDblClick = dbgrdFornDblClick
    OnKeyPress = dbgrdFornKeyPress
    OnTitleClick = dbgrdFornTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_FORN'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FORN'
        Title.Alignment = taCenter
        Title.Caption = 'NOME/RAZ'#195'O SOCIAL'
        Width = 301
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONE'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFONE'
        Width = 143
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REPRESENTANTE'
        Title.Alignment = taCenter
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONE_REPRES'
        Title.Alignment = taCenter
        Title.Caption = 'TELEFONE REPRES.'
        Width = 116
        Visible = True
      end>
  end
  object Panel4: TPanel
    Left = 0
    Top = 451
    Width = 854
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
      Left = 11
      Top = 9
      Width = 610
      Height = 18
      Alignment = taCenter
      Caption = 
        'Pressione: ESC >> Fechar       ENTER >> Selecionar Registro     ' +
        '   F5 -> Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
end
