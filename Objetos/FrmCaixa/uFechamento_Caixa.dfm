object frmFechamento_Caixa: TfrmFechamento_Caixa
  Left = 297
  Top = 92
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Caixa'
  ClientHeight = 623
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
    Height = 104
    Align = alTop
    TabOrder = 1
    object grp1: TGroupBox
      Left = 5
      Top = 6
      Width = 694
      Height = 91
      Caption = 'Por Data de Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 51
        Top = 23
        Width = 80
        Height = 18
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 470
        Top = 23
        Width = 73
        Height = 18
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 341
        Top = 45
        Width = 12
        Height = 25
        Caption = #224
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object dtpIncial: TDateTimePicker
        Left = 51
        Top = 45
        Width = 173
        Height = 25
        Cursor = crHandPoint
        Date = 40938.858257858800000000
        Time = 40938.858257858800000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = dtpIncialChange
      end
      object dtpFinal: TDateTimePicker
        Left = 470
        Top = 45
        Width = 173
        Height = 25
        Cursor = crHandPoint
        Date = 40938.858362199080000000
        Time = 40938.858362199080000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
    Top = 551
    Width = 704
    Height = 72
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 567
    object btn1: TBitBtn
      Left = 578
      Top = 8
      Width = 121
      Height = 59
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Kind = bkCancel
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
    end
    object btn2: TBitBtn
      Left = 457
      Top = 8
      Width = 121
      Height = 59
      Cursor = crHandPoint
      Hint = 'GRAVAR REGISTRO'
      Caption = 'F3 - Imprimir'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 10
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object pnl4: TPanel
    Left = 0
    Top = 177
    Width = 704
    Height = 374
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    ExplicitHeight = 368
    object pgc1: TPageControl
      Left = 1
      Top = 1
      Width = 702
      Height = 372
      Cursor = crHandPoint
      ActivePage = tsValores
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitHeight = 368
      object tsValores: TTabSheet
        Caption = 'Valores'
        ExplicitHeight = 352
        object grp2: TGroupBox
          Left = 0
          Top = 0
          Width = 694
          Height = 337
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 352
          object lbl7: TLabel
            Left = 92
            Top = 147
            Width = 166
            Height = 18
            Caption = 'TOTAL DE VENDAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl6: TLabel
            Left = 92
            Top = 84
            Width = 158
            Height = 18
            Caption = 'VALOR EM CHEQUE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object lbl5: TLabel
            Left = 92
            Top = 51
            Width = 157
            Height = 18
            Caption = 'VALOR EM CART'#195'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object lbl4: TLabel
            Left = 92
            Top = 19
            Width = 174
            Height = 18
            Caption = 'VALOR EM DINHEIRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object lbl8: TLabel
            Left = 92
            Top = 238
            Width = 204
            Height = 18
            Caption = 'TOTAL DE  RETIRADAS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl9: TLabel
            Left = 92
            Top = 301
            Width = 153
            Height = 18
            Caption = 'TOTAL NO CAIXA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHotLight
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl10: TLabel
            Left = 92
            Top = 205
            Width = 227
            Height = 18
            Caption = 'TOTAL DE SUPRIMENTOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 92
            Top = 118
            Width = 149
            Height = 18
            Caption = 'VALOR EM TICKET'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object edtSubTotal: TEdit
            Left = 348
            Top = 144
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object edtDinheiro: TEdit
            Left = 348
            Top = 16
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object edtCartao: TEdit
            Left = 348
            Top = 48
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object edtCheque: TEdit
            Left = 348
            Top = 81
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object edtSangria: TEdit
            Left = 348
            Top = 235
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object edtTotal: TEdit
            Left = 348
            Top = 298
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clHotLight
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object edtSuprimento: TEdit
            Left = 348
            Top = 202
            Width = 271
            Height = 30
            Alignment = taRightJustify
            AutoSize = False
            Color = clSilver
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object edtTicket: TEdit
            Left = 348
            Top = 113
            Width = 271
            Height = 28
            Alignment = taRightJustify
            AutoSelect = False
            Color = clSilver
            ReadOnly = True
            TabOrder = 7
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
        ExplicitHeight = 352
        object grdRegistros: TDBGrid
          Left = 0
          Top = 0
          Width = 694
          Height = 337
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
              Color = clSilver
              Expanded = False
              FieldName = 'RESPONSAVEL'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial'
              Title.Font.Style = []
              Width = 150
              Visible = True
            end
            item
              Alignment = taCenter
              Color = clSilver
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
              Color = clSilver
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
              Color = clSilver
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
              Color = clSilver
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
            end
            item
              Color = clSilver
              Expanded = False
              FieldName = 'OBSERVACAO'
              Title.Alignment = taCenter
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Arial '
              Title.Font.Style = []
              Width = 200
              Visible = True
            end>
        end
      end
    end
  end
end