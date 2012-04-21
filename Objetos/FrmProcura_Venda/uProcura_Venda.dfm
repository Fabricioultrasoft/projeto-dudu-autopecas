object frmProcura_Venda: TfrmProcura_Venda
  Left = 187
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio - Procurar Venda'
  ClientHeight = 567
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlProcura: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 52
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbl5: TLabel
      Left = 16
      Top = 5
      Width = 189
      Height = 38
      Caption = 'N'#186' da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtNVenda: TEdit
      Left = 211
      Top = 2
      Width = 334
      Height = 48
      AutoSize = False
      TabOrder = 0
      OnChange = edtNVendaChange
    end
    object btnCarregaVenda: TBitBtn
      Left = 671
      Top = 5
      Width = 258
      Height = 41
      Cursor = crHandPoint
      Caption = '&F1 - Carregar Venda'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnCarregaVendaClick
    end
  end
  object grdItemVenda: TDBGrid
    Left = 0
    Top = 202
    Width = 938
    Height = 328
    Align = alClient
    DataSource = dm.dtsItem_Venda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
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
        Title.Caption = 'ITEM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REF_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'REFER'#202'NCIA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 241
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'VAL. PROD.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL PROD.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'TP. ENTRADA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 107
        Visible = True
      end>
  end
  object pnlInformacao: TPanel
    Left = 0
    Top = 52
    Width = 938
    Height = 150
    Align = alTop
    TabOrder = 1
    object grp1: TGroupBox
      Left = 20
      Top = 6
      Width = 897
      Height = 131
      Caption = 'Informa'#231#245'es da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 51
        Top = 40
        Width = 79
        Height = 19
        Caption = 'N'#186' Venda: '
      end
      object lbl2: TLabel
        Left = 464
        Top = 40
        Width = 84
        Height = 19
        Caption = 'Valor Total:'
      end
      object lbl3: TLabel
        Left = 16
        Top = 96
        Width = 109
        Height = 19
        Caption = 'Data da Venda:'
      end
      object lbl4: TLabel
        Left = 463
        Top = 96
        Width = 85
        Height = 19
        Caption = 'Pagamento:'
      end
      object dbtNVenda: TDBText
        Left = 146
        Top = 28
        Width = 201
        Height = 33
        DataField = 'N_VENDA'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtDataVenda: TDBText
        Left = 146
        Top = 84
        Width = 238
        Height = 38
        DataField = 'DATA_VENDA'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtValorTotal: TDBText
        Left = 564
        Top = 28
        Width = 225
        Height = 33
        DataField = 'VAL_TOTAL'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtPagamento: TDBText
        Left = 564
        Top = 84
        Width = 225
        Height = 30
        DataField = 'TIPO_PAGAMENTO'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 530
    Width = 938
    Height = 37
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 529
    object lbl6: TLabel
      Left = 0
      Top = 12
      Width = 400
      Height = 18
      Alignment = taCenter
      Caption = 'Pressione: ESC >> Fechar       ENTER >> Carregar Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
end
