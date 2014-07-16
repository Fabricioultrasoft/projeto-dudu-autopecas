object frmVendas_Produto: TfrmVendas_Produto
  Left = 485
  Top = 242
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio :- Rela'#231#227'o de Produtos Vendidos'
  ClientHeight = 570
  ClientWidth = 780
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 73
    Align = alTop
    Caption = 'Rela'#231#227'o de Produtos Vendidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -37
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 780
    Height = 48
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 57
    object lbl1: TLabel
      Left = 34
      Top = 16
      Width = 117
      Height = 16
      Caption = 'Intervalo  de Datas: '
    end
    object lbl4: TLabel
      Left = 207
      Top = 16
      Width = 68
      Height = 16
      Caption = 'Data Inicial:'
    end
    object lbl5: TLabel
      Left = 499
      Top = 16
      Width = 62
      Height = 16
      Caption = 'Data Final:'
    end
    object dtpInicial: TDateTimePicker
      Left = 281
      Top = 13
      Width = 129
      Height = 24
      Cursor = crHandPoint
      Date = 40966.515096493060000000
      Time = 40966.515096493060000000
      TabOrder = 0
    end
    object dtpFinal: TDateTimePicker
      Left = 568
      Top = 13
      Width = 129
      Height = 24
      Cursor = crHandPoint
      Date = 40966.515349270830000000
      Time = 40966.515349270830000000
      TabOrder = 1
      OnChange = dtpFinalChange
    end
  end
  object grdVendas: TDBGrid
    Left = 0
    Top = 169
    Width = 780
    Height = 351
    Align = alClient
    DataSource = dm.dtsVenda_Fornecedor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = grdVendasTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO DE BARRA'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
        Width = 203
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_FORN'
        Title.Alignment = taCenter
        Title.Caption = 'COD. FORNECEDOR'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESC_FORN'
        Title.Alignment = taCenter
        Title.Caption = 'FORNECEDOR'
        Width = 177
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA DO LAN'#199'AMENTO'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL DE PE'#199'AS'
        Visible = True
      end>
  end
  object pnl3: TPanel
    Left = 0
    Top = 520
    Width = 780
    Height = 50
    Align = alBottom
    TabOrder = 4
    object btnFechar: TBitBtn
      Left = 652
      Top = 7
      Width = 121
      Height = 35
      Hint = 'FECHAR FORMUL'#193'RIO'
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkCancel
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnImprimir: TBitBtn
      Left = 520
      Top = 7
      Width = 121
      Height = 35
      Hint = 'GERAR RELAT'#211'RIO'
      Caption = '&F1 - Imprimir'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 121
    Width = 780
    Height = 48
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl2: TLabel
      Left = 9
      Top = 16
      Width = 189
      Height = 16
      Caption = 'Informe Produto ou Fornecedor: '
    end
    object edtFornecedor: TEdit
      Left = 207
      Top = 1
      Width = 572
      Height = 46
      Align = alRight
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edtFornecedorChange
      ExplicitHeight = 48
    end
  end
end
