object frmPrincipal: TfrmPrincipal
  Left = 480
  Top = 216
  BorderIcons = []
  Caption = 'Rotina de Backup :: Base de dados'
  ClientHeight = 272
  ClientWidth = 633
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
  object lblStatus: TLabel
    Left = 8
    Top = 256
    Width = 617
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object JvgPageControl1: TJvgPageControl
    Left = 8
    Top = 8
    Width = 617
    Height = 241
    Cursor = crHandPoint
    ActivePage = tsBackup
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = ilimglist
    ParentFont = False
    Style = tsButtons
    TabOrder = 0
    TabStop = False
    TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnFace
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clBtnHighlight
    TabStyle.Font.Height = -13
    TabStyle.Font.Name = 'Arial'
    TabStyle.Font.Style = []
    TabStyle.TextStyle = fstPushed
    TabStyle.CaptionHAlign = fhaCenter
    TabStyle.Gradient.Active = False
    TabStyle.Gradient.Orientation = fgdHorizontal
    TabSelectedStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabSelectedStyle.BevelInner = bvNone
    TabSelectedStyle.BevelOuter = bvNone
    TabSelectedStyle.Bold = True
    TabSelectedStyle.BackgrColor = clSkyBlue
    TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
    TabSelectedStyle.Font.Color = clBtnText
    TabSelectedStyle.Font.Height = -13
    TabSelectedStyle.Font.Name = 'Arial'
    TabSelectedStyle.Font.Style = [fsBold]
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    DrawGlyphsOption = fwoTile
    LookLikeButtons = True
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    object tsBackup: TTabSheet
      Caption = 'Backup'
      ExplicitTop = 27
      ExplicitHeight = 210
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 609
        Height = 209
        Align = alClient
        Caption = 'Informa'#231#245'es do Backup:'
        TabOrder = 0
        ExplicitHeight = 210
        object lbl1: TLabel
          Left = 24
          Top = 23
          Width = 179
          Height = 13
          Caption = 'Caminho de origem do arquivo (.FDB)'
        end
        object lbl2: TLabel
          Left = 24
          Top = 76
          Width = 183
          Height = 13
          Caption = 'Informe a m'#237'dia de destino do backup:'
        end
        object edtDestino: TJvDirectoryEdit
          Left = 24
          Top = 95
          Width = 553
          Height = 21
          Cursor = crHandPoint
          Hint = 'Informe o caminho para gravar o backup'
          CustomHint = BalloonHint
          DialogKind = dkWin32
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object btnExecutar: TButton
          Left = 353
          Top = 169
          Width = 104
          Height = 25
          Cursor = crHandPoint
          Hint = 'Executar Backup'
          CustomHint = BalloonHint
          Caption = 'Executar '
          ImageIndex = 0
          Images = ilimglist
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnExecutarClick
        end
        object btnFechar: TButton
          Left = 473
          Top = 169
          Width = 104
          Height = 25
          Cursor = crHandPoint
          Hint = 'Fechar Aplica'#231#227'o'
          CustomHint = BalloonHint
          Caption = 'Fechar'
          ImageIndex = 1
          Images = ilimglist
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnFecharClick
        end
        object edtOrigem: TJvFilenameEdit
          Left = 24
          Top = 42
          Width = 553
          Height = 21
          Hint = 'Informe o caminho para o arquivo '
          CustomHint = BalloonHint
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object animate: TAnimate
          Left = 24
          Top = 134
          Width = 272
          Height = 60
          Cursor = crHandPoint
          CommonAVI = aviCopyFiles
          Repetitions = 20
          StopFrame = 34
          Visible = False
        end
        object ckbPastaImagem: TCheckBox
          Left = 369
          Top = 128
          Width = 208
          Height = 17
          Cursor = crHandPoint
          Caption = 'Incluir pasta com imagens dos produtos'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
      end
    end
    object tsRestore: TTabSheet
      Caption = 'Restore'
      ImageIndex = 1
      object grp2: TGroupBox
        Left = 0
        Top = 0
        Width = 609
        Height = 209
        Align = alClient
        Caption = 'Informa'#231#245'es da Restaura'#231#227'o'
        TabOrder = 0
        object lbl3: TLabel
          Left = 24
          Top = 23
          Width = 179
          Height = 13
          Caption = 'Caminho de origem do arquivo (.fbk):'
        end
        object lbl4: TLabel
          Left = 24
          Top = 76
          Width = 220
          Height = 13
          Caption = 'Informe o destino e o nome do arquivo (.FDB)'
        end
        object edtOrigemfbk: TJvFilenameEdit
          Left = 24
          Top = 42
          Width = 553
          Height = 21
          Hint = 'Informe o caminho para o arquivo '
          CustomHint = BalloonHint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edtDestinoFDB: TJvDirectoryEdit
          Left = 24
          Top = 95
          Width = 553
          Height = 21
          Cursor = crHandPoint
          Hint = 'Informe o caminho para gravar o backup'
          CustomHint = BalloonHint
          DialogKind = dkWin32
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object animateRestore: TAnimate
          Left = 24
          Top = 134
          Width = 272
          Height = 60
          Cursor = crHandPoint
          CommonAVI = aviCopyFiles
          Repetitions = 20
          StopFrame = 34
          Visible = False
        end
        object btnExecutarRestore: TButton
          Left = 353
          Top = 169
          Width = 104
          Height = 25
          Cursor = crHandPoint
          Hint = 'Executar Backup'
          CustomHint = BalloonHint
          Caption = 'Executar '
          ImageIndex = 0
          Images = ilimglist
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnExecutarRestoreClick
        end
        object btn2: TButton
          Left = 473
          Top = 169
          Width = 104
          Height = 25
          Cursor = crHandPoint
          Hint = 'Fechar Aplica'#231#227'o'
          CustomHint = BalloonHint
          Caption = 'Fechar'
          ImageIndex = 1
          Images = ilimglist
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnFecharClick
        end
      end
    end
  end
  object ilimglist: TImageList
    Left = 448
    Top = 16
    Bitmap = {
      494C010103000800280010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      80000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      8000000080000000800000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000000000000000000080808000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000808080008080800000FFFF00000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00008080800000FFFF0000FFFF00000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF000000000000000000808080000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      8000000080000000800000FFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      800000008000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000C0C0
      C000FFFFFF0000000000FFFFFF00000000000000000000000000808080000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      8000FFFF0000000080000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      8000FFFF0000FFFF00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC00C007FFDF0000FC00C007FFCF0000
      FC00C007FFC70000FC00C007000300000000C007000100000000C00700000000
      0000C007000100000000C007000300000023C007000700000001C007000F0000
      0000C007001F00000023C007007F00000063C00700FF000000C3C00701FF0000
      0107C00703FF000003FFC007FFFF000000000000000000000000000000000000
      000000000000}
  end
  object BalloonHint: TBalloonHint
    Images = ilimglist
    Delay = 250
    Left = 512
    Top = 16
  end
  object ShellResources1: TShellResources
    Left = 376
    Top = 16
  end
  object Conexao: TSQLConnection
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'Database=database.fdb'
      'User_Name=sysdba'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    VendorLib = 'fbclient.DLL'
    Left = 280
    Top = 8
  end
end
