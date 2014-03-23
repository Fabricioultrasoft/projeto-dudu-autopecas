object frmConfig: TfrmConfig
  Left = 449
  Top = 194
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio :- Configura'#231#227'o'
  ClientHeight = 384
  ClientWidth = 707
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnl3: TPanel
    Left = 0
    Top = 334
    Width = 707
    Height = 50
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 721
    object btn1: TBitBtn
      Left = 578
      Top = 7
      Width = 121
      Height = 35
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Cancel = True
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
      Layout = blGlyphRight
      ModalResult = 2
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
    end
    object btn2: TBitBtn
      Left = 445
      Top = 7
      Width = 121
      Height = 35
      Cursor = crHandPoint
      Hint = 'GRAVAR REGISTRO'
      Caption = 'F3 - Gravar'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      Layout = blGlyphRight
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 10
      TabOrder = 0
      OnClick = btn2Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 707
    Height = 334
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pgConfig: TPageControl
      Left = 1
      Top = 1
      Width = 705
      Height = 332
      Cursor = crHandPoint
      ActivePage = TabSheet1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 719
      object TabSheet1: TTabSheet
        Caption = 'Informa'#231#245'es da Empresa'
        ExplicitWidth = 711
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 697
          Height = 301
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 711
          object Label1: TLabel
            Left = 48
            Top = 79
            Width = 78
            Height = 16
            Caption = 'Raz'#227'o Social:'
          end
          object Label2: TLabel
            Left = 99
            Top = 105
            Width = 27
            Height = 16
            Caption = 'Rua:'
          end
          object Label3: TLabel
            Left = 486
            Top = 105
            Width = 50
            Height = 16
            Caption = 'Numero:'
          end
          object Label4: TLabel
            Left = 87
            Top = 132
            Width = 39
            Height = 16
            Caption = 'Bairro:'
          end
          object Label5: TLabel
            Left = 345
            Top = 132
            Width = 44
            Height = 16
            Caption = 'Cidade:'
          end
          object Label6: TLabel
            Left = 588
            Top = 132
            Width = 20
            Height = 16
            Caption = 'UF:'
          end
          object Label7: TLabel
            Left = 93
            Top = 159
            Width = 33
            Height = 16
            Caption = 'CNPJ:'
          end
          object Label8: TLabel
            Left = 352
            Top = 159
            Width = 108
            Height = 16
            Caption = 'Inscri'#231#227'o Estadual:'
          end
          object Label9: TLabel
            Left = 54
            Top = 186
            Width = 72
            Height = 16
            Caption = 'Propriet'#225'rio:'
          end
          object Label10: TLabel
            Left = 427
            Top = 186
            Width = 33
            Height = 16
            Caption = 'Fone:'
          end
          object lbl1: TLabel
            Left = 3
            Top = 287
            Width = 267
            Height = 11
            Caption = '* Todos os campos s'#227'o de preenchimento obrigat'#243'rio.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtRazao: TEdit
            Left = 127
            Top = 76
            Width = 531
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object edtRua: TEdit
            Left = 127
            Top = 102
            Width = 315
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object edtNumero: TEdit
            Left = 537
            Top = 102
            Width = 121
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object edtBairro: TEdit
            Left = 127
            Top = 129
            Width = 197
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
          object edtCidade: TEdit
            Left = 390
            Top = 129
            Width = 176
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
          end
          object edtUF: TEdit
            Left = 609
            Top = 129
            Width = 49
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
          end
          object edtCNPJ: TEdit
            Left = 127
            Top = 156
            Width = 197
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object edtInsc: TEdit
            Left = 461
            Top = 156
            Width = 197
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
          end
          object edtResponsavel: TEdit
            Left = 127
            Top = 183
            Width = 275
            Height = 24
            CharCase = ecUpperCase
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
          end
          object edtFone: TEdit
            Left = 461
            Top = 183
            Width = 197
            Height = 24
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            TextHint = '(00) 0000-0000'
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Geral'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 333
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 697
          Height = 301
          Align = alClient
          TabOrder = 0
          ExplicitTop = -1
          ExplicitWidth = 711
          object lbl7: TLabel
            Left = 5
            Top = 288
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
          object GroupBox3: TGroupBox
            Left = 9
            Top = 12
            Width = 392
            Height = 125
            Caption = 'Impressora'
            TabOrder = 0
            object lbl4: TLabel
              Left = 128
              Top = 91
              Width = 77
              Height = 16
              Caption = 'Velocidade:'
            end
            object lbl3: TLabel
              Left = 164
              Top = 62
              Width = 41
              Height = 16
              Caption = 'Porta:'
            end
            object lbl2: TLabel
              Left = 18
              Top = 32
              Width = 187
              Height = 16
              Caption = 'Mod. Impressora N'#227'o Fiscal:'
            end
            object lbl5: TLabel
              Left = 370
              Top = 33
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
              Left = 370
              Top = 63
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
            object cmbImpressora: TComboBox
              Left = 207
              Top = 29
              Width = 157
              Height = 24
              Cursor = crHandPoint
              Style = csDropDownList
              TabOrder = 0
              Items.Strings = (
                'Epson')
            end
            object edtVelocidade: TEdit
              Left = 207
              Top = 89
              Width = 157
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              NumbersOnly = True
              ParentFont = False
              TabOrder = 2
            end
            object cmbPorta: TComboBox
              Left = 207
              Top = 59
              Width = 157
              Height = 24
              Cursor = crHandPoint
              Style = csDropDownList
              TabOrder = 1
              Items.Strings = (
                'SERIAL'
                'USB')
            end
          end
          object grp1: TGroupBox
            Left = 9
            Top = 143
            Width = 678
            Height = 130
            Caption = 'Mensagens no Cupom'
            TabOrder = 1
            object lbl6: TLabel
              Left = 18
              Top = 32
              Width = 169
              Height = 16
              Caption = 'Mensagem do Cabe'#231'alho:'
            end
            object lbl8: TLabel
              Left = 38
              Top = 80
              Width = 149
              Height = 16
              Caption = 'Mensagem do Rodap'#233':'
            end
            object lbl9: TLabel
              Left = 532
              Top = 115
              Width = 139
              Height = 11
              Caption = '* M'#225'ximo de 45 caracteres.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edtMsgCabecalho: TEdit
              Left = 189
              Top = 29
              Width = 468
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              MaxLength = 35
              ParentFont = False
              TabOrder = 0
            end
            object edtMsgRodape: TEdit
              Left = 189
              Top = 77
              Width = 468
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              MaxLength = 35
              ParentFont = False
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 653
    Top = 4
  end
end
