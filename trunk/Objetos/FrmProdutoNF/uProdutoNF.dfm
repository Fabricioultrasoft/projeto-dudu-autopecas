object frmProdutoNF: TfrmProdutoNF
  Left = 434
  Top = 152
  BorderIcons = []
  Caption = 'Formul'#225'rio :- Produtos da Nota Fiscal'
  ClientHeight = 434
  ClientWidth = 773
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
    Width = 773
    Height = 57
    Align = alTop
    Caption = 'Produtos da Nota Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 773
    Height = 305
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 63
    ExplicitWidth = 752
    ExplicitHeight = 298
    object Label2: TLabel
      Left = 56
      Top = 45
      Width = 85
      Height = 16
      Caption = 'C'#243'digo EAN13:'
    end
    object Label10: TLabel
      Left = 316
      Top = 46
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 21
      Top = 73
      Width = 120
      Height = 16
      Caption = 'Refer'#234'n. do Produto:'
    end
    object Label6: TLabel
      Left = 460
      Top = 76
      Width = 102
      Height = 16
      Caption = 'Data de Validade:'
    end
    object Label17: TLabel
      Left = 737
      Top = 77
      Width = 8
      Height = 14
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 8
      Top = 287
      Width = 212
      Height = 11
      Caption = '* Campo(s) de preenchimento obrigat'#243'rio.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblStatusOperacao: TLabel
      Left = 305
      Top = 6
      Width = 161
      Height = 16
      AutoSize = False
      Caption = 'lblStatusOperacao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCod_Prod: TJvComboEdit
      Left = 144
      Top = 42
      Width = 170
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
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
      MaxLength = 13
      ParentFont = False
      TabOrder = 0
      OnButtonClick = edtCod_ProdButtonClick
      OnExit = edtCod_ProdExit
    end
    object edtReferencia: TEdit
      Left = 144
      Top = 70
      Width = 170
      Height = 24
      Color = clSilver
      TabOrder = 1
    end
    object dtpValidade: TDateTimePicker
      Left = 565
      Top = 72
      Width = 169
      Height = 24
      Date = 41711.559904166660000000
      Time = 41711.559904166660000000
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 113
      Width = 359
      Height = 158
      Caption = 'Convers'#227'o de Unidades'
      TabOrder = 3
      object Label4: TLabel
        Left = 56
        Top = 44
        Width = 95
        Height = 16
        Caption = 'Qtde Comprada:'
      end
      object Label9: TLabel
        Left = 327
        Top = 45
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 33
        Top = 72
        Width = 118
        Height = 16
        Caption = 'Unidade de Compra:'
      end
      object Label14: TLabel
        Left = 327
        Top = 73
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 100
        Width = 135
        Height = 16
        Caption = 'Convers'#227'o para Venda:'
      end
      object Label3: TLabel
        Left = 328
        Top = 101
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 40
        Top = 128
        Width = 109
        Height = 16
        Caption = 'Unidade de Venda:'
      end
      object Label7: TLabel
        Left = 327
        Top = 130
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtQtdeComprada: TJvCalcEdit
        Left = 155
        Top = 42
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '##0.000'
        TabOrder = 0
        DecimalPlacesAlwaysShown = False
      end
      object cmbUnd: TComboBox
        Left = 155
        Top = 70
        Width = 169
        Height = 24
        Cursor = crHandPoint
        Style = csDropDownList
        TabOrder = 1
      end
      object edtQtdeConversao: TJvCalcEdit
        Left = 155
        Top = 98
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '##0.000'
        TabOrder = 2
        DecimalPlacesAlwaysShown = False
      end
      object cmbUndConversao: TComboBox
        Left = 155
        Top = 126
        Width = 169
        Height = 24
        Cursor = crHandPoint
        Style = csDropDownList
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 392
      Top = 113
      Width = 359
      Height = 158
      Caption = 'Valores ($)'
      TabOrder = 4
      object lbl2: TLabel
        Left = 24
        Top = 72
        Width = 147
        Height = 16
        Caption = 'Valor de Custo (Unit'#225'rio):'
      end
      object Label16: TLabel
        Left = 40
        Top = 100
        Width = 131
        Height = 16
        Caption = 'Percent. de Lucro (%):'
      end
      object lbl3: TLabel
        Left = 20
        Top = 128
        Width = 151
        Height = 16
        Caption = 'Valor de Venda (Unit'#225'rio):'
      end
      object Label12: TLabel
        Left = 347
        Top = 103
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 347
        Top = 129
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 4
        Top = 44
        Width = 167
        Height = 16
        Caption = 'Valor total do Produto (N.F.):'
      end
      object Label18: TLabel
        Left = 347
        Top = 48
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 347
        Top = 75
        Width = 8
        Height = 14
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtVal_Venda: TJvCalcEdit
        Left = 175
        Top = 126
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
      end
      object edtPercentagem: TJvCalcEdit
        Left = 175
        Top = 98
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '#0.00'
        TabOrder = 2
        DecimalPlacesAlwaysShown = False
        OnExit = edtPercentagemExit
      end
      object edtVal_Custo: TJvCalcEdit
        Left = 175
        Top = 70
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        DecimalPlacesAlwaysShown = False
      end
      object edtValProdNf: TJvCalcEdit
        Left = 175
        Top = 42
        Width = 169
        Height = 24
        Color = clSilver
        DisplayFormat = '##0.00'
        TabOrder = 0
        DecimalPlacesAlwaysShown = False
        OnExit = edtValProdNfExit
      end
    end
    object btnAdicionarGrupo: TBitBtn
      Left = 330
      Top = 42
      Width = 30
      Height = 25
      Hint = 'CADASTRAR PRODUTO'
      DoubleBuffered = True
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9F7C2D3C4A6BFABA9C2AEA8C1ACD6E1
        D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCEE3D02DA94B03AD3D03B54403A93760B975F3F6F3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFC3DFC643C37339DC8E3BE59833D3806DC98EEDF3EDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC5E1CA5BDE9160FAB663FCBA58F3A57EDAA4EDF2EDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1
        E3CA23DB7100EE7600EF7700E86C54D688EDF3EDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9E8D125D5
        7100E67600E77700DF6B59D58DF2F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0E5D428CC6A04E16F
        05E27005DB655FD08BF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFC
        FBBDD4BE9CC09EA1C4A49FC3A3A2C6A6ADC6AD7DB58326C56224E37C27E17C1E
        DE723CBB689AB99AAAC7ACA0C6A49FC5A39FC3A29FC2A1CBDDCCE7F2E92A9740
        059029089731079C36089E380D9B3508A1351DCB603DDF803EDC7F32DE790EB9
        4D0B9A330B9E39089F39079D3607973207902C4DA85DE3F1E529A9492BC46828
        C76827CD6E27CF7226CF7221CE6D2FD36D41D6763DD5753AD5712FD17024CF70
        23CF7023CD6F23CA6924C4631FBB583AAE52E7F2E75EBD6B77DD9069D98A69DC
        8C67DE9068E2935DDF8C4BD47A46D27344D27244D17153D9805ADF8A57DC8453
        D77D50D4764FCF6F4BC86558B962E3F0E43AA74074CF7A67CA7466CD7763CE78
        63CF7865D57F5CD57F50D0764DCF724FD17555D37655CF6F51C8694EC6644CC5
        5E4AC15746BB4F3DA743EEF6EF60B46670C27770C2786CC27A6DC47C6FC47E61
        C17257C96F5BD0785AD07856CF7555C26C65BF7468C37865C17364C06F65BF6E
        5ABA6072BD76FEFFFEE2F1E3D6EBD8D9ECDBD8EBDADBEEDDE3F1E4ABD0AE57BA
        6663D0786CD38155C76A72C17FCFE2D0E2F1E3DBEEDCD9ECDADAEDDBD5EBD6E9
        F4E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4E2D45DB8676DCE7A
        79D3855BC46880C287FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7DAC85FB66578CF7E84D38966
        C46B7CBC80EFF1EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3D6C363B46580CF838ED38D6EC5707EBB
        81EDEFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC4D6C469B5698DD58D9BD99B77C97882BA83EDEFED
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCCDCCD6FB5718CCF8C9AD69A77C4798BBF8EF2F3F2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF9FBF9CCE1CFB5D4BABAD7BEB5D5BADBEADDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnAdicionarGrupoClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 362
    Width = 773
    Height = 72
    Align = alBottom
    TabOrder = 2
    object btn1: TBitBtn
      Left = 646
      Top = 7
      Width = 121
      Height = 59
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Cancel = True
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      ModalResult = 2
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnGravar: TBitBtn
      Left = 525
      Top = 7
      Width = 121
      Height = 59
      Cursor = crHandPoint
      Hint = 'GRAVAR REGISTRO'
      Caption = 'F3 - Gravar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnAtualizarValores: TBitBtn
      Left = 404
      Top = 7
      Width = 121
      Height = 59
      Hint = 'ATUALIZAR VALORES ($)'
      Caption = 'F5 - Atualizar Valores'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnAtualizarValoresClick
    end
  end
  object lblDescricaoProduto: TEdit
    Left = 368
    Top = 99
    Width = 366
    Height = 24
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    TextHint = 'Descri'#231#227'o do Fornecedor'
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 672
    Top = 8
  end
end
