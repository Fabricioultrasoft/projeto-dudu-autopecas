object dmConexao: TdmConexao
  OldCreateOrder = False
  Left = 789
  Top = 247
  Height = 196
  Width = 227
  object Conexao: TSQLConnection
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 88
    Top = 16
  end
  object PDF: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 64
    Top = 95
  end
  object HTML: TRvRenderHTML
    DisplayName = 'Web Page (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    UseBreakingSpaces = False
    Left = 24
    Top = 95
  end
  object RTF: TRvRenderRTF
    DisplayName = 'Rich Text Format (RTF)'
    FileExtension = '*.rtf'
    Left = 104
    Top = 95
  end
  object TEXT: TRvRenderText
    DisplayName = 'Plain Text (TXT)'
    FileExtension = '*.txt'
    CPI = 10.000000000000000000
    LPI = 6.000000000000000000
    Left = 144
    Top = 95
  end
end
