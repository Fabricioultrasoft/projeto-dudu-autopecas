object frmProcura_Produto: TfrmProcura_Produto
  Left = 270
  Top = 98
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
    object lbl5: TLabel
      Left = 18
      Top = 6
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
      Left = 251
      Top = 1
      Width = 667
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
    Top = 98
    Width = 924
    Height = 485
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsProduto
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
    OnDblClick = grdProdDblClick
    OnKeyPress = grdProdKeyPress
    OnTitleClick = grdProdTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO DE BARRA'
        Width = 130
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
        FieldName = 'UND_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'UND DE VENDA'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_GRUPO'
        Title.Alignment = taCenter
        Title.Caption = 'GRUPO'
        Width = 168
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
    TabOrder = 3
    object Label4: TLabel
      Left = 12
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
