object frmProcura_Estoque: TfrmProcura_Estoque
  Left = 391
  Top = 189
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 637
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
    Top = 57
    Width = 1103
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl5: TLabel
      Left = 32
      Top = 11
      Width = 227
      Height = 19
      Caption = 'Informe o C'#243'digo ou Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 270
      Top = 1
      Width = 611
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
    object ckbQtdeZero: TCheckBox
      Left = 896
      Top = 12
      Width = 201
      Height = 17
      Cursor = crHandPoint
      Caption = 'Exibir produtos com saldo zero'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = ckbQtdeZeroClick
    end
  end
  object grdEstoque: TDBGrid
    Left = 0
    Top = 98
    Width = 1103
    Height = 502
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
    TabOrder = 2
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
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO DE BARRA'
        Width = 140
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
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESTOQUE_MINIMO'
        Title.Alignment = taCenter
        Title.Caption = 'ESTOQUE MINIMO'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UND_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'UND DE VENDA'
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
        Width = 165
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 600
    Width = 1103
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 606
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
    object shpAmarelo: TShape
      Left = 840
      Top = 21
      Width = 41
      Height = 11
    end
    object shpVermelho: TShape
      Left = 840
      Top = 5
      Width = 41
      Height = 11
    end
    object lbl1: TLabel
      Left = 886
      Top = 2
      Width = 161
      Height = 14
      Caption = '- Saldo abaixo do estoque m'#237'nimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 886
      Top = 18
      Width = 153
      Height = 14
      Caption = '- Saldo igual ou menor que zero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
  end
end
