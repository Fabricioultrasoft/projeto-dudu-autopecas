object dm: Tdm
  OldCreateOrder = False
  Left = 290
  Top = 92
  Height = 717
  Width = 786
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Options = [poAllowCommandText, poUseQuoteChar]
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 96
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 384
    Top = 168
    object cdsUsuarioCOD_USER: TStringField
      FieldName = 'COD_USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object stringUsuarioPRIVILEGIO1: TStringField
      FieldName = 'PRIVILEGIO'
    end
    object stringUsuarioSENHA1: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object dtfldUsuarioDATA_CADASTRO1: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object stringUsuarioDESC_USUARIO1: TStringField
      FieldName = 'DESC_USUARIO'
    end
  end
  object dtsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 384
    Top = 232
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      COD_USER,'
      '       DESC_USUARIO,'
      '       PRIVILEGIO,'
      '       SENHA,'
      '       DATA_CADASTRO'
      'FROM '
      '      USUARIO')
    SQLConnection = dmConexao.Conexao
    Left = 384
    Top = 16
    object qryUsuarioCOD_USER: TStringField
      FieldName = 'COD_USER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object stringUsuarioPRIVILEGIO: TStringField
      FieldName = 'PRIVILEGIO'
    end
    object stringUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object dtfldUsuarioDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object stringUsuarioDESC_USUARIO: TStringField
      FieldName = 'DESC_USUARIO'
    end
  end
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       COD_GRUPO, '
      '       DESC_GRUPO,'
      '       DATA_CADASTRO'
      'FROM  '
      '       GRUPO')
    SQLConnection = dmConexao.Conexao
    Left = 104
    Top = 16
    object qryGrupoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object qryGrupoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object qryGrupoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Required = True
      Size = 10
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 96
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 104
    Top = 160
    object cdsGrupoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object cdsGrupoDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsGrupoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Required = True
      Size = 10
    end
  end
  object dtsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 104
    Top = 232
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COD_CLI, NOME_RAZAO, CNPJ, INSC_EST, FONE, CEP, RUA, NUME' +
        'RO, BAIRRO, CIDADE, UF'
      'FROM'
      '       CLIENTE')
    SQLConnection = dmConexao.Conexao
    Left = 544
    Top = 16
    object qryClienteCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      Required = True
      Size = 10
    end
    object qryClienteNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
    end
    object qryClienteCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object qryClienteINSC_EST: TStringField
      FieldName = 'INSC_EST'
    end
    object qryClienteFONE: TStringField
      FieldName = 'FONE'
      Visible = False
    end
    object qryClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qryClienteRUA: TStringField
      FieldName = 'RUA'
      Size = 100
    end
    object qryClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object qryClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qryClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qryClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 544
    Top = 168
    object cdsClienteCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object strngfldClienteNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
    end
    object cdsClienteCNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object cdsClienteINSC_EST: TStringField
      FieldName = 'INSC_EST'
    end
    object cdsClienteFONE: TStringField
      FieldName = 'FONE'
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClienteRUA: TStringField
      FieldName = 'RUA'
      Size = 100
    end
    object cdsClienteNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dtsCliente: TDataSource
    DataSet = cdsCliente
    Left = 544
    Top = 232
  end
  object dspCliente: TDataSetProvider
    DataSet = qryCliente
    UpdateMode = upWhereKeyOnly
    Left = 544
    Top = 96
  end
  object qryFornecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      COD_FORN,'
      '      DESC_FORN,'
      '      FONE,'
      '      REPRESENTANTE,'
      '      FONE_REPRES'
      'FROM '
      '       FORNECEDOR ')
    SQLConnection = dmConexao.Conexao
    Left = 200
    Top = 16
    object qryFornecedorCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object qryFornecedorDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
    object qryFornecedorFONE: TStringField
      FieldName = 'FONE'
    end
    object qryFornecedorREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
    object qryFornecedorFONE_REPRES: TStringField
      FieldName = 'FONE_REPRES'
    end
  end
  object dtsFornecedor: TDataSource
    DataSet = cdsFornecedor
    Left = 200
    Top = 232
  end
  object dspFornecedor: TDataSetProvider
    DataSet = qryFornecedor
    UpdateMode = upWhereKeyOnly
    Left = 200
    Top = 96
  end
  object cdsFornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFornecedor'
    Left = 200
    Top = 160
    object cdsFornecedorCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object cdsFornecedorDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 100
    end
    object cdsFornecedorFONE: TStringField
      FieldName = 'FONE'
    end
    object cdsFornecedorREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Size = 100
    end
    object cdsFornecedorFONE_REPRES: TStringField
      FieldName = 'FONE_REPRES'
    end
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND, P.COD_G' +
        'RUPO, G.DESC_GRUPO, P.APLICACAO'
      'FROM PRODUTO P, GRUPO G'
      'WHERE P.COD_GRUPO = G.COD_GRUPO')
    SQLConnection = dmConexao.Conexao
    Left = 456
    Top = 16
    object qryProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object qryProdutoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object qryProdutoESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object qryProdutoUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object qryProdutoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 10
    end
    object qryProdutoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object qryProdutoAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 255
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    UpdateMode = upWhereKeyOnly
    Left = 464
    Top = 104
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 464
    Top = 168
    object cdsProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object cdsProdutoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object cdsProdutoESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object cdsProdutoUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object cdsProdutoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 10
    end
    object cdsProdutoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object cdsProdutoAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 255
    end
  end
  object dtsProduto: TDataSource
    DataSet = cdsProduto
    Left = 464
    Top = 232
  end
  object qryEstoque: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       E.REF_PROD,'
      '       E.COD_PROD,'
      '       E.TIPO_ENTRADA,'
      '       P.DESC_PROD,'
      '       G.DESC_GRUPO,'
      '       E.QTDE,'
      '       P.ESTOQUE_MINIMO,'
      '       P.UND,'
      '       E.VAL_CUSTO,'
      '       E.VAL_VENDA,'
      '       P.APLICACAO'
      'FROM '
      '       ESTOQUE E, PRODUTO P, GRUPO G'
      'WHERE'
      '       E.COD_PROD = P.COD_PROD AND E.COD_GRUPO = G.COD_GRUPO '
      '      ')
    SQLConnection = dmConexao.Conexao
    Left = 296
    Top = 16
    object qryEstoqueREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object qryEstoqueCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object qryEstoqueDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object qryEstoqueDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object qryEstoqueQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object qryEstoqueESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object qryEstoqueUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object qryEstoqueAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 255
    end
    object stringEstoqueTIPO_ENTRADA: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object fmtbcdfldEstoqueVAL_CUSTO: TFMTBCDField
      FieldName = 'VAL_CUSTO'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldEstoqueVAL_VENDA: TFMTBCDField
      FieldName = 'VAL_VENDA'
      Precision = 15
      Size = 2
    end
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    Left = 296
    Top = 160
    object cdsEstoqueREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object cdsEstoqueCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object cdsEstoqueDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object cdsEstoqueDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object cdsEstoqueQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsEstoqueESTOQUE_MINIMO: TIntegerField
      FieldName = 'ESTOQUE_MINIMO'
    end
    object cdsEstoqueUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object cdsEstoqueAPLICACAO: TStringField
      FieldName = 'APLICACAO'
      Size = 255
    end
    object stringEstoqueTIPO_ENTRADA1: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object fmtbcdfldEstoqueVAL_CUSTO1: TFMTBCDField
      FieldName = 'VAL_CUSTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldEstoqueVAL_VENDA1: TFMTBCDField
      FieldName = 'VAL_VENDA'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
  end
  object dtsEstoque: TDataSource
    DataSet = cdsEstoque
    Left = 296
    Top = 232
  end
  object dspEstoque: TDataSetProvider
    DataSet = qryEstoque
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 96
  end
  object qryEntrada_Produto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '      E. N_NOTA,'
      '      E.COD_PROD,'
      '      E.REF_PROD,'
      '      E.COD_FORN,'
      '      F.DESC_FORN,'
      '      P.DESC_PROD,'
      '      E.QTDE,'
      '      E.UND,'
      '      E.TIPO_ENTRADA,'
      '      E.DATA_ENTRADA,'
      '      E.VAL_CUSTO,'
      '      E.VAL_VENDA,'
      '      E.EAN13,'
      '      E.DUN14,'
      '      E.CODIGO_NCM,'
      '      E.TIPO_PROD'
      'FROM'
      '     ENTRADA_PRODUTO E, PRODUTO P, FORNECEDOR F'
      'WHERE'
      '     E.COD_PROD=P.COD_PROD AND E.COD_FORN = F.COD_FORN')
    SQLConnection = dmConexao.Conexao
    Left = 48
    Top = 360
    object qryEntrada_ProdutoN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
    end
    object qryEntrada_ProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 10
    end
    object qryEntrada_ProdutoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object qryEntrada_ProdutoUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object qryEntrada_ProdutoTIPO_ENTRADA: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object qryEntrada_ProdutoDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object stringEntrada_ProdutoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object stringEntrada_ProdutoREF_PROD: TStringField
      FieldName = 'REF_PROD'
      Size = 10
    end
    object fmtbcdfldEntrada_ProdutoVAL_CUSTO: TFMTBCDField
      FieldName = 'VAL_CUSTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldEntrada_ProdutoVAL_VENDA: TFMTBCDField
      FieldName = 'VAL_VENDA'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringEntrada_ProdutoDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
    object stringEntrada_ProdutoCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object stringEntrada_ProdutoEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object stringEntrada_ProdutoDUN14: TStringField
      FieldName = 'DUN14'
      Size = 14
    end
    object stringEntrada_ProdutoCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 8
    end
    object ID_ITEMEntrada_ProdutoTIPO_PROD: TIntegerField
      FieldName = 'TIPO_PROD'
    end
  end
  object dtsEntrada_Produto: TDataSource
    DataSet = cdsEntrada_Produto
    Left = 48
    Top = 608
  end
  object cdsEntrada_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntrada_Produto'
    Left = 48
    Top = 528
    object cdsEntrada_ProdutoN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
    end
    object cdsEntrada_ProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 10
    end
    object cdsEntrada_ProdutoQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object cdsEntrada_ProdutoUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
    object cdsEntrada_ProdutoTIPO_ENTRADA: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object cdsEntrada_ProdutoDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object stringEntrada_ProdutoDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object stringEntrada_ProdutoREF_PROD1: TStringField
      FieldName = 'REF_PROD'
      Size = 10
    end
    object fmtbcdfldEntrada_ProdutoVAL_CUSTO1: TFMTBCDField
      FieldName = 'VAL_CUSTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldEntrada_ProdutoVAL_VENDA1: TFMTBCDField
      FieldName = 'VAL_VENDA'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringEntrada_ProdutoDESC_FORN1: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
    object stringEntrada_ProdutoCOD_FORN1: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object stringEntrada_ProdutoEAN14: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object stringEntrada_ProdutoDUN15: TStringField
      FieldName = 'DUN14'
      Size = 14
    end
    object stringEntrada_ProdutoCODIGO_NCM1: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 8
    end
    object ID_ITEMEntrada_ProdutoTIPO_PROD1: TIntegerField
      FieldName = 'TIPO_PROD'
    end
  end
  object dspEntrada_Produto: TDataSetProvider
    DataSet = qryEntrada_Produto
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 448
  end
  object qryAgenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       ID,'
      '        CONTATO,'
      '        FONE,'
      '        CELULAR,'
      '        EMAIL'
      'FROM '
      '        AGENDA ')
    SQLConnection = dmConexao.Conexao
    Left = 24
    Top = 16
    object intgrfldAgendaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldAgendaCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object strngfldAgendaFONE: TStringField
      FieldName = 'FONE'
    end
    object strngfldAgendaCELULAR: TStringField
      FieldName = 'CELULAR'
    end
    object strngfldAgendaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dspAgenda: TDataSetProvider
    DataSet = qryAgenda
    UpdateMode = upWhereKeyOnly
    Left = 24
    Top = 96
  end
  object cdsAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgenda'
    Left = 24
    Top = 160
    object intgrfldAgendaID1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldAgendaCONTATO1: TStringField
      FieldName = 'CONTATO'
      Size = 100
    end
    object strngfldAgendaFONE1: TStringField
      FieldName = 'FONE'
    end
    object strngfldAgendaCELULAR1: TStringField
      FieldName = 'CELULAR'
    end
    object strngfldAgendaEMAIL1: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dtsAgenda: TDataSource
    DataSet = cdsAgenda
    Left = 24
    Top = 232
  end
  object qryOrcamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     O.COD_ORC,'
      '     O.DATA_ORCAMENTO,'
      '     O.TIPO_ORCAMENTO,'
      '     O.ID_PAGAMENTO,'
      '     P.TIPO_PAGAMENTO,'
      '     O.COD_FUNC,'
      '     U.DESC_USUARIO,'
      '     O.VAL_TOTAL'
      'FROM'
      '     ORCAMENTO O, USUARIO U, PAGAMENTO P'
      'WHERE'
      '     O.COD_FUNC = U.COD_USER AND O.ID_PAGAMENTO = P.ID')
    SQLConnection = dmConexao.Conexao
    Left = 176
    Top = 360
    object strngfldOrcamentoCOD_ORC: TStringField
      FieldName = 'COD_ORC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object dtfldOrcamentoDATA_ORCAMENTO: TDateField
      FieldName = 'DATA_ORCAMENTO'
    end
    object strngfldOrcamentoTIPO_ORCAMENTO: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      Size = 1
    end
    object fmtbcdfldOrcamentoVAL_TOTAL: TFMTBCDField
      FieldName = 'VAL_TOTAL'
      Precision = 15
      Size = 2
    end
    object stringOrcamentoCOD_FUNC: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object stringOrcamentoDESC_USUARIO: TStringField
      FieldName = 'DESC_USUARIO'
    end
    object ID_ITEMOrcamentoID_PAGAMENTO: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringOrcamentoTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
  end
  object dspOrcamento: TDataSetProvider
    DataSet = qryOrcamento
    UpdateMode = upWhereKeyOnly
    Left = 176
    Top = 448
  end
  object cdsOrcamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrcamento'
    Left = 176
    Top = 528
    object strngfldOrcamentoCOD_ORC1: TStringField
      FieldName = 'COD_ORC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object dtfldOrcamentoDATA_ORCAMENTO1: TDateField
      FieldName = 'DATA_ORCAMENTO'
    end
    object strngfldOrcamentoTIPO_ORCAMENTO1: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      Size = 1
    end
    object fmtbcdfldOrcamentoVAL_TOTAL1: TFMTBCDField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringOrcamentoCOD_FUNC1: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object stringOrcamentoDESC_USUARIO1: TStringField
      FieldName = 'DESC_USUARIO'
    end
    object ID_ITEMOrcamentoID_PAGAMENTO1: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringOrcamentoTIPO_PAGAMENTO1: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
  end
  object dtsOrcamento: TDataSource
    DataSet = cdsOrcamento
    Left = 176
    Top = 608
  end
  object qryItem_Orc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     ID,'
      '     COD_ORC,'
      '     COD_PROD,'
      '     REF_PROD,'
      '     DESC_PROD, '
      '     QTDE,'
      '     VAL_PROD,'
      '     TOTAL_PROD,'
      '     TIPO_ENTRADA,'
      '     TIPO_ORCAMENTO'
      'FROM '
      '      ITEM_ORCAMENTO'
      'WHERE '
      '      COD_ORC = '#39'0'#39
      ''
      '')
    SQLConnection = dmConexao.Conexao
    Left = 280
    Top = 360
    object strngfldItem_OrcCOD_ORC: TStringField
      FieldName = 'COD_ORC'
      Size = 10
    end
    object strngfldItem_OrcCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 10
    end
    object strngfldItem_OrcDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object intgrfldItem_OrcQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object fmtbcdfldItem_OrcVAL_PROD: TFMTBCDField
      FieldName = 'VAL_PROD'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldItem_OrcTOTAL_PROD: TFMTBCDField
      FieldName = 'TOTAL_PROD'
      Precision = 15
      Size = 2
    end
    object intgrfldItem_OrcID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object stringItem_OrcTIPO_ENTRADA: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object stringItem_OrcREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object stringItem_OrcTIPO_ORCAMENTO: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      Size = 1
    end
  end
  object cdsItem_Orc: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItem_Orc'
    AfterPost = cdsItem_OrcAfterPost
    Left = 288
    Top = 528
    object strngfldItem_OrcCOD_ORC1: TStringField
      FieldName = 'COD_ORC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object strngfldItem_OrcCOD_PROD1: TStringField
      FieldName = 'COD_PROD'
      Size = 10
    end
    object strngfldItem_OrcDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object intgrfldItem_OrcQTDE1: TIntegerField
      FieldName = 'QTDE'
      OnValidate = intgrfldItem_OrcQTDE1Validate
    end
    object fmtbcdfldItem_OrcVAL_PROD1: TFMTBCDField
      FieldName = 'VAL_PROD'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldItem_OrcTOTAL_PROD1: TFMTBCDField
      FieldName = 'TOTAL_PROD'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object intgrfldItem_OrcID1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object stringItem_OrcTIPO_ENTRADA1: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object stringItem_OrcREF_PROD1: TStringField
      FieldName = 'REF_PROD'
    end
    object stringItem_OrcTIPO_ORCAMENTO1: TStringField
      FieldName = 'TIPO_ORCAMENTO'
      Size = 1
    end
    object cdsItem_OrcS_TOTAL_PROD: TAggregateField
      FieldName = 'S_TOTAL_PROD'
      Active = True
      DisplayFormat = '##0.00'
      Expression = 'SUM(TOTAL_PROD)'
    end
  end
  object dtsItem_Orc: TDataSource
    DataSet = cdsItem_Orc
    Left = 288
    Top = 608
  end
  object dspItem_Orc: TDataSetProvider
    DataSet = qryItem_Orc
    UpdateMode = upWhereKeyOnly
    Left = 280
    Top = 448
  end
  object qryVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     V. N_VENDA,'
      '     V.DATA_VENDA,'
      '     V.COD_CLI,'
      '     V.VAL_TOTAL,'
      '     V.ID_PAGAMENTO,'
      '     P.TIPO_PAGAMENTO,'
      '     V.COD_FUNC,'
      '     V.STATUS,'
      '     V.DESCONTO,'
      '     V.SUB_TOTAL'
      'FROM'
      '     VENDA V, PAGAMENTO P'
      'WHERE'
      '     V.ID_PAGAMENTO = P.ID')
    SQLConnection = dmConexao.Conexao
    Left = 384
    Top = 360
    object stringVendaN_VENDA: TStringField
      FieldName = 'N_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dtfldVendaDATA_VENDA: TDateField
      FieldName = 'DATA_VENDA'
    end
    object stringVendaCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      Required = True
      Size = 10
    end
    object fmtbcdfldVendaVAL_TOTAL: TFMTBCDField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringVendaCOD_FUNC: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object intgrfldVendaID_PAGAMENTO: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringVendaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object stringVendaTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
    object fmtbcdfldVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldVendaSUB_TOTAL: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda'
    Left = 384
    Top = 536
    object stringVendaN_VENDA1: TStringField
      FieldName = 'N_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dtfldVendaDATA_VENDA1: TDateField
      FieldName = 'DATA_VENDA'
    end
    object stringVendaCOD_CLI1: TStringField
      FieldName = 'COD_CLI'
      Required = True
      Size = 10
    end
    object fmtbcdfldVendaVAL_TOTAL1: TFMTBCDField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringVendaCOD_FUNC1: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object intgrfldVendaID_PAGAMENTO1: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringVendaSTATUS1: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object stringVendaTIPO_PAGAMENTO1: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
    object fmtbcdfldVendaDESCONTO1: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldVendaSUB_TOTAL1: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
  end
  object dtsVenda: TDataSource
    DataSet = cdsVenda
    Left = 384
    Top = 616
  end
  object dspVenda: TDataSetProvider
    DataSet = qryVenda
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 456
  end
  object qryItem_Venda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     ID,'
      '     ID_ITEM,'
      '     N_VENDA,'
      '     COD_PROD,'
      '     REF_PROD,'
      '     DESC_PROD,'
      '     QTDE,'
      '     VAL_PROD,'
      '     TOTAL_PROD,'
      '     TIPO_ENTRADA,'
      '     DESCONTO'
      'FROM'
      '      ITEM_VENDA'
      'WHERE'
      '      N_VENDA='#39'0'#39
      '')
    SQLConnection = dmConexao.Conexao
    Left = 480
    Top = 360
    object intgrfldItem_VendaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object intgrfldItem_VendaID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object stringItem_VendaN_VENDA: TStringField
      FieldName = 'N_VENDA'
      Size = 10
    end
    object stringItem_VendaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object stringItem_VendaDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object intgrfldItem_VendaQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object fmtbcdfldItem_VendaVAL_PROD: TFMTBCDField
      FieldName = 'VAL_PROD'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldItem_VendaTOTAL_PROD: TFMTBCDField
      FieldName = 'TOTAL_PROD'
      Precision = 15
      Size = 2
    end
    object stringItem_VendaTIPO_ENTRADA: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object stringItem_VendaREF_PROD: TStringField
      FieldName = 'REF_PROD'
      Size = 10
    end
    object fmtbcdfldItem_VendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
    end
  end
  object dspItem_Venda: TDataSetProvider
    DataSet = qryItem_Venda
    UpdateMode = upWhereKeyOnly
    Left = 480
    Top = 456
  end
  object cdsItem_Venda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItem_Venda'
    Left = 480
    Top = 536
    object intgrfldItem_VendaID1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object stringItem_VendaN_VENDA1: TStringField
      FieldName = 'N_VENDA'
      Size = 10
    end
    object stringItem_VendaCOD_PROD1: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object stringItem_VendaDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object intgrfldItem_VendaQTDE1: TIntegerField
      FieldName = 'QTDE'
    end
    object fmtbcdfldItem_VendaVAL_PROD1: TFMTBCDField
      FieldName = 'VAL_PROD'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldItem_VendaTOTAL_PROD1: TFMTBCDField
      FieldName = 'TOTAL_PROD'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object stringItem_VendaTIPO_ENTRADA1: TStringField
      FieldName = 'TIPO_ENTRADA'
      Size = 1
    end
    object stringItem_VendaREF_PROD1: TStringField
      FieldName = 'REF_PROD'
      Size = 10
    end
    object fmtbcdfldItem_VendaDESCONTO1: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object cdsItem_VendaS_TOTAL: TAggregateField
      FieldName = 'S_TOTAL'
      Active = True
      DisplayFormat = '##0.00'
      Expression = 'SUM(TOTAL_PROD)'
    end
  end
  object dtsItem_Venda: TDataSource
    DataSet = cdsItem_Venda
    Left = 480
    Top = 616
  end
  object dtsCaixa: TDataSource
    DataSet = cdsCaixa
    Left = 592
    Top = 616
  end
  object qryCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     C.DATA_ENTRADA,'
      '     C.VALOR_PAGAMENTO,'
      '     C.ID_PAGAMENTO,'
      '     P.TIPO_PAGAMENTO,'
      '     C.N_DOCUMENTO,'
      '     C.TIPO_DOCUMENTO'
      'FROM'
      '     CAIXA C, PAGAMENTO P'
      'WHERE'
      '      C.ID_PAGAMENTO = P.ID')
    SQLConnection = dmConexao.Conexao
    Left = 584
    Top = 360
    object dtfldCaixaDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object fmtbcdfldCaixaVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Precision = 15
      Size = 2
    end
    object intgrfldCaixaID_PAGAMENTO: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringCaixaTIPO_PAGAMENTO: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
    object stringCaixaN_DOCUMENTO: TStringField
      FieldName = 'N_DOCUMENTO'
      Size = 10
    end
    object stringCaixaTIPO_DOCUMENTO: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 592
    Top = 536
    object dtfldCaixaDATA_ENTRADA1: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object fmtbcdfldCaixaVALOR_PAGAMENTO1: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      currency = True
      Precision = 15
      Size = 2
    end
    object intgrfldCaixaID_PAGAMENTO1: TIntegerField
      FieldName = 'ID_PAGAMENTO'
    end
    object stringCaixaTIPO_PAGAMENTO1: TStringField
      FieldName = 'TIPO_PAGAMENTO'
      Size = 100
    end
    object stringCaixaN_DOCUMENTO1: TStringField
      FieldName = 'N_DOCUMENTO'
      Size = 10
    end
    object stringCaixaTIPO_DOCUMENTO1: TStringField
      FieldName = 'TIPO_DOCUMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = qryCaixa
    Left = 584
    Top = 456
  end
  object qryVenda_Fornecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM V_VENDA_FORNECEDOR'
      'WHERE COD_FORN = '#39'0'#39)
    SQLConnection = dmConexao.Conexao
    Left = 680
    Top = 360
    object stringVenda_FornecedorREF_PROD: TStringField
      FieldName = 'REF_PROD'
      Size = 10
    end
    object stringVenda_FornecedorDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object stringVenda_FornecedorCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object stringVenda_FornecedorDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
    object dtfldVenda_FornecedorDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object lrgntfldVenda_FornecedorTOTAL: TLargeintField
      FieldName = 'TOTAL'
    end
  end
  object dspVenda_Fornecedor: TDataSetProvider
    DataSet = qryVenda_Fornecedor
    Left = 680
    Top = 456
  end
  object cdsVenda_Fornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda_Fornecedor'
    Left = 688
    Top = 536
  end
  object dtsVenda_Fornecedor: TDataSource
    DataSet = cdsVenda_Fornecedor
    Left = 688
    Top = 608
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.PathSalvar = 'C:\Program Files\Embarcadero\RAD Studio\7.0\bin\'
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.IntervaloTentativas = 0
    Configuracoes.WebServices.AjustaAguardaConsultaRet = False
    Left = 640
    Top = 16
  end
end
