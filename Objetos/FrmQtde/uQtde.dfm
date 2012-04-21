object frmQtde: TfrmQtde
  Left = 737
  Top = 209
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 116
  ClientWidth = 340
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
    Width = 340
    Height = 116
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 15
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 4
      Width = 320
      Height = 38
      Caption = 'Informe a Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtQtde: TEdit
      Left = 0
      Top = 52
      Width = 340
      Height = 64
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
  end
end
