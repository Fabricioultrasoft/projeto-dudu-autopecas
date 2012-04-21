object frmCalula_Perc: TfrmCalula_Perc
  Left = 350
  Top = 291
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 112
  ClientWidth = 425
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 112
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 15
    TabOrder = 0
    object lbl1: TLabel
      Left = 5
      Top = 10
      Width = 412
      Height = 30
      Caption = 'Informe '#224' Porcentagem de lucro (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -21
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtValor: TEdit
      Left = 0
      Top = 48
      Width = 425
      Height = 64
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
end
