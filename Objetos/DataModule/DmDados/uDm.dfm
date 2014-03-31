object dm: Tdm
  OldCreateOrder = False
  Left = 473
  Top = 132
  Height = 717
  Width = 1005
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
    Top = 160
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
    object cdsUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsUsuarioCHAPA: TStringField
      FieldName = 'CHAPA'
      Size = 10
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
      '       DATA_CADASTRO,'
      '       NOME,'
      '       CHAPA'
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
    object qryUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qryUsuarioCHAPA: TStringField
      FieldName = 'CHAPA'
      Size = 10
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
      
        'SELECT COD_CLI, NOME_RAZAO, CNPJ_CPF, INSC_EST, FONE, CEP, RUA, ' +
        'NUMERO, BAIRRO, CIDADE, UF'
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
    object qryClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 544
    Top = 160
    object cdsClienteCOD_CLI: TStringField
      FieldName = 'COD_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 10
    end
    object strngfldClienteNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Size = 100
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
    object cdsClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
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
      
        'SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND_VENDA, P' +
        '.COD_GRUPO, G.DESC_GRUPO, P.EAN13, P.DUN14, P.TIPO_PROD, P.CODIG' +
        'O_NCM, P.LOCAL_ESTOQUE, P.SECAO'
      'FROM PRODUTO P LEFT JOIN GRUPO G ON P.COD_GRUPO = G.COD_GRUPO')
    SQLConnection = dmConexao.Conexao
    Left = 464
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
    object qryProdutoCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
      Size = 10
    end
    object qryProdutoDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
    end
    object qryProdutoEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object qryProdutoDUN14: TStringField
      FieldName = 'DUN14'
      Size = 14
    end
    object qryProdutoCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 8
    end
    object qryProdutoTIPO_PROD: TStringField
      FieldName = 'TIPO_PROD'
      Size = 10
    end
    object qryProdutoUND_VENDA: TStringField
      FieldName = 'UND_VENDA'
      Size = 10
    end
    object qryProdutoLOCAL_ESTOQUE: TStringField
      FieldName = 'LOCAL_ESTOQUE'
      Size = 30
    end
    object qryProdutoSECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
    object qryProdutoESTOQUE_MINIMO: TFMTBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    UpdateMode = upWhereKeyOnly
    Left = 464
    Top = 97
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 464
    Top = 160
    object cdsProdutoCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Required = True
      Size = 10
    end
    object cdsProdutoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
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
    object cdsProdutoEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object cdsProdutoDUN14: TStringField
      FieldName = 'DUN14'
      Size = 14
    end
    object cdsProdutoCODIGO_NCM: TStringField
      FieldName = 'CODIGO_NCM'
      Size = 8
    end
    object cdsProdutoTIPO_PROD: TStringField
      FieldName = 'TIPO_PROD'
      Size = 10
    end
    object cdsProdutoUND_VENDA: TStringField
      FieldName = 'UND_VENDA'
      Size = 10
    end
    object cdsProdutoLOCAL_ESTOQUE: TStringField
      FieldName = 'LOCAL_ESTOQUE'
      Size = 30
    end
    object cdsProdutoSECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
    object cdsProdutoESTOQUE_MINIMO: TFMTBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Required = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
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
      'SELECT '
      
        'E.EAN13,  P.DESC_PROD, G.DESC_GRUPO, E.QTDE, P.ESTOQUE_MINIMO, P' +
        '.UND_VENDA, E.VAL_CUSTO, E.VAL_VENDA'
      'FROM'
      
        ' ESTOQUE E INNER JOIN PRODUTO P ON E.EAN13 = P.EAN13 INNER JOIN ' +
        'GRUPO G ON E.COD_GRUPO = G.COD_GRUPO'
      '                                               '
      '      ')
    SQLConnection = dmConexao.Conexao
    Left = 296
    Top = 16
    object qryEstoqueDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object qryEstoqueDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
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
    object qryEstoqueEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object qryEstoqueUND_VENDA: TStringField
      FieldName = 'UND_VENDA'
      Size = 10
    end
    object qryEstoqueQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 18
      Size = 3
    end
    object qryEstoqueESTOQUE_MINIMO: TFMTBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Required = True
      Precision = 18
      Size = 3
    end
  end
  object cdsEstoque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstoque'
    Left = 296
    Top = 160
    object cdsEstoqueDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object cdsEstoqueDESC_GRUPO: TStringField
      FieldName = 'DESC_GRUPO'
      Required = True
      Size = 100
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
    object cdsEstoqueEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object cdsEstoqueUND_VENDA: TStringField
      FieldName = 'UND_VENDA'
      Size = 10
    end
    object cdsEstoqueQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object cdsEstoqueESTOQUE_MINIMO: TFMTBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Required = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
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
      '      E.ID,'
      '      E. N_NOTA,'
      '      E.REF_PROD,'
      '      P.DESC_PROD,'
      '      E.QTDE,'
      '      E.UND_COMPRA,'
      '      E.VAL_CUSTO,'
      '      E.VAL_VENDA,'
      '      P.EAN13,'
      '      P.DUN14,'
      '      E.DATA_VALIDADE,'
      '      E.PERC_LUCRO,'
      '      E.UND_CONVERSAO,'
      '      E.QTDE_CONVERSAO,'
      '      E.VAL_PROD_NF'
      'FROM'
      '     ENTRADA_PRODUTO E INNER JOIN PRODUTO P ON E.EAN13=P.EAN13 '
      '                                        ')
    SQLConnection = dmConexao.Conexao
    Left = 146
    Top = 360
    object qryEntrada_ProdutoN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
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
    object stringEntrada_ProdutoEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object stringEntrada_ProdutoDUN14: TStringField
      FieldName = 'DUN14'
      Size = 14
    end
    object qryEntrada_ProdutoDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
    end
    object qryEntrada_ProdutoPERC_LUCRO: TFMTBCDField
      FieldName = 'PERC_LUCRO'
      Precision = 18
      Size = 2
    end
    object strngfldEntrada_ProdutoUND_COMPRA: TStringField
      FieldName = 'UND_COMPRA'
      Required = True
      Size = 10
    end
    object qryEntrada_ProdutoID: TIntegerField
      FieldName = 'ID'
    end
    object qryEntrada_ProdutoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      Precision = 18
      Size = 3
    end
    object qryEntrada_ProdutoQTDE_CONVERSAO: TFMTBCDField
      FieldName = 'QTDE_CONVERSAO'
      Precision = 18
      Size = 3
    end
    object qryEntrada_ProdutoUND_CONVERSAO: TStringField
      FieldName = 'UND_CONVERSAO'
      Size = 10
    end
    object qryEntrada_ProdutoVAL_PROD_NF: TFMTBCDField
      FieldName = 'VAL_PROD_NF'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dtsEntrada_Produto: TDataSource
    DataSet = cdsEntrada_Produto
    Left = 146
    Top = 608
  end
  object cdsEntrada_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntrada_Produto'
    Left = 146
    Top = 528
    object cdsEntrada_ProdutoN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
    end
    object stringEntrada_ProdutoDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object stringEntrada_ProdutoREF_PROD1: TStringField
      FieldName = 'REF_PROD'
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
    object cdsEntrada_ProdutoDATA_VALIDADE: TDateField
      FieldName = 'DATA_VALIDADE'
    end
    object cdsEntrada_ProdutoPERC_LUCRO: TFMTBCDField
      FieldName = 'PERC_LUCRO'
      Precision = 18
      Size = 2
    end
    object strngfldEntrada_ProdutoUND_COMPRA1: TStringField
      FieldName = 'UND_COMPRA'
      Required = True
      Size = 10
    end
    object intgrfldEntrada_ProdutoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsEntrada_ProdutoVAL_CUSTO: TFMTBCDField
      FieldName = 'VAL_CUSTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object cdsEntrada_ProdutoVAL_VENDA: TFMTBCDField
      FieldName = 'VAL_VENDA'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object cdsEntrada_ProdutoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object cdsEntrada_ProdutoQTDE_CONVERSAO: TFMTBCDField
      FieldName = 'QTDE_CONVERSAO'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object cdsEntrada_ProdutoUND_CONVERSAO: TStringField
      FieldName = 'UND_CONVERSAO'
      Size = 10
    end
    object cdsEntrada_ProdutoVAL_PROD_NF: TFMTBCDField
      FieldName = 'VAL_PROD_NF'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspEntrada_Produto: TDataSetProvider
    DataSet = qryEntrada_Produto
    UpdateMode = upWhereKeyOnly
    Left = 146
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
    Left = 256
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
    Left = 256
    Top = 448
  end
  object cdsOrcamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrcamento'
    Left = 256
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
    Left = 256
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
    Left = 360
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
    Left = 368
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
    Left = 368
    Top = 608
  end
  object dspItem_Orc: TDataSetProvider
    DataSet = qryItem_Orc
    UpdateMode = upWhereKeyOnly
    Left = 360
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
      '     V.COD_FUNC,'
      '     V.STATUS,'
      '     V.DESCONTO,'
      '     V.SUB_TOTAL,'
      '     V.DINHEIRO,'
      '     V.CARTAO,'
      '     V.CHEQUE,'
      '     V.TICKET'
      'FROM'
      '     VENDA V'
      '')
    SQLConnection = dmConexao.Conexao
    Left = 464
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
    object stringVendaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object fmtbcdfldVendaSUB_TOTAL: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object qryVendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 18
      Size = 2
    end
    object qryVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryVendaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 18
      Size = 2
    end
    object qryVendaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 18
      Size = 2
    end
    object qryVendaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 18
      Size = 2
    end
  end
  object cdsVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda'
    Left = 464
    Top = 536
    object stringVendaN_VENDA1: TStringField
      Alignment = taCenter
      FieldName = 'N_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object dtfldVendaDATA_VENDA1: TDateField
      Alignment = taCenter
      FieldName = 'DATA_VENDA'
    end
    object stringVendaCOD_CLI1: TStringField
      FieldName = 'COD_CLI'
      Required = True
      Size = 10
    end
    object fmtbcdfldVendaVAL_TOTAL1: TFMTBCDField
      FieldName = 'VAL_TOTAL'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object stringVendaCOD_FUNC1: TStringField
      Alignment = taCenter
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object stringVendaSTATUS1: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object fmtbcdfldVendaDESCONTO1: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object fmtbcdfldVendaSUB_TOTAL1: TFMTBCDField
      FieldName = 'SUB_TOTAL'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsVendaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsVendaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dtsVenda: TDataSource
    DataSet = cdsVenda
    Left = 464
    Top = 608
  end
  object dspVenda: TDataSetProvider
    DataSet = qryVenda
    UpdateMode = upWhereKeyOnly
    Left = 464
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
      '     DESC_PROD,'
      '     QTDE,'
      '     VAL_PROD,'
      '     TOTAL_PROD,'
      '     DESCONTO,'
      '     EAN13,'
      '     STATUS,'
      '     UND'
      'FROM'
      '      ITEM_VENDA'
      'WHERE '
      '      N_VENDA = '#39'0'#39
      ''
      '')
    SQLConnection = dmConexao.Conexao
    Left = 560
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
    object qryItem_VendaEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object stringItem_VendaCOD_PROD: TStringField
      FieldName = 'COD_PROD'
      Size = 10
    end
    object stringItem_VendaDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object fmtbcdfldItem_VendaDESCONTO: TFMTBCDField
      FieldName = 'DESCONTO'
      Precision = 15
      Size = 2
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
    object qryItem_VendaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 18
      Size = 3
    end
    object strngfldItem_VendaSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryItem_VendaUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
  end
  object dspItem_Venda: TDataSetProvider
    DataSet = qryItem_Venda
    UpdateMode = upWhereKeyOnly
    Left = 560
    Top = 456
  end
  object cdsItem_Venda: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspItem_Venda'
    AfterScroll = cdsItem_VendaAfterScroll
    Left = 560
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
      Size = 10
    end
    object stringItem_VendaDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
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
    object fmtbcdfldItem_VendaDESCONTO1: TFMTBCDField
      FieldName = 'DESCONTO'
      DisplayFormat = '##0.00'
      Precision = 15
      Size = 2
    end
    object cdsItem_VendaEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object cdsItem_VendaQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object strngfldItem_VendaSTATUS1: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsItem_VendaUND: TStringField
      FieldName = 'UND'
      Size = 10
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
    Left = 560
    Top = 608
  end
  object dtsCaixa: TDataSource
    DataSet = cdsCaixa
    Left = 648
    Top = 608
  end
  object qryCaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '     C.DATA_ENTRADA,'
      '     C.VALOR_PAGAMENTO,'
      '     C.N_DOCUMENTO,'
      '     C.TIPO_DOCUMENTO,'
      '     C.RESPONSAVEL,'
      '     C.OBSERVACAO,'
      '     C.DINHEIRO,'
      '     C.CARTAO,'
      '     C.CHEQUE,'
      '     C.TICKET,'
      '     C.ESTORNO'
      'FROM'
      '     CAIXA C ')
    SQLConnection = dmConexao.Conexao
    Left = 640
    Top = 368
    object dtfldCaixaDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object fmtbcdfldCaixaVALOR_PAGAMENTO: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      Precision = 15
      Size = 2
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
    object strngfldCaixaRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
    object strngfldCaixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object qryCaixaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      Precision = 18
      Size = 2
    end
    object qryCaixaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      Precision = 18
      Size = 2
    end
    object qryCaixaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      Precision = 18
      Size = 2
    end
    object qryCaixaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      Precision = 18
      Size = 2
    end
    object qryCaixaESTORNO: TFMTBCDField
      FieldName = 'ESTORNO'
      Precision = 18
      Size = 2
    end
  end
  object cdsCaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaixa'
    Left = 648
    Top = 536
    object dtfldCaixaDATA_ENTRADA1: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object fmtbcdfldCaixaVALOR_PAGAMENTO1: TFMTBCDField
      FieldName = 'VALOR_PAGAMENTO'
      DisplayFormat = '##0.00'
      currency = True
      Precision = 15
      Size = 2
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
    object strngfldCaixaRESPONSAVEL1: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
    object strngfldCaixaOBSERVACAO1: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object cdsCaixaDINHEIRO: TFMTBCDField
      FieldName = 'DINHEIRO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaCARTAO: TFMTBCDField
      FieldName = 'CARTAO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaCHEQUE: TFMTBCDField
      FieldName = 'CHEQUE'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaTICKET: TFMTBCDField
      FieldName = 'TICKET'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object cdsCaixaESTORNO: TFMTBCDField
      FieldName = 'ESTORNO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object dspCaixa: TDataSetProvider
    DataSet = qryCaixa
    Left = 648
    Top = 456
  end
  object qryVenda_Fornecedor: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM V_VENDA_FORNECEDOR'
      'WHERE COD_FORN = '#39'0'#39)
    SQLConnection = dmConexao.Conexao
    Left = 752
    Top = 360
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
    object qryVenda_FornecedorEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
  end
  object dspVenda_Fornecedor: TDataSetProvider
    DataSet = qryVenda_Fornecedor
    Left = 752
    Top = 456
  end
  object cdsVenda_Fornecedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVenda_Fornecedor'
    Left = 760
    Top = 536
    object cdsVenda_FornecedorDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Size = 100
    end
    object cdsVenda_FornecedorCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object cdsVenda_FornecedorDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
    object cdsVenda_FornecedorDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object cdsVenda_FornecedorTOTAL: TLargeintField
      FieldName = 'TOTAL'
    end
    object cdsVenda_FornecedorEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
  end
  object dtsVenda_Fornecedor: TDataSource
    DataSet = cdsVenda_Fornecedor
    Left = 760
    Top = 616
  end
  object qryUnidade: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT COD_UND, DESC_UND, SIGLA'
      'FROM UNIDADE'
      'ORDER BY DESC_UND, SIGLA')
    SQLConnection = dmConexao.Conexao
    Left = 624
    Top = 16
    object qryUnidadeCOD_UND: TStringField
      FieldName = 'COD_UND'
      Size = 10
    end
    object qryUnidadeDESC_UND: TStringField
      FieldName = 'DESC_UND'
      Size = 10
    end
    object qryUnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
  end
  object dspUnidade: TDataSetProvider
    DataSet = qryUnidade
    UpdateMode = upWhereKeyOnly
    Left = 624
    Top = 96
  end
  object cdsUnidade: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidade'
    Left = 624
    Top = 160
    object cdsUnidadeCOD_UND: TStringField
      FieldName = 'COD_UND'
      Size = 10
    end
    object cdsUnidadeDESC_UND: TStringField
      FieldName = 'DESC_UND'
      Size = 10
    end
    object cdsUnidadeSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 3
    end
  end
  object dtsUnidade: TDataSource
    DataSet = cdsUnidade
    Left = 624
    Top = 232
  end
  object qryEntradaNF: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '       E.N_NOTA,'
      '       E.CHAVE_NFE,'
      '       E.COD_FORN,'
      '       E.DATA_ENTRADA,'
      '       E.VALOR_TOTAL,'
      '       E.RESPONSAVEL,'
      '       F.DESC_FORN'
      'FROM'
      
        '       ENTRADA_NF E INNER JOIN FORNECEDOR F ON E.COD_FORN = F.CO' +
        'D_FORN')
    SQLConnection = dmConexao.Conexao
    Left = 33
    Top = 360
    object qryEntradaNFN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
    end
    object qryEntradaNFCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 40
    end
    object qryEntradaNFCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object qryEntradaNFDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object qryEntradaNFVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryEntradaNFRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
    object qryEntradaNFDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
  end
  object dspEntradaNF: TDataSetProvider
    DataSet = qryEntradaNF
    UpdateMode = upWhereKeyOnly
    Left = 33
    Top = 448
  end
  object cdsEntradaNF: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEntradaNF'
    Left = 33
    Top = 528
    object cdsEntradaNFN_NOTA: TStringField
      FieldName = 'N_NOTA'
      Size = 10
    end
    object cdsEntradaNFCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Size = 40
    end
    object cdsEntradaNFCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object cdsEntradaNFDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
    end
    object cdsEntradaNFVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '##0.00'
      Precision = 18
      Size = 2
    end
    object cdsEntradaNFRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
    object cdsEntradaNFDESC_FORN: TStringField
      FieldName = 'DESC_FORN'
      Size = 100
    end
  end
  object dtsEntradaNF: TDataSource
    DataSet = cdsEntradaNF
    Left = 33
    Top = 608
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v1.0 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    ViewerOptions = []
    FontEncoding = feNoEncoding
    DisplayName = 'Documento PDF'
    Left = 928
    Top = 16
  end
  object RLHTMLFilter1: TRLHTMLFilter
    DocumentStyle = dsCSS2
    DisplayName = 'P'#225'gina da Web'
    Left = 936
    Top = 72
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 928
    Top = 128
  end
  object RLRichFilter1: TRLRichFilter
    DisplayName = 'Formato RichText'
    Left = 928
    Top = 192
  end
  object qryDevolucao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '      D. ID,'
      '      D.COD_DEVOLUCAO,'
      '      D.MOTIVO,'
      '      D.VALOR_ITEM,'
      '      D.OBSERVACAO,'
      '      D.ACAO_TOMADA,'
      '      D.QTDE,'
      '      D.COD_FUNC,'
      '      D.N_VENDA,'
      '      D.ITEM,'
      '      D.DATA,'
      '      D.EAN13,'
      '      D.REF_PROD,'
      '      D.STATUS,'
      '      P.DESC_PROD,'
      '      D.UND'
      'FROM '
      '     DEVOLUCAO D INNER JOIN PRODUTO P ON D.EAN13 = P.EAN13')
    SQLConnection = dmConexao.Conexao
    Left = 872
    Top = 360
    object intgrfldDevolucaoID: TIntegerField
      FieldName = 'ID'
    end
    object strngfldDevolucaoCOD_DEVOLUCAO: TStringField
      FieldName = 'COD_DEVOLUCAO'
      Size = 10
    end
    object strngfldDevolucaoMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 30
    end
    object qryDevolucaoVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      Precision = 18
      Size = 2
    end
    object strngfldDevolucaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object strngfldDevolucaoACAO_TOMADA: TStringField
      FieldName = 'ACAO_TOMADA'
      Size = 30
    end
    object qryDevolucaoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Precision = 18
      Size = 3
    end
    object strngfldDevolucaoCOD_FUNC: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object strngfldDevolucaoN_VENDA: TStringField
      FieldName = 'N_VENDA'
      Size = 10
    end
    object intgrfldDevolucaoITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object qryDevolucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object strngfldDevolucaoEAN13: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object strngfldDevolucaoREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object strngfldDevolucaoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object strngfldDevolucaoDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      ProviderFlags = []
      Size = 100
    end
    object strngfldDevolucaoUND: TStringField
      FieldName = 'UND'
      Size = 10
    end
  end
  object dspDevolucao: TDataSetProvider
    DataSet = qryDevolucao
    Left = 872
    Top = 448
  end
  object cdsDevolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDevolucao'
    Left = 872
    Top = 528
    object intgrfldDevolucaoID1: TIntegerField
      FieldName = 'ID'
    end
    object strngfldDevolucaoCOD_DEVOLUCAO1: TStringField
      FieldName = 'COD_DEVOLUCAO'
      Size = 10
    end
    object strngfldDevolucaoMOTIVO1: TStringField
      FieldName = 'MOTIVO'
      Size = 30
    end
    object cdsDevolucaoVALOR_ITEM: TFMTBCDField
      FieldName = 'VALOR_ITEM'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object strngfldDevolucaoOBSERVACAO1: TStringField
      FieldName = 'OBSERVACAO'
      Size = 255
    end
    object strngfldDevolucaoACAO_TOMADA1: TStringField
      FieldName = 'ACAO_TOMADA'
      Size = 30
    end
    object cdsDevolucaoQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object strngfldDevolucaoCOD_FUNC1: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object strngfldDevolucaoN_VENDA1: TStringField
      FieldName = 'N_VENDA'
      Size = 10
    end
    object intgrfldDevolucaoITEM1: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsDevolucaoDATA: TDateField
      FieldName = 'DATA'
    end
    object strngfldDevolucaoEAN14: TStringField
      FieldName = 'EAN13'
      Size = 13
    end
    object strngfldDevolucaoREF_PROD1: TStringField
      FieldName = 'REF_PROD'
    end
    object strngfldDevolucaoSTATUS1: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object strngfldDevolucaoDESC_PROD1: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object strngfldDevolucaoUND1: TStringField
      FieldName = 'UND'
      Size = 10
    end
  end
  object dtsDevolucao: TDataSource
    DataSet = cdsDevolucao
    Left = 872
    Top = 616
  end
  object qryDescarte: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT D.ID, D.EAN13, D.QTDE, D.DATA_DESCARTE, D.MOTIVO, D.COD_F' +
        'ORN, D.COD_FUNC, P.DESC_PROD, D.REF_PROD, D.UND, D.STATUS, D.ORI' +
        'GEM'
      'FROM DESCARTE D INNER JOIN PRODUTO P ON D.EAN13 = P.EAN13')
    SQLConnection = dmConexao.Conexao
    Left = 728
    Top = 16
    object qryDescarteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryDescarteEAN13: TStringField
      FieldName = 'EAN13'
      Required = True
      Size = 13
    end
    object qryDescarteQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object qryDescarteDATA_DESCARTE: TDateField
      FieldName = 'DATA_DESCARTE'
    end
    object qryDescarteMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 255
    end
    object qryDescarteCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object qryDescarteCOD_FUNC: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object qryDescarteDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object qryDescarteREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object qryDescarteUND: TStringField
      FieldName = 'UND'
      Required = True
      Size = 10
    end
    object qryDescarteSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryDescarteORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 1
    end
  end
  object dspDescarte: TDataSetProvider
    DataSet = qryDescarte
    Left = 728
    Top = 96
  end
  object cdsDescarte: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescarte'
    Left = 728
    Top = 160
    object cdsDescarteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsDescarteEAN13: TStringField
      FieldName = 'EAN13'
      Required = True
      Size = 13
    end
    object cdsDescarteQTDE: TFMTBCDField
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = '#0.000'
      Precision = 18
      Size = 3
    end
    object cdsDescarteDATA_DESCARTE: TDateField
      FieldName = 'DATA_DESCARTE'
    end
    object cdsDescarteMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 255
    end
    object cdsDescarteCOD_FORN: TStringField
      FieldName = 'COD_FORN'
      Size = 10
    end
    object cdsDescarteCOD_FUNC: TStringField
      FieldName = 'COD_FUNC'
      Size = 10
    end
    object cdsDescarteDESC_PROD: TStringField
      FieldName = 'DESC_PROD'
      Required = True
      Size = 100
    end
    object cdsDescarteREF_PROD: TStringField
      FieldName = 'REF_PROD'
    end
    object cdsDescarteUND: TStringField
      FieldName = 'UND'
      Required = True
      Size = 10
    end
    object cdsDescarteSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsDescarteORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 1
    end
  end
  object dtsDescarte: TDataSource
    DataSet = cdsDescarte
    Left = 736
    Top = 232
  end
end
