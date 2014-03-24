object frmSangria: TfrmSangria
  Left = 919
  Top = 225
  ActiveControl = edtValor
  BorderStyle = bsNone
  Caption = 'frmSangria'
  ClientHeight = 312
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 312
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 15
    TabOrder = 0
    ExplicitWidth = 326
    ExplicitHeight = 108
    object lbl2: TLabel
      Left = 77
      Top = 97
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
      Left = 26
      Top = 154
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
      Top = 181
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
      Left = 10
      Top = 288
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
    object lbl5: TLabel
      Left = 82
      Top = 125
      Width = 38
      Height = 19
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 311
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
    object lbl7: TLabel
      Left = 311
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
    object lbl8: TLabel
      Left = 445
      Top = 158
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
    object lbl9: TLabel
      Left = 123
      Top = 257
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
    object lbl10: TLabel
      Left = 450
      Top = 185
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
      Left = 123
      Top = 181
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
      TabOrder = 5
    end
    object edtResponsavel: TEdit
      Left = 123
      Top = 154
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
      TabOrder = 4
    end
    object edtValor: TJvCalcEdit
      Left = 123
      Top = 97
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
      Caption = 'Sangria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cmbTipo: TComboBox
      Left = 123
      Top = 125
      Width = 185
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
        ''
        'DINHEIRO'
        'CHEQUE')
    end
    object ckbCupom: TCheckBox
      Left = 123
      Top = 73
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
    Left = 408
    Top = 8
  end
end
