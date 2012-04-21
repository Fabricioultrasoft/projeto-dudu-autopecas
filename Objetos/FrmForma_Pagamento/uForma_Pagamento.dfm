object frmForma_Pagamento: TfrmForma_Pagamento
  Left = 225
  Top = 154
  ActiveControl = edtID
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Finalizando Venda'
  ClientHeight = 597
  ClientWidth = 736
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 597
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 662
    ExplicitHeight = 546
    object lbl2: TLabel
      Left = 1
      Top = 578
      Width = 734
      Height = 18
      Align = alBottom
      Caption = 'Pressione: ESC >> Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 527
      ExplicitWidth = 198
    end
    object lblFormaPagamento: TLabel
      Left = 24
      Top = 344
      Width = 289
      Height = 56
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object grp1: TGroupBox
      Left = 407
      Top = 212
      Width = 305
      Height = 269
      Caption = 'Forma de Pagamento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object btnDinheiro: TBitBtn
        Left = 11
        Top = 31
        Width = 272
        Height = 65
        Cursor = crHandPoint
        Hint = 'PAGAMENTO EM DINHEIRO'
        Caption = 'F1 - DINHEIRO'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnClick = btnDinheiroClick
      end
      object btnCartao: TBitBtn
        Left = 11
        Top = 104
        Width = 272
        Height = 65
        Cursor = crHandPoint
        Hint = 'PAGAMENTO NO CART'#195'O'
        Caption = 'F2 - CART'#195'O'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        OnClick = btnCartaoClick
      end
      object btnCheque: TBitBtn
        Left = 11
        Top = 176
        Width = 272
        Height = 65
        Cursor = crHandPoint
        Hint = 'PAGAMENTO EM CHEQUE'
        Caption = 'F3 - CHEQUE'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 2
        OnClick = btnChequeClick
      end
    end
    object grp2: TGroupBox
      Left = 407
      Top = 13
      Width = 305
      Height = 193
      Caption = 'Informa'#231#245'es da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object lbl1: TLabel
        Left = 16
        Top = 30
        Width = 62
        Height = 23
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 16
        Top = 125
        Width = 108
        Height = 23
        Caption = 'ID Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object edtCliente: TEdit
        Left = 16
        Top = 54
        Width = 273
        Height = 31
        NumbersOnly = True
        TabOrder = 0
      end
      object edtID: TEdit
        Left = 16
        Top = 150
        Width = 273
        Height = 31
        NumbersOnly = True
        TabOrder = 2
      end
      object btnCliente: TBitBtn
        Left = 16
        Top = 87
        Width = 137
        Height = 25
        Cursor = crHandPoint
        Hint = 'F7 - ALTERAR CLIENTE DA VENDA'
        Caption = 'F7 - Alterar Cliente'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnClienteClick
      end
    end
    object btnFinalizar: TBitBtn
      Left = 160
      Top = 493
      Width = 369
      Height = 73
      Cursor = crHandPoint
      Caption = 'F5 - FINALIZAR VENDA'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnFinalizarClick
    end
    object grp3: TGroupBox
      Left = 24
      Top = 13
      Width = 348
      Height = 453
      Caption = 'Valores:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl3: TLabel
        Left = 16
        Top = 198
        Width = 46
        Height = 23
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 16
        Top = 283
        Width = 73
        Height = 23
        Caption = 'Dinheiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 16
        Top = 364
        Width = 52
        Height = 23
        Caption = 'Troco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 16
        Top = 114
        Width = 84
        Height = 23
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 16
        Top = 30
        Width = 95
        Height = 23
        Caption = 'Sub - Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -16
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object edtTotal: TEdit
        Left = 16
        Top = 220
        Width = 315
        Height = 49
        Alignment = taRightJustify
        AutoSize = False
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtDinheiro: TEdit
        Left = 16
        Top = 306
        Width = 315
        Height = 49
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Text = '0,00'
        OnKeyPress = edtDinheiroKeyPress
      end
      object edtTroco: TEdit
        Left = 16
        Top = 385
        Width = 315
        Height = 49
        Alignment = taRightJustify
        AutoSize = False
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = '0,00'
      end
      object edtDesconto: TEdit
        Left = 16
        Top = 136
        Width = 315
        Height = 49
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        OnKeyPress = edtDinheiroKeyPress
      end
      object edtSubTotal: TEdit
        Left = 16
        Top = 51
        Width = 315
        Height = 49
        Alignment = taRightJustify
        AutoSize = False
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
end
