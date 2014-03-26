object frmProcuraDevolucao: TfrmProcuraDevolucao
  Left = 652
  Top = 192
  BorderStyle = bsNone
  Caption = 'frmProcuraDevolucao'
  ClientHeight = 497
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 933
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Devolu'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 57
    Width = 933
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl5: TLabel
      Left = 18
      Top = 6
      Width = 314
      Height = 19
      Caption = 'Informe o N'#186' da Venda ou C'#243'digo de Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 338
      Top = 1
      Width = 595
      Height = 37
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtCodigoChange
    end
  end
  object grdProd: TDBGrid
    Left = 0
    Top = 98
    Width = 933
    Height = 362
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsDevolucao
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
    OnDrawColumnCell = grdProdDrawColumnCell
    OnDblClick = grdProdDblClick
    OnKeyPress = grdProdKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'N_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' DA VENDA'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_DEVOLUCAO'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO DA DEVOLUCAO'
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Width = 130
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO PRODUTO'
        Width = 230
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VALOR_ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR DO ITEM'
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 460
    Width = 933
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl1: TLabel
      Left = 12
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
    object lbl6: TLabel
      Left = 735
      Top = 19
      Width = 192
      Height = 11
      Caption = '* Devolu'#231#245'es finalizadas em vermelho.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
