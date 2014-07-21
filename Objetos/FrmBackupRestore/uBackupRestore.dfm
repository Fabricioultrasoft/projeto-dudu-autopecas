object frmBackupRestore: TfrmBackupRestore
  Left = 581
  Top = 252
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Formul'#225'rio :- Backup / Restore '
  ClientHeight = 363
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcBackupRestore: TPageControl
    Left = 0
    Top = 0
    Width = 731
    Height = 291
    Cursor = crHandPoint
    ActivePage = ts1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'BACKUP'
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 723
        Height = 260
        Align = alClient
        Caption = 'Informa'#231#245'es do Backup:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lbl1: TLabel
          Left = 24
          Top = 35
          Width = 245
          Height = 16
          Caption = 'Caminho de origem do arquivo (.FDB)'
        end
        object lbl2: TLabel
          Left = 24
          Top = 93
          Width = 254
          Height = 16
          Caption = 'Informe a m'#237'dia de destino do backup:'
        end
        object lblStatus: TLabel
          Left = 8
          Top = 242
          Width = 705
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object edtDestino: TJvDirectoryEdit
          Left = 24
          Top = 112
          Width = 665
          Height = 24
          Cursor = crHandPoint
          Hint = 'Informe o caminho para gravar o backup'
          CustomHint = BalloonHint
          DialogKind = dkWin32
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edtOrigem: TJvFilenameEdit
          Left = 24
          Top = 54
          Width = 665
          Height = 24
          Hint = 'Informe o caminho para o arquivo '
          CustomHint = BalloonHint
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object animate: TAnimate
          Left = 24
          Top = 164
          Width = 272
          Height = 60
          Cursor = crHandPoint
          Color = clWhite
          CommonAVI = aviCopyFiles
          ParentColor = False
          Repetitions = 20
          StopFrame = 34
          Visible = False
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'RESTORE'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grp2: TGroupBox
        Left = 0
        Top = 0
        Width = 723
        Height = 260
        Align = alClient
        Caption = 'Informa'#231#245'es da Restaura'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lbl3: TLabel
          Left = 24
          Top = 36
          Width = 246
          Height = 16
          Caption = 'Caminho de origem do arquivo (.fbk):'
        end
        object lbl4: TLabel
          Left = 24
          Top = 94
          Width = 237
          Height = 16
          Caption = 'Informe o destino do arquivo (.FDB)'
        end
        object lblStatusRestore: TLabel
          Left = 16
          Top = 241
          Width = 681
          Height = 13
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtOrigemfbk: TJvFilenameEdit
          Left = 24
          Top = 55
          Width = 665
          Height = 24
          Hint = 'Informe o caminho para o arquivo '
          CustomHint = BalloonHint
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edtDestinoFDB: TJvDirectoryEdit
          Left = 24
          Top = 113
          Width = 665
          Height = 24
          Cursor = crHandPoint
          Hint = 'Informe o caminho para gravar o backup'
          CustomHint = BalloonHint
          DialogKind = dkWin32
          Color = clSilver
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object animateRestore: TAnimate
          Left = 24
          Top = 164
          Width = 272
          Height = 60
          Cursor = crHandPoint
          Color = clWhite
          CommonAVI = aviCopyFiles
          ParentColor = False
          Repetitions = 20
          StopFrame = 34
          Visible = False
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 291
    Width = 731
    Height = 72
    Align = alBottom
    TabOrder = 1
    object btnFechar: TBitBtn
      Left = 603
      Top = 6
      Width = 121
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
      ModalResult = 2
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
    end
    object btnExecutar: TBitBtn
      Left = 482
      Top = 6
      Width = 121
      Height = 59
      Cursor = crHandPoint
      Hint = 'Executar A'#231#227'o'
      Caption = 'F3 - Executar'
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnExecutarClick
    end
  end
  object ShellResources1: TShellResources
    Left = 584
    Top = 16
  end
  object BalloonHint: TBalloonHint
    Delay = 250
    Left = 512
    Top = 16
  end
end
