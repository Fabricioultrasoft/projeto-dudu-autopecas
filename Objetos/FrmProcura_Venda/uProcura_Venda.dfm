object frmProcura_Venda: TfrmProcura_Venda
  Left = 140
  Top = 91
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '-'
  ClientHeight = 567
  ClientWidth = 938
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlProcura: TPanel
    Left = 0
    Top = 0
    Width = 938
    Height = 52
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -21
    object lbl5: TLabel
      Left = 16
      Top = 5
      Width = 189
      Height = 38
      Caption = 'N'#186' da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -27
      Font.Name = 'Arial Black'
      Font.Style = []
      ParentFont = False
    end
    object edtNVenda: TEdit
      Left = 211
      Top = 2
      Width = 222
      Height = 48
      AutoSize = False
      TabOrder = 0
      OnChange = edtNVendaChange
    end
  end
  object grdItemVenda: TDBGrid
    Left = 0
    Top = 202
    Width = 938
    Height = 315
    Align = alClient
    DataSource = dm.dtsItem_Venda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'ITEM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REF_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'REFER'#202'NCIA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COD_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'C'#211'DIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 241
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTDE'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'VAL. PROD.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'TOTAL PROD.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO_ENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'TP. ENTRADA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 107
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 517
    Width = 938
    Height = 50
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 523
    object btnCancelaVenda: TBitBtn
      Left = 398
      Top = 6
      Width = 146
      Height = 35
      Cancel = True
      Caption = '&Cancelar Venda'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
    end
    object btnExcluirItem: TBitBtn
      Left = 584
      Top = 6
      Width = 146
      Height = 35
      Caption = 'C&ancelar Item'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
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
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnClick = btnExcluirItemClick
    end
    object btnFechar: TBitBtn
      Left = 776
      Top = 6
      Width = 146
      Height = 35
      Caption = '&Fechar'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      ModalResult = 11
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 4
    end
    object btnGeraNFe: TBitBtn
      Left = 20
      Top = 6
      Width = 146
      Height = 35
      Caption = '&Gerar NFe'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnClick = btnGeraNFeClick
    end
    object btnAlterarQtde: TBitBtn
      Left = 211
      Top = 6
      Width = 146
      Height = 35
      Caption = '&Aterar qtde'
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
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
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 1
      OnClick = btnAlterarQtdeClick
    end
  end
  object pnlInformacao: TPanel
    Left = 0
    Top = 52
    Width = 938
    Height = 150
    Align = alTop
    TabOrder = 1
    object grp1: TGroupBox
      Left = 20
      Top = 6
      Width = 897
      Height = 131
      Caption = 'Informa'#231#245'es da Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbl1: TLabel
        Left = 51
        Top = 40
        Width = 79
        Height = 19
        Caption = 'N'#186' Venda: '
      end
      object lbl2: TLabel
        Left = 464
        Top = 40
        Width = 84
        Height = 19
        Caption = 'Valor Total:'
      end
      object lbl3: TLabel
        Left = 16
        Top = 96
        Width = 109
        Height = 19
        Caption = 'Data da Venda:'
      end
      object lbl4: TLabel
        Left = 463
        Top = 96
        Width = 85
        Height = 19
        Caption = 'Pagamento:'
      end
      object dbtNVenda: TDBText
        Left = 146
        Top = 28
        Width = 201
        Height = 33
        DataField = 'N_VENDA'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtDataVenda: TDBText
        Left = 146
        Top = 84
        Width = 238
        Height = 38
        DataField = 'DATA_VENDA'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtValorTotal: TDBText
        Left = 564
        Top = 28
        Width = 225
        Height = 33
        DataField = 'VAL_TOTAL'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
      object dbtPagamento: TDBText
        Left = 564
        Top = 84
        Width = 225
        Height = 30
        DataField = 'TIPO_PAGAMENTO'
        DataSource = dm.dtsVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -27
        Font.Name = 'Arial Black'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
