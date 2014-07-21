object frmConsultaVendas: TfrmConsultaVendas
  Left = 475
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio - Consulta de Vendas'
  ClientHeight = 637
  ClientWidth = 1225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl3: TPanel
    Left = 0
    Top = 587
    Width = 1225
    Height = 50
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 520
    ExplicitWidth = 821
    object btnFechar: TBitBtn
      Left = 1093
      Top = 6
      Width = 121
      Height = 35
      Cursor = crHandPoint
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnImprimir: TBitBtn
      Left = 961
      Top = 6
      Width = 121
      Height = 35
      Cursor = crHandPoint
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  object grdVendas: TDBGrid
    Left = 0
    Top = 121
    Width = 1225
    Height = 466
    Align = alClient
    DataSource = dm.dtsItem_Venda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'ID ITEM'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'N_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' VENDA'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRIA'#199#195'O DO PRODUTO'
        Width = 310
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UND'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR PRODUTO'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCONTO'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR DESCONTO'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL PRODUTO'
        Width = 110
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STATUS'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA CADASTRO'
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 1225
    Height = 48
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitLeft = -8
    ExplicitTop = 57
    ExplicitWidth = 780
    object lbl1: TLabel
      Left = 34
      Top = 16
      Width = 117
      Height = 16
      Caption = 'Intervalo  de Datas: '
    end
    object lbl4: TLabel
      Left = 322
      Top = 16
      Width = 68
      Height = 16
      Caption = 'Data Inicial:'
    end
    object lbl5: TLabel
      Left = 687
      Top = 16
      Width = 62
      Height = 16
      Caption = 'Data Final:'
    end
    object dtpInicial: TDateTimePicker
      Left = 396
      Top = 13
      Width = 129
      Height = 24
      Cursor = crHandPoint
      Date = 41836.515096493060000000
      Time = 41836.515096493060000000
      TabOrder = 0
    end
    object dtpFinal: TDateTimePicker
      Left = 755
      Top = 13
      Width = 129
      Height = 24
      Cursor = crHandPoint
      Date = 41836.515349270830000000
      Time = 41836.515349270830000000
      TabOrder = 1
      OnChange = dtpFinalChange
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 1225
    Height = 73
    Align = alTop
    Caption = 'Rela'#231#227'o de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -37
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    ExplicitTop = -6
  end
end
