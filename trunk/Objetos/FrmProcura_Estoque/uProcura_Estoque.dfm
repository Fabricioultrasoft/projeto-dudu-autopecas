object frmProcura_Estoque: TfrmProcura_Estoque
  Left = 116
  Top = 118
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 722
  ClientWidth = 1103
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1103
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 98
    Width = 1103
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbl5: TLabel
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
    object lbl3: TLabel
      Left = 609
      Top = 12
      Width = 180
      Height = 19
      Caption = 'Pesquisar por Refer'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtReferencia: TEdit
      Left = 808
      Top = 2
      Width = 294
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
    object edtCodigo: TEdit
      Left = 208
      Top = 2
      Width = 300
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
  object pnlTipo: TPanel
    Left = 0
    Top = 57
    Width = 1103
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 36
    object rgOpcao: TRadioGroup
      AlignWithMargins = True
      Left = 51
      Top = 1
      Width = 1001
      Height = 39
      Margins.Left = 50
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 0
      Align = alClient
      Anchors = []
      Columns = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'F1 -> Geral'
        'F2 -> C'
        'F3 -> S')
      ParentFont = False
      TabOrder = 0
      OnClick = rgOpcaoClick
      ExplicitWidth = 766
    end
  end
  object grdEstoque: TDBGrid
    Left = 0
    Top = 221
    Width = 1103
    Height = 307
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsEstoque
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grdEstoqueDrawColumnCell
    OnDblClick = grdEstoqueDblClick
    OnKeyPress = grdEstoqueKeyPress
    OnTitleClick = grdEstoqueTitleClick
    Columns = <
      item
        Alignment = taCenter
        Color = clSkyBlue
        Expanded = False
        FieldName = 'TIPO_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REF_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'REFER'#202'NCIA'
        Width = 108
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'CODIGO'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRIC'#195'O DO PRODUTO'
        Width = 309
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Title.Caption = 'ESTOQUE ATUAL'
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTOQUE_MINIMO'
        Title.Alignment = taCenter
        Title.Caption = 'ESTOQUE MINIMO'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UND'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_CUSTO'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR DE CUSTO'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VAL_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR DE VENDA'
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DESC_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'GRUPO'
        Width = 157
        Visible = True
      end>
  end
  object pnlAplicacao: TPanel
    Left = 0
    Top = 528
    Width = 1103
    Height = 157
    Align = alBottom
    BevelOuter = bvNone
    BevelWidth = 5
    BorderWidth = 5
    BorderStyle = bsSingle
    TabOrder = 6
    object Label3: TLabel
      Left = 16
      Top = 70
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
      Left = 136
      Top = 6
      Width = 961
      Height = 142
      DataField = 'APLICACAO'
      DataSource = dm.dtsEstoque
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
    Top = 685
    Width = 1103
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label4: TLabel
      Left = 16
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
  object pnl1: TPanel
    Left = 0
    Top = 139
    Width = 1103
    Height = 41
    Align = alTop
    TabOrder = 3
    object lbl1: TLabel
      Left = 615
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
    object lbl4: TLabel
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
      Left = 808
      Top = 2
      Width = 294
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
      Left = 208
      Top = 0
      Width = 300
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
  object pnl2: TPanel
    Left = 0
    Top = 180
    Width = 1103
    Height = 41
    Align = alTop
    TabOrder = 4
    object lbl2: TLabel
      Left = 91
      Top = 12
      Width = 103
      Height = 19
      Caption = 'Qtde m'#237'nima: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtQtde: TEdit
      Left = 208
      Top = 2
      Width = 300
      Height = 37
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -28
      Font.Name = 'Arial Black'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnChange = ConsultaUniversalChange
      OnKeyPress = Enter
    end
  end
end
