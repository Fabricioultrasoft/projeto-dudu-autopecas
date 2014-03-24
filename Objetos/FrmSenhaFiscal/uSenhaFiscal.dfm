object frmSenhaFiscal: TfrmSenhaFiscal
  Left = 700
  Top = 402
  BorderStyle = bsNone
  ClientHeight = 106
  ClientWidth = 319
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 106
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 1
      Top = 0
      Width = 235
      Height = 38
      Alignment = taCenter
      Caption = 'Senha do Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtSenha: TEdit
      Left = 1
      Top = 41
      Width = 317
      Height = 64
      Align = alBottom
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Arial Black'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnKeyPress = edtSenhaKeyPress
    end
  end
end
