object frmRelatorio: TfrmRelatorio
  Left = 231
  Top = 138
  Width = 338
  Height = 366
  AutoScroll = True
  Caption = 'frmRelatorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 16
  object RvPrjReport: TRvProject
    Engine = RvSystem
    Left = 72
    Top = 19
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Op'#231#245'es de Sa'#237'da'
    TitleStatus = 'Status de Relat'#243'rio'
    TitlePreview = 'Visuali'#231#227'o do Relat'#243'rio'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 192
    Top = 23
  end
  object rvDtsProdutos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.cdsProduto
    Left = 64
    Top = 107
  end
  object rvDtsEstoque: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.cdsEstoque
    Left = 192
    Top = 107
  end
  object rvDtsFornecedor: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.cdsFornecedor
    Left = 64
    Top = 178
  end
  object rvDtsEntrada_Produtos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.cdsEntrada_Produto
    Left = 192
    Top = 178
  end
  object rvDtsVenda_Fornecedor: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = dm.cdsVenda_Fornecedor
    Left = 64
    Top = 250
  end
end
