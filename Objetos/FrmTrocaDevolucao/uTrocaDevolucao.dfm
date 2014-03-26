object frmTrocaDevolucao: TfrmTrocaDevolucao
  Left = 589
  Top = 149
  ActiveControl = edtQtdeDevolvida
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Formul'#225'rio - Troca / Devolu'#231#227'o'
  ClientHeight = 396
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 57
    Align = alTop
    Caption = 'Devolu'#231#227'o / Troca'
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
    Height = 267
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 63
    ExplicitWidth = 485
    ExplicitHeight = 258
    object Label7: TLabel
      Left = 46
      Top = 164
      Width = 88
      Height = 19
      Caption = 'Observa'#231#227'o:'
    end
    object Label9: TLabel
      Left = 30
      Top = 137
      Width = 104
      Height = 19
      Caption = 'A'#231#227'o Tomada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 0
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 81
      Top = 108
      Width = 53
      Height = 19
      Caption = 'Motivo:'
    end
    object Label5: TLabel
      Left = 327
      Top = 112
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
      Left = 327
      Top = 141
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
    object Label2: TLabel
      Left = 463
      Top = 169
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
    object Label3: TLabel
      Left = 139
      Top = 246
      Width = 145
      Height = 11
      Caption = '** M'#225'ximo de 45 caracteres.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 22
      Top = 49
      Width = 112
      Height = 19
      Caption = 'Qtde devolvida:'
    end
    object lbl3: TLabel
      Left = 327
      Top = 53
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
    object lbl4: TLabel
      Left = 39
      Top = 80
      Width = 95
      Height = 19
      Caption = 'Ref. produto:'
    end
    object cmbMotivo: TComboBox
      Left = 140
      Top = 108
      Width = 182
      Height = 24
      Cursor = crHandPoint
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Items.Strings = (
        'DEFEITO'
        'VENCIDO'
        'ERRO NA VENDA'
        'COMPRA ERRADA')
    end
    object cmbAcaoTomada: TComboBox
      Left = 140
      Top = 137
      Width = 182
      Height = 24
      Cursor = crHandPoint
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'TROCA DE PRODUTO'
        'ESTORNO FINANCEIRO')
    end
    object mmoObsevacao: TMemo
      Left = 139
      Top = 165
      Width = 317
      Height = 80
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 45
      ParentFont = False
      TabOrder = 5
    end
    object ckbCupom: TCheckBox
      Left = 139
      Top = 17
      Width = 145
      Height = 17
      Cursor = crHandPoint
      Caption = 'Imprimir Cupom'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object edtQtdeDevolvida: TJvCalcEdit
      Left = 140
      Top = 46
      Width = 182
      Height = 27
      Color = clSilver
      DisplayFormat = '#0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      DecimalPlacesAlwaysShown = False
    end
    object edtReferencia: TEdit
      Left = 140
      Top = 77
      Width = 182
      Height = 27
      AutoSize = False
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 324
    Width = 476
    Height = 72
    Align = alBottom
    TabOrder = 2
    object lbl6: TLabel
      Left = 4
      Top = 55
      Width = 202
      Height = 11
      Caption = '* Campos de preenchimento obrigat'#243'rio.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnFechar: TBitBtn
      Left = 349
      Top = 6
      Width = 121
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
      Width = 121
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
    Left = 368
    Top = 97
  end
end
