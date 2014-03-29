object frmProcuraDescarte: TfrmProcuraDescarte
  Left = 674
  Top = 63
  BorderStyle = bsNone
  Caption = 'frmProcuraDescarte'
  ClientHeight = 662
  ClientWidth = 1145
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1145
    Height = 57
    Align = alTop
    Caption = 'Pesquisar Descarte'
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
    Width = 1145
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbl5: TLabel
      Left = 18
      Top = 9
      Width = 227
      Height = 19
      Caption = 'Informe o C'#243'digo ou Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 251
      Top = 1
      Width = 893
      Height = 37
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtCodigoChange
    end
  end
  object grdProd: TDBGrid
    Left = 0
    Top = 98
    Width = 1145
    Height = 526
    Cursor = crHandPoint
    Align = alClient
    DataSource = dm.dtsDescarte
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
    OnDrawColumnCell = grdProdDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'EAN13'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REF_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'REFER'#202'NCIA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 300
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UND'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_DESCARTE'
        Title.Alignment = taCenter
        Title.Caption = 'DATA DESCARTE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTIVO'
        Title.Alignment = taCenter
        Width = 300
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 624
    Width = 1145
    Height = 38
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object lbl1: TLabel
      Left = 18
      Top = 8
      Width = 359
      Height = 18
      Alignment = taCenter
      Caption = 'Pressione: ESC >> Fechar     F5 >> Gerar Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object lblFinalizado: TLabel
      Left = 964
      Top = 10
      Width = 169
      Height = 18
      Caption = 'DESCARTE FINALIZADO'
    end
  end
end
