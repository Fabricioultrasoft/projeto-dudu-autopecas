object frmProcura_Venda: TfrmProcura_Venda
  Left = 558
  Top = 235
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio - Procurar Venda'
  ClientHeight = 600
  ClientWidth = 944
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
  object pnlProcura: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 52
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 938
    object lbl5: TLabel
      Left = 16
      Top = 5
      Width = 189
      Height = 38
      Caption = 'N'#186' da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtNVenda: TEdit
      Left = 211
      Top = 2
      Width = 724
      Height = 48
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnChange = edtNVendaChange
    end
  end
  object pnlInformacao: TPanel
    Left = 0
    Top = 52
    Width = 944
    Height = 166
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 938
    object grp1: TGroupBox
      Left = 12
      Top = 2
      Width = 913
      Height = 155
      Caption = 'Informa'#231#245'es da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 64
        Top = 33
        Width = 63
        Height = 16
        Caption = 'N'#186' Venda: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 339
        Top = 91
        Width = 68
        Height = 16
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 36
        Top = 61
        Width = 89
        Height = 16
        Caption = 'Data da Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 630
        Top = 34
        Width = 52
        Height = 16
        Caption = 'Dinheiro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 351
        Top = 33
        Width = 56
        Height = 16
        Caption = 'SubTotal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 633
        Top = 61
        Width = 48
        Height = 16
        Caption = 'Cheque:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 639
        Top = 89
        Width = 43
        Height = 16
        Caption = 'Cart'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 643
        Top = 118
        Width = 39
        Height = 16
        Caption = 'Ticket:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 350
        Top = 61
        Width = 57
        Height = 16
        Caption = 'Desconto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 38
        Top = 90
        Width = 87
        Height = 16
        Caption = 'ID Funcion'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtVenda: TEdit
        Left = 131
        Top = 28
        Width = 174
        Height = 26
        Alignment = taCenter
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtData: TEdit
        Left = 131
        Top = 56
        Width = 174
        Height = 26
        Alignment = taCenter
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edtCodFunc: TEdit
        Left = 131
        Top = 85
        Width = 174
        Height = 26
        Alignment = taCenter
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edtSubTotal: TEdit
        Left = 413
        Top = 28
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edtDesconto: TEdit
        Left = 413
        Top = 56
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtValorTotal: TEdit
        Left = 413
        Top = 85
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtDinheiro: TEdit
        Left = 688
        Top = 28
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edtCheque: TEdit
        Left = 688
        Top = 56
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edtCartao: TEdit
        Left = 688
        Top = 84
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edtTicket: TEdit
        Left = 688
        Top = 113
        Width = 174
        Height = 26
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 528
    Width = 944
    Height = 72
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 938
    object lbl6: TLabel
      Left = 7
      Top = 21
      Width = 313
      Height = 44
      Caption = 
        '** Para selecionar o item para devolu'#231#227'o, selecione o registro:'#13 +
        #10'- Pressione a tecla F2 '#13#10'- Duplo clique sobre o registro'#13#10'- Pre' +
        'ssione o bot'#227'o Troca/Devolu'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 7
      Top = 6
      Width = 156
      Height = 11
      Caption = '* Itens alterados em vermelho.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnFechar: TBitBtn
      Left = 798
      Top = 6
      Width = 137
      Height = 59
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Cancel = True
      Caption = 'ESC - Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnTrocaDevolucao: TBitBtn
      Left = 658
      Top = 6
      Width = 137
      Height = 59
      Cursor = crHandPoint
      Hint = 'TROCA OU DEVOLU'#199#195'O DE PRODUTOS'
      Caption = 'F2 - Troca/Devolu'#231#227'o'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
        33333333333F8888883F33330000324334222222443333388F3833333388F333
        000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
        F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
        223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
        3338888300003AAAAAAA33333333333888888833333333330000333333333333
        333333333333333333FFFFFF000033333333333344444433FFFF333333888888
        00003A444333333A22222438888F333338F3333800003A2243333333A2222438
        F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
        22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
        33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnTrocaDevolucaoClick
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 218
    Width = 944
    Height = 310
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 938
    object grdItemVenda: TDBGrid
      Left = 1
      Top = 1
      Width = 942
      Height = 308
      Cursor = crHandPoint
      Align = alClient
      DataSource = dm.dtsItem_Venda
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grdItemVendaDrawColumnCell
      OnDblClick = grdItemVendaDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'N_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' DA VENDA'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'ITEM'
          Width = 100
          Visible = True
        end
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
          FieldName = 'DESC_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'DESCRI'#199#195'O'
          Width = 250
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTDE'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UND'
          Title.Alignment = taCenter
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAL_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'VAL. UNIT'#193'RIO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'SUBTOTAL'
          Width = 100
          Visible = True
        end>
    end
  end
end
