object frmForma_Pagamento: TfrmForma_Pagamento
  Left = 448
  Top = 168
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Finalizando Venda'
  ClientHeight = 597
  ClientWidth = 467
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
    Width = 467
    Height = 597
    Align = alClient
    TabOrder = 0
    object lbl2: TLabel
      Left = 1
      Top = 578
      Width = 465
      Height = 18
      Align = alBottom
      Caption = 'Pressione: ESC >> Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
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
    object lbl1: TLabel
      Left = 91
      Top = 19
      Width = 64
      Height = 22
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -15
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object btnFinalizar: TBitBtn
      Left = 100
      Top = 515
      Width = 279
      Height = 46
      Cursor = crHandPoint
      Caption = 'F5 - FINALIZAR VENDA'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -20
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnClick = btnFinalizarClick
    end
    object grp3: TGroupBox
      Left = 24
      Top = 64
      Width = 412
      Height = 431
      Caption = 'Valores:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lbl3: TLabel
        Left = 16
        Top = 112
        Width = 48
        Height = 22
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 16
        Top = 179
        Width = 74
        Height = 22
        Caption = 'Dinheiro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 19
        Top = 394
        Width = 53
        Height = 22
        Caption = 'Troco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 16
        Top = 70
        Width = 115
        Height = 22
        Caption = 'Desconto (%):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object lbl8: TLabel
        Left = 16
        Top = 31
        Width = 94
        Height = 22
        Caption = 'Sub - Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 215
        Width = 67
        Height = 22
        Caption = 'Cheque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 256
        Width = 61
        Height = 22
        Caption = 'Cart'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 19
        Top = 294
        Width = 58
        Height = 22
        Caption = 'Ticket:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 19
        Top = 353
        Width = 95
        Height = 22
        Caption = 'Valor Pago:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object edtTotal: TEdit
        Left = 142
        Top = 107
        Width = 253
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtTroco: TEdit
        Left = 142
        Top = 390
        Width = 253
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '0,00'
      end
      object edtSubTotal: TEdit
        Left = 142
        Top = 31
        Width = 253
        Height = 32
        Alignment = taRightJustify
        AutoSize = False
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCheque: TJvCalcEdit
        Left = 142
        Top = 212
        Width = 253
        Height = 28
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        DecimalPlacesAlwaysShown = False
      end
      object edtCartao: TJvCalcEdit
        Left = 142
        Top = 251
        Width = 253
        Height = 28
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        DecimalPlacesAlwaysShown = False
      end
      object edtTicket: TJvCalcEdit
        Left = 142
        Top = 289
        Width = 253
        Height = 28
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        DecimalPlacesAlwaysShown = False
      end
      object edtDinheiro: TJvCalcEdit
        Left = 142
        Top = 174
        Width = 253
        Height = 28
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
      end
      object edtDesconto: TJvCalcEdit
        Left = 142
        Top = 69
        Width = 253
        Height = 28
        DisplayFormat = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DecimalPlacesAlwaysShown = False
        OnExit = edtDescontoExit
      end
      object edtValorPago: TJvCalcEdit
        Left = 142
        Top = 353
        Width = 253
        Height = 28
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        DecimalPlacesAlwaysShown = False
        OnExit = edtValorPagoExit
      end
    end
    object edtCliente: TJvComboEdit
      Left = 166
      Top = 18
      Width = 270
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E0000000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFF6A407FF0000FFFFFFFFFFFFFFFFFFF65C655C070000FFFFFFFFFFFF
        FFFFF65C65AEB7A50000FFFFFFFFFFFFFF085465AE08A5F60000FFFFF60707ED
        07ED5CAE08A5F6FF0000FFF607ED0909EDEDED07A5F6FFFF0000F6070909F6F6
        09EDED0707FFFFFF0000F6EC090909090909ED07FFFFFFFF000009EC09090909
        0909EC07FFFFFFFF00000909090909ECEC09EC07FFFFFFFF0000F60909090909
        0909EC07FFFFFFFF0000F6F509F6F6F6F60907F6FFFFFFFF0000FFF6F5090909
        0907F6FFFFFFFFFF0000FFFFF6F60909F6F6FFFFFFFFFFFF0000}
      ParentFont = False
      TabOrder = 0
      OnButtonClick = edtClienteButtonClick
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 23
    Top = 5
  end
end
