object frmFechamento_Caixa: TfrmFechamento_Caixa
  Left = 295
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Caixa'
  ClientHeight = 631
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial Black'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 73
    Align = alTop
    Caption = 'Movimenta'#231#227'o do Caixa'
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
    Top = 73
    Width = 704
    Height = 136
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 719
    object grp1: TGroupBox
      Left = 5
      Top = 6
      Width = 694
      Height = 115
      Caption = 'Por Data de Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 51
        Top = 40
        Width = 77
        Height = 18
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 470
        Top = 40
        Width = 72
        Height = 18
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 341
        Top = 63
        Width = 11
        Height = 23
        Caption = #224
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object dtpIncial: TDateTimePicker
        Left = 51
        Top = 62
        Width = 173
        Height = 26
        Cursor = crHandPoint
        Date = 40938.858257858800000000
        Time = 40938.858257858800000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = dtpIncialChange
      end
      object dtpFinal: TDateTimePicker
        Left = 470
        Top = 64
        Width = 173
        Height = 26
        Cursor = crHandPoint
        Date = 40938.858362199080000000
        Time = 40938.858362199080000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = dtpFinalChange
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 581
    Width = 704
    Height = 50
    Align = alBottom
    TabOrder = 3
    object btn1: TBitBtn
      Left = 578
      Top = 5
      Width = 121
      Height = 35
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = bkCancel
      Layout = blGlyphRight
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 209
    Width = 704
    Height = 372
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitWidth = 554
    ExplicitHeight = 304
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 702
      Height = 370
      Cursor = crHandPoint
      ActivePage = tsValores
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 639
      object tsValores: TTabSheet
        Caption = 'Valores'
        object grp2: TGroupBox
          Left = 4
          Top = 8
          Width = 622
          Height = 313
          TabOrder = 0
          object lbl7: TLabel
            Left = 21
            Top = 246
            Width = 159
            Height = 28
            Caption = 'VALOR TOTAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHotLight
            Font.Height = -20
            Font.Name = 'Arial Black'
            Font.Style = []
            ParentFont = False
          end
          object lbl6: TLabel
            Left = 21
            Top = 148
            Width = 190
            Height = 23
            Caption = 'VALOR EM CHEQUE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lbl5: TLabel
            Left = 21
            Top = 91
            Width = 190
            Height = 23
            Caption = 'VALOR EM CART'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lbl4: TLabel
            Left = 21
            Top = 33
            Width = 203
            Height = 23
            Caption = 'VALOR EM DINHEIRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object edtTotal: TEdit
            Left = 315
            Top = 247
            Width = 198
            Height = 31
            Alignment = taRightJustify
            AutoSize = False
            Color = clCream
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHotLight
            Font.Height = -20
            Font.Name = 'Arial Black'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edtDinheiro: TEdit
            Left = 315
            Top = 27
            Width = 198
            Height = 31
            Alignment = taRightJustify
            AutoSize = False
            Color = clCream
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial Black'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtCartao: TEdit
            Left = 315
            Top = 85
            Width = 198
            Height = 31
            Alignment = taRightJustify
            AutoSize = False
            Color = clCream
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial Black'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtCheque: TEdit
            Left = 315
            Top = 142
            Width = 198
            Height = 31
            Alignment = taRightJustify
            AutoSize = False
            Color = clCream
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -20
            Font.Name = 'Arial Black'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
      object tsRegistros: TTabSheet
        Caption = 'Registros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object grdRegistros: TDBGrid
          Left = 0
          Top = 0
          Width = 694
          Height = 332
          Cursor = crHandPoint
          Align = alClient
          DataSource = dm.dtsCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Black'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial Black'
          TitleFont.Style = []
          OnTitleClick = grdRegistrosTitleClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_ENTRADA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'DATA DE ENTRADA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PAGAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'VALOR PAGO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 131
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPO_PAGAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'FORMA'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 186
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'N_DOCUMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'N'#186' DO DOC.'#13#10
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 141
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPO_DOCUMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'TIPO DOC.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial '
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
end
