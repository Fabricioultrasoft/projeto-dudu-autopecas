object frmProcura_Cliente: TfrmProcura_Cliente
  Left = 366
  Top = 156
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 488
  ClientWidth = 854
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl2: TPanel
    Left = 0
    Top = 57
    Width = 854
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 16
      Top = 13
      Width = 198
      Height = 16
      Caption = 'Pesquisar por Nome/Raz'#227'o Social:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 220
      Top = 1
      Width = 633
      Height = 39
      Align = alRight
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
      OnKeyPress = edtPesquisaKeyPress
      ExplicitHeight = 46
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 451
    Width = 854
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label4: TLabel
      Left = 16
      Top = 9
      Width = 610
      Height = 18
      Alignment = taCenter
      Caption = 
        'Pressione: ESC >> Fechar       ENTER >> Selecionar Registro     ' +
        '   F5 -> Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
  object grdCliente: TDBGrid
    Left = 0
    Top = 98
    Width = 854
    Height = 353
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsCliente
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = grdClienteKeyPress
    OnTitleClick = grdClienteTitleClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_CLI'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_RAZAO'
        Title.Alignment = taCenter
        Title.Caption = 'NOME/RAZAO SOCIAL'
        Width = 388
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CNPJ'
        Title.Alignment = taCenter
        Width = 162
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'FONE'
        Title.Alignment = taCenter
        Width = 166
        Visible = True
      end>
  end
end
