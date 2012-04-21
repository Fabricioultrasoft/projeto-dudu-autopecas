object frmProcura_Produto: TfrmProcura_Produto
  Left = 155
  Top = 155
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 620
  ClientWidth = 924
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
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 924
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 854
    object lbl2: TLabel
      Left = 32
      Top = 11
      Width = 157
      Height = 19
      Caption = 'Pesquisar por C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 198
      Top = 2
      Width = 260
      Height = 37
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ConsultaUniversalChange
      OnKeyPress = Enter
    end
  end
  object grdProd: TDBGrid
    Left = 0
    Top = 139
    Width = 924
    Height = 270
    Cursor = crHandPoint
    Align = alTop
    DataSource = dm.dtsProduto
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grdProdDblClick
    OnKeyPress = grdProdKeyPress
    OnTitleClick = grdProdTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
        Width = 378
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTOQUE_MINIMO'
        Title.Alignment = taCenter
        Title.Caption = 'ESTOQUE MINIMO'
        Width = 124
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UND'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'GRUPO'
        Width = 181
        Visible = True
      end>
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 854
  end
  object Panel3: TPanel
    Left = 0
    Top = 98
    Width = 924
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 854
    object Label2: TLabel
      Left = 482
      Top = 12
      Width = 174
      Height = 19
      Caption = 'Pesquisar por Aplica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 16
      Top = 11
      Width = 174
      Height = 19
      Caption = 'Pesquisar por Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtAplicacao: TEdit
      Left = 662
      Top = 1
      Width = 260
      Height = 37
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = ConsultaUniversalChange
      OnKeyPress = Enter
    end
    object edtDescricao: TEdit
      Left = 198
      Top = 1
      Width = 260
      Height = 37
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ConsultaUniversalChange
      OnKeyPress = Enter
    end
  end
  object pnlAplicacao: TPanel
    Left = 0
    Top = 408
    Width = 924
    Height = 175
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 5
    BorderWidth = 5
    BorderStyle = bsSingle
    TabOrder = 4
    ExplicitWidth = 854
    object Label3: TLabel
      Left = 16
      Top = 59
      Width = 73
      Height = 19
      Caption = 'Aplica'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object mmAplicacao: TDBRichEdit
      Left = 104
      Top = 5
      Width = 809
      Height = 162
      DataField = 'APLICACAO'
      DataSource = dm.dtsProduto
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 583
    Width = 924
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    ExplicitWidth = 854
    object Label4: TLabel
      Left = 0
      Top = 8
      Width = 607
      Height = 18
      Alignment = taCenter
      Caption = 
        'Pressione: ESC >> Fechar       ENTER >> Selecionar Registro     ' +
        ' F5 >> Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
end
