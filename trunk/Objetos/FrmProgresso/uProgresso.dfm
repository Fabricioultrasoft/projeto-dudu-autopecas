object frmProgresso: TfrmProgresso
  Left = 546
  Top = 512
  BorderStyle = bsNone
  Caption = 'frmProgresso'
  ClientHeight = 61
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 61
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 14
      Width = 457
      Height = 25
      AutoSize = False
      Caption = 'Aguarde, verificando impressora '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
