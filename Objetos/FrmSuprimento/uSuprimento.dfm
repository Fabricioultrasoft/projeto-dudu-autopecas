object frmSuprimento: TfrmSuprimento
  Left = 412
  Top = 183
  ActiveControl = edtValor
  BorderStyle = bsNone
  Caption = 'frmSuprimento'
  ClientHeight = 286
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 286
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 15
    TabOrder = 0
    object lbl2: TLabel
      Left = 77
      Top = 101
      Width = 43
      Height = 19
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 27
      Top = 128
      Width = 93
      Height = 19
      Caption = 'Respons'#225'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 32
      Top = 155
      Width = 88
      Height = 19
      Caption = 'Observa'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 13
      Top = 263
      Width = 319
      Height = 18
      Alignment = taCenter
      Caption = 'Pressione: ESC >> Cancelar      F5 >> Gravar '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 310
      Top = 105
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
      Left = 446
      Top = 132
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
    object lbl7: TLabel
      Left = 122
      Top = 231
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
    object lbl8: TLabel
      Left = 447
      Top = 159
      Width = 16
      Height = 14
      Caption = '**'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mmoObservacao: TMemo
      Left = 122
      Top = 155
      Width = 321
      Height = 75
      CharCase = ecUpperCase
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      MaxLength = 45
      ParentFont = False
      TabOrder = 4
    end
    object edtResponsavel: TEdit
      Left = 122
      Top = 128
      Width = 321
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
    object edtValor: TJvCalcEdit
      Left = 122
      Top = 101
      Width = 185
      Height = 24
      Color = clSilver
      DisplayFormat = '##0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
    end
    object pnlTitulo: TPanel
      Left = 0
      Top = 0
      Width = 491
      Height = 57
      Align = alTop
      Caption = 'Suprimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ckbCupom: TCheckBox
      Left = 122
      Top = 76
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
      TabOrder = 1
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 416
    Top = 8
  end
end
