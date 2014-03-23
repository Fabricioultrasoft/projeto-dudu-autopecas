object frmProcura_EntradaProduto: TfrmProcura_EntradaProduto
  Left = 403
  Top = 197
  BorderStyle = bsNone
  Caption = 'Form Padr'#227'o'
  ClientHeight = 651
  ClientWidth = 1128
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
    Width = 1128
    Height = 57
    Align = alTop
    Caption = 'Pesquisar - Entradas Notas Fiscais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -40
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 57
    Width = 1128
    Height = 44
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1427
    object lbl5: TLabel
      Left = 371
      Top = 12
      Width = 63
      Height = 19
      Caption = 'Informe:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 440
      Top = 4
      Width = 881
      Height = 37
      Hint = 'Data no formato dd/mm/yyyy'
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edtCodigoChange
    end
    object rgOpcao: TRadioGroup
      Left = 0
      Top = 3
      Width = 337
      Height = 37
      Cursor = crHandPoint
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'N'#186' da Nota Fiscal'
        'Data de Entrada')
      ParentFont = False
      TabOrder = 1
      OnClick = rgOpcaoClick
    end
    object dtpEntrada: TDateTimePicker
      Left = 440
      Top = 7
      Width = 186
      Height = 29
      Cursor = crHandPoint
      Date = 41714.369172615740000000
      Time = 41714.369172615740000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnChange = dtpEntradaChange
    end
  end
  object grdProd: TDBGrid
    Left = 0
    Top = 101
    Width = 1128
    Height = 513
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsEntradaNF
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
    OnDblClick = grdProdDblClick
    OnKeyPress = grdProdKeyPress
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'N_NOTA'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' NOTA FISCAL'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CHAVE_NFE'
        Title.Alignment = taCenter
        Title.Caption = 'CHAVE NFE'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_FORN'
        Title.Alignment = taCenter
        Title.Caption = 'FORNECEDOR'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR DA NOTA'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RESPONSAVEL'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'DATA DE ENTRADA'
        Width = 150
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 614
    Width = 1128
    Height = 37
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl1: TLabel
      Left = 0
      Top = 8
      Width = 607
      Height = 18
      Alignment = taCenter
      Caption = 
        'Pressione: ESC >> Fechar       ENTER >> Selecionar Registro     ' +
        ' F5 >> Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
  end
end
