object frmEstornoFinanceiro: TfrmEstornoFinanceiro
  Left = 312
  Top = 177
  BorderStyle = bsNone
  Caption = 'frmEstornoFinanceiro'
  ClientHeight = 309
  ClientWidth = 476
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 57
    Align = alTop
    Caption = 'Estorno Financeiro'
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
    Width = 476
    Height = 180
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 157
    object lbl1: TLabel
      Left = 21
      Top = 31
      Width = 215
      Height = 22
      Caption = 'Documento de Devolu'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -15
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 93
      Top = 64
      Width = 143
      Height = 22
      Caption = 'Valor do Estorno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -15
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 4
      Top = 147
      Width = 290
      Height = 11
      Caption = '- Processo de troca ou devolu'#231#227'o tem que estar finalizado.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 117
      Width = 67
      Height = 11
      Caption = 'Observa'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 162
      Width = 202
      Height = 11
      Caption = '- A'#231#227'o tomada '#39'DEVOLU'#199#195'O DINHEIRO'#39'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 458
      Top = 66
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
    object lbl2: TLabel
      Left = 458
      Top = 36
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
    object Label4: TLabel
      Left = 4
      Top = 132
      Width = 274
      Height = 11
      Caption = '- Procurar o documento de devolu'#231#227'o, clicando na lupa.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDocDevolucao: TJvComboEdit
      Left = 248
      Top = 28
      Width = 206
      Height = 28
      Hint = 'PROCURAR DEVOLU'#199#195'O'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnButtonClick = edtDocDevolucaoButtonClick
    end
    object edtValor: TEdit
      Left = 248
      Top = 61
      Width = 206
      Height = 28
      Alignment = taRightJustify
      AutoSize = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 237
    Width = 476
    Height = 72
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 214
    object btnFechar: TBitBtn
      Left = 349
      Top = 6
      Width = 122
      Height = 59
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Cancel = True
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnGravar: TBitBtn
      Left = 227
      Top = 6
      Width = 122
      Height = 59
      Cursor = crHandPoint
      Hint = 'TROCA OU DEVOLU'#199#195'O DE PRODUTOS'
      Caption = 'F5 - Gravar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      TabOrder = 1
      OnClick = btnGravarClick
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 40
    Top = 41
  end
end
