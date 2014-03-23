object frmRelatorio: TfrmRelatorio
  Left = 552
  Top = 178
  Width = 949
  Height = 588
  AutoScroll = True
  Caption = 'frmRelatorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object rlCliente: TRLReport
    Left = 56
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dm.dtsCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object RLBCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel1: TRLLabel
        Left = 213
        Top = 10
        Width = 323
        Height = 32
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Clientes'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object RLBColuna: TRLBand
      Left = 38
      Top = 89
      Width = 718
      Height = 24
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 184
        Top = 6
        Width = 123
        Height = 13
        Caption = 'Nome / Raz'#227'o Social'
      end
      object RLLabel3: TRLLabel
        Left = 32
        Top = 6
        Width = 44
        Height = 13
        Caption = 'C'#243'digo'
      end
      object RLLabel4: TRLLabel
        Left = 464
        Top = 6
        Width = 60
        Height = 13
        Caption = 'CNPJ/CPF'
      end
      object RLLabel5: TRLLabel
        Left = 601
        Top = 6
        Width = 31
        Height = 13
        Caption = 'Fone'
      end
    end
    object RLBDados: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Completion = ctFullPage
      object RLDBText1: TRLDBText
        Left = 28
        Top = 5
        Width = 58
        Height = 13
        Alignment = taCenter
        DataField = 'COD_CLI'
        DataSource = dm.dtsCliente
      end
      object RLDBText2: TRLDBText
        Left = 120
        Top = 5
        Width = 305
        Height = 13
        DataField = 'NOME_RAZAO'
        DataSource = dm.dtsCliente
      end
      object RLDBText3: TRLDBText
        Left = 463
        Top = 5
        Width = 62
        Height = 13
        Alignment = taCenter
        DataField = 'CNPJ_CPF'
        DataSource = dm.dtsCliente
      end
      object RLDBText4: TRLDBText
        Left = 600
        Top = 5
        Width = 34
        Height = 13
        Alignment = taCenter
        DataField = 'FONE'
        DataSource = dm.dtsCliente
      end
    end
    object RLBRodape: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 24
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel6: TRLLabel
        Left = 597
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Data:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 656
        Top = 8
        Width = 41
        Height = 13
        Alignment = taCenter
      end
    end
  end
  object rlFornecedor: TRLReport
    Left = 56
    Top = 1165
    Width = 794
    Height = 1123
    DataSource = dm.dtsFornecedor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object RLBand1: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 24
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel7: TRLLabel
        Left = 597
        Top = 8
        Width = 42
        Height = 14
        Caption = 'Data:'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 656
        Top = 8
        Width = 41
        Height = 13
        Alignment = taCenter
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Completion = ctFullPage
      object RLDBText5: TRLDBText
        Left = 25
        Top = 5
        Width = 64
        Height = 14
        Alignment = taCenter
        DataField = 'COD_FORN'
        DataSource = dm.dtsFornecedor
      end
      object RLDBText6: TRLDBText
        Left = 120
        Top = 5
        Width = 70
        Height = 14
        DataField = 'DESC_FORN'
        DataSource = dm.dtsFornecedor
      end
      object RLDBText7: TRLDBText
        Left = 436
        Top = 5
        Width = 36
        Height = 14
        Alignment = taCenter
        DataField = 'FONE'
        DataSource = dm.dtsFornecedor
      end
      object RLDBText8: TRLDBText
        Left = 623
        Top = 5
        Width = 84
        Height = 14
        Alignment = taCenter
        DataField = 'FONE_REPRES'
        DataSource = dm.dtsFornecedor
      end
      object RLDBText9: TRLDBText
        Left = 504
        Top = 6
        Width = 98
        Height = 14
        Alignment = taCenter
        DataField = 'REPRESENTANTE'
        DataSource = dm.dtsFornecedor
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 89
      Width = 718
      Height = 24
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel8: TRLLabel
        Left = 184
        Top = 6
        Width = 140
        Height = 14
        Caption = 'Nome / Raz'#227'o Social'
      end
      object RLLabel9: TRLLabel
        Left = 32
        Top = 6
        Width = 49
        Height = 14
        Caption = 'C'#243'digo'
      end
      object RLLabel10: TRLLabel
        Left = 433
        Top = 6
        Width = 42
        Height = 14
        Caption = 'Fone:'
      end
      object RLLabel11: TRLLabel
        Left = 644
        Top = 6
        Width = 35
        Height = 14
        Caption = 'Fone'
      end
      object RLLabel13: TRLLabel
        Left = 504
        Top = 6
        Width = 98
        Height = 14
        Caption = 'Representante'
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel12: TRLLabel
        Left = 170
        Top = 10
        Width = 408
        Height = 32
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Fornecedores'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
  end
  object RLProduto: TRLReport
    Left = 56
    Top = 2314
    Width = 794
    Height = 1123
    DataSource = dm.dtsProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel14: TRLLabel
        Left = 99
        Top = 10
        Width = 536
        Height = 32
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Produtos Cadastrados'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 89
      Width = 718
      Height = 24
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel15: TRLLabel
        Left = 159
        Top = 6
        Width = 147
        Height = 14
        Caption = 'Descri'#231#227'o do Produto'
      end
      object RLLabel16: TRLLabel
        Left = 32
        Top = 6
        Width = 49
        Height = 14
        Caption = 'C'#243'digo'
      end
      object RLLabel17: TRLLabel
        Left = 359
        Top = 6
        Width = 105
        Height = 14
        Caption = 'Estoque M'#237'nimo'
      end
      object RLLabel18: TRLLabel
        Left = 599
        Top = 6
        Width = 42
        Height = 14
        Caption = 'Grupo'
      end
      object RLLabel19: TRLLabel
        Left = 473
        Top = 6
        Width = 98
        Height = 14
        Caption = 'UND de Compra'
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Completion = ctFullPage
      object RLDBText10: TRLDBText
        Left = 36
        Top = 5
        Width = 42
        Height = 14
        Alignment = taCenter
        DataField = 'EAN13'
        DataSource = dm.dtsProduto
      end
      object RLDBText11: TRLDBText
        Left = 120
        Top = 5
        Width = 70
        Height = 14
        DataField = 'DESC_PROD'
        DataSource = dm.dtsProduto
      end
      object RLDBText12: TRLDBText
        Left = 358
        Top = 5
        Width = 106
        Height = 14
        Alignment = taCenter
        DataField = 'ESTOQUE_MINIMO'
        DataSource = dm.dtsProduto
      end
      object RLDBText13: TRLDBText
        Left = 580
        Top = 5
        Width = 78
        Height = 14
        DataField = 'DESC_GRUPO'
        DataSource = dm.dtsProduto
      end
      object RLDBText14: TRLDBText
        Left = 484
        Top = 6
        Width = 70
        Height = 14
        Alignment = taCenter
        DataField = 'UND_VENDA'
        DataSource = dm.dtsProduto
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 24
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel20: TRLLabel
        Left = 597
        Top = 8
        Width = 42
        Height = 14
        Caption = 'Data:'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 656
        Top = 8
        Width = 41
        Height = 13
        Alignment = taCenter
      end
    end
  end
  object RLEstoque: TRLReport
    Left = 56
    Top = 3455
    Width = 794
    Height = 1123
    DataSource = dm.dtsEstoque
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    PreviewOptions.ShowModal = True
    object RLBand9: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      Color = clSilver
      ParentColor = False
      Transparent = False
      object RLLabel21: TRLLabel
        Left = 205
        Top = 10
        Width = 324
        Height = 32
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Estoque'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -27
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand10: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 24
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel22: TRLLabel
        Left = 597
        Top = 8
        Width = 42
        Height = 14
        Caption = 'Data:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 656
        Top = 8
        Width = 41
        Height = 13
        Alignment = taCenter
      end
    end
    object RLBand11: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Completion = ctFullPage
      object RLDBText15: TRLDBText
        Left = 36
        Top = 5
        Width = 42
        Height = 14
        Alignment = taCenter
        DataField = 'EAN13'
        DataSource = dm.dtsEstoque
      end
      object RLDBText16: TRLDBText
        Left = 120
        Top = 5
        Width = 70
        Height = 14
        DataField = 'DESC_PROD'
        DataSource = dm.dtsEstoque
      end
      object RLDBText17: TRLDBText
        Left = 358
        Top = 5
        Width = 106
        Height = 14
        Alignment = taCenter
        DataField = 'ESTOQUE_MINIMO'
        DataSource = dm.dtsEstoque
      end
      object RLDBText18: TRLDBText
        Left = 515
        Top = 5
        Width = 35
        Height = 14
        DataField = 'QTDE'
        DataSource = dm.dtsEstoque
      end
      object RLDBText19: TRLDBText
        Left = 613
        Top = 4
        Width = 70
        Height = 14
        Alignment = taCenter
        DataField = 'UND_VENDA'
        DataSource = dm.dtsEstoque
      end
    end
    object RLBand12: TRLBand
      Left = 38
      Top = 89
      Width = 718
      Height = 24
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLLabel23: TRLLabel
        Left = 159
        Top = 6
        Width = 147
        Height = 14
        Caption = 'Descri'#231#227'o do Produto'
      end
      object RLLabel24: TRLLabel
        Left = 32
        Top = 6
        Width = 49
        Height = 14
        Caption = 'C'#243'digo'
      end
      object RLLabel25: TRLLabel
        Left = 359
        Top = 6
        Width = 105
        Height = 14
        Caption = 'Estoque M'#237'nimo'
      end
      object RLLabel26: TRLLabel
        Left = 494
        Top = 6
        Width = 77
        Height = 14
        Caption = 'Qtde Atual'
      end
      object RLLabel27: TRLLabel
        Left = 601
        Top = 6
        Width = 91
        Height = 14
        Caption = 'UND de Venda'
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v1.0 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 128
    Top = 224
  end
end
