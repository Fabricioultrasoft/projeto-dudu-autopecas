object frmCancelaItem: TfrmCancelaItem
  Left = 656
  Top = 291
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 108
  ClientWidth = 326
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
    Width = 326
    Height = 108
    Align = alClient
    BevelOuter = bvNone
    BevelWidth = 15
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 4
      Width = 306
      Height = 38
      Caption = 'Informe o N'#186' do Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtItem: TEdit
      Left = 0
      Top = 44
      Width = 326
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
      OnKeyPress = edtItemKeyPress
    end
  end
end
