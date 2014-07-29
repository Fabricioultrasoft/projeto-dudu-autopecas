unit uDm;

interface

uses
  SysUtils, Classes, Windows, FMTBcd, DB, DBClient, Provider, SqlExpr, uFuncao, ACBrNFe,
  RLFilters, RLPDFFilter, RLRichFilter, RLXLSFilter, RLHTMLFilter, Graphics, StdCtrls,
  Dialogs, jpeg, pngimage, GIFImg;

type
  Tdm = class(TDataModule)
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    dtsUsuario: TDataSource;
    qryUsuario: TSQLQuery;
    qryUsuarioCOD_USER: TStringField;
    cdsUsuarioCOD_USER: TStringField;
    qryGrupo: TSQLQuery;
    dspGrupo: TDataSetProvider;
    cdsGrupo: TClientDataSet;
    dtsGrupo: TDataSource;
    qryGrupoDESC_GRUPO: TStringField;
    qryGrupoDATA_CADASTRO: TDateField;
    qryGrupoCOD_GRUPO: TStringField;
    cdsGrupoDESC_GRUPO: TStringField;
    cdsGrupoDATA_CADASTRO: TDateField;
    cdsGrupoCOD_GRUPO: TStringField;
    qryCliente: TSQLQuery;
    cdsCliente: TClientDataSet;
    dtsCliente: TDataSource;
    dspCliente: TDataSetProvider;
    cdsClienteCOD_CLI: TStringField;
    cdsClienteINSC_EST: TStringField;
    strngfldClienteNOME_RAZAO: TStringField;
    qryClienteCOD_CLI: TStringField;
    qryClienteNOME_RAZAO: TStringField;
    qryClienteINSC_EST: TStringField;
    qryClienteFONE: TStringField;
    qryClienteCEP: TStringField;
    qryClienteRUA: TStringField;
    qryClienteNUMERO: TIntegerField;
    qryClienteBAIRRO: TStringField;
    qryClienteCIDADE: TStringField;
    qryClienteUF: TStringField;
    cdsClienteFONE: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteRUA: TStringField;
    cdsClienteNUMERO: TIntegerField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
    qryFornecedor: TSQLQuery;
    dtsFornecedor: TDataSource;
    dspFornecedor: TDataSetProvider;
    cdsFornecedor: TClientDataSet;
    qryFornecedorCOD_FORN: TStringField;
    qryFornecedorDESC_FORN: TStringField;
    qryFornecedorFONE: TStringField;
    qryFornecedorREPRESENTANTE: TStringField;
    qryFornecedorFONE_REPRES: TStringField;
    cdsFornecedorCOD_FORN: TStringField;
    cdsFornecedorDESC_FORN: TStringField;
    cdsFornecedorFONE: TStringField;
    cdsFornecedorREPRESENTANTE: TStringField;
    cdsFornecedorFONE_REPRES: TStringField;
    qryProduto: TSQLQuery;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dtsProduto: TDataSource;
    qryProdutoCOD_PROD: TStringField;
    qryProdutoDESC_PROD: TStringField;
    qryProdutoCOD_GRUPO: TStringField;
    qryProdutoDESC_GRUPO: TStringField;
    cdsProdutoCOD_PROD: TStringField;
    cdsProdutoDESC_PROD: TStringField;
    cdsProdutoCOD_GRUPO: TStringField;
    cdsProdutoDESC_GRUPO: TStringField;
    qryEstoque: TSQLQuery;
    cdsEstoque: TClientDataSet;
    dtsEstoque: TDataSource;
    dspEstoque: TDataSetProvider;
    qryEstoqueDESC_PROD: TStringField;
    cdsEstoqueDESC_PROD: TStringField;
    qryEstoqueDESC_GRUPO: TStringField;
    cdsEstoqueDESC_GRUPO: TStringField;
    qryEntrada_Produto: TSQLQuery;
    dtsEntrada_Produto: TDataSource;
    cdsEntrada_Produto: TClientDataSet;
    dspEntrada_Produto: TDataSetProvider;
    qryEntrada_ProdutoN_NOTA: TStringField;
    cdsEntrada_ProdutoN_NOTA: TStringField;
    qryAgenda: TSQLQuery;
    dspAgenda: TDataSetProvider;
    cdsAgenda: TClientDataSet;
    dtsAgenda: TDataSource;
    strngfldAgendaCONTATO: TStringField;
    strngfldAgendaFONE: TStringField;
    strngfldAgendaCELULAR: TStringField;
    strngfldAgendaEMAIL: TStringField;
    strngfldAgendaCONTATO1: TStringField;
    strngfldAgendaFONE1: TStringField;
    strngfldAgendaCELULAR1: TStringField;
    strngfldAgendaEMAIL1: TStringField;
    intgrfldAgendaID: TIntegerField;
    intgrfldAgendaID1: TIntegerField;
    stringUsuarioPRIVILEGIO: TStringField;
    stringUsuarioSENHA: TStringField;
    dtfldUsuarioDATA_CADASTRO: TDateField;
    stringUsuarioPRIVILEGIO1: TStringField;
    stringUsuarioSENHA1: TStringField;
    dtfldUsuarioDATA_CADASTRO1: TDateField;
    qryVenda: TSQLQuery;
    cdsVenda: TClientDataSet;
    dtsVenda: TDataSource;
    dspVenda: TDataSetProvider;
    stringVendaN_VENDA: TStringField;
    dtfldVendaDATA_VENDA: TDateField;
    stringVendaCOD_CLI: TStringField;
    fmtbcdfldVendaVAL_TOTAL: TFMTBCDField;
    stringVendaCOD_FUNC: TStringField;
    stringVendaN_VENDA1: TStringField;
    dtfldVendaDATA_VENDA1: TDateField;
    stringVendaCOD_CLI1: TStringField;
    fmtbcdfldVendaVAL_TOTAL1: TFMTBCDField;
    stringVendaCOD_FUNC1: TStringField;
    qryItem_Venda: TSQLQuery;
    dspItem_Venda: TDataSetProvider;
    cdsItem_Venda: TClientDataSet;
    dtsItem_Venda: TDataSource;
    stringItem_VendaN_VENDA: TStringField;
    stringItem_VendaCOD_PROD: TStringField;
    stringItem_VendaDESC_PROD: TStringField;
    fmtbcdfldItem_VendaVAL_PROD: TFMTBCDField;
    fmtbcdfldItem_VendaTOTAL_PROD: TFMTBCDField;
    stringItem_VendaN_VENDA1: TStringField;
    stringItem_VendaCOD_PROD1: TStringField;
    stringItem_VendaDESC_PROD1: TStringField;
    fmtbcdfldItem_VendaVAL_PROD1: TFMTBCDField;
    fmtbcdfldItem_VendaTOTAL_PROD1: TFMTBCDField;
    intgrfldItem_VendaID_ITEM: TIntegerField;
    ID_ITEM: TIntegerField;
    cdsItem_VendaS_TOTAL: TAggregateField;
    intgrfldItem_VendaID: TIntegerField;
    intgrfldItem_VendaID1: TIntegerField;
    dtsCaixa: TDataSource;
    stringEntrada_ProdutoDESC_PROD: TStringField;
    stringEntrada_ProdutoDESC_PROD1: TStringField;
    qryCaixa: TSQLQuery;
    dtfldCaixaDATA_ENTRADA: TDateField;
    fmtbcdfldCaixaVALOR_PAGAMENTO: TFMTBCDField;
    stringCaixaN_DOCUMENTO: TStringField;
    cdsCaixa: TClientDataSet;
    dspCaixa: TDataSetProvider;
    dtfldCaixaDATA_ENTRADA1: TDateField;
    fmtbcdfldCaixaVALOR_PAGAMENTO1: TFMTBCDField;
    stringCaixaN_DOCUMENTO1: TStringField;
    stringUsuarioDESC_USUARIO: TStringField;
    stringUsuarioDESC_USUARIO1: TStringField;
    fmtbcdfldEstoqueVAL_CUSTO: TFMTBCDField;
    fmtbcdfldEstoqueVAL_VENDA: TFMTBCDField;
    fmtbcdfldEstoqueVAL_CUSTO1: TFMTBCDField;
    fmtbcdfldEstoqueVAL_VENDA1: TFMTBCDField;
    stringEntrada_ProdutoREF_PROD: TStringField;
    fmtbcdfldEntrada_ProdutoVAL_CUSTO: TFMTBCDField;
    fmtbcdfldEntrada_ProdutoVAL_VENDA: TFMTBCDField;
    stringEntrada_ProdutoREF_PROD1: TStringField;
    qryVenda_Fornecedor: TSQLQuery;
    stringVenda_FornecedorDESC_PROD: TStringField;
    stringVenda_FornecedorCOD_FORN: TStringField;
    stringVenda_FornecedorDESC_FORN: TStringField;
    dtfldVenda_FornecedorDATA_CADASTRO: TDateField;
    lrgntfldVenda_FornecedorTOTAL: TLargeintField;
    dspVenda_Fornecedor: TDataSetProvider;
    cdsVenda_Fornecedor: TClientDataSet;
    dtsVenda_Fornecedor: TDataSource;
    stringCaixaTIPO_DOCUMENTO: TStringField;
    stringCaixaTIPO_DOCUMENTO1: TStringField;
    stringVendaSTATUS: TStringField;
    stringVendaSTATUS1: TStringField;
    stringEntrada_ProdutoEAN13: TStringField;
    stringEntrada_ProdutoDUN14: TStringField;
    stringEntrada_ProdutoEAN14: TStringField;
    stringEntrada_ProdutoDUN15: TStringField;
    fmtbcdfldVendaDESCONTO1: TFMTBCDField;
    fmtbcdfldVendaSUB_TOTAL: TFMTBCDField;
    fmtbcdfldVendaSUB_TOTAL1: TFMTBCDField;
    fmtbcdfldItem_VendaDESCONTO: TFMTBCDField;
    fmtbcdfldItem_VendaDESCONTO1: TFMTBCDField;
    qryVendaDESCONTO: TFMTBCDField;
    qryEstoqueEAN13: TStringField;
    cdsEstoqueEAN13: TStringField;
    qryItem_VendaEAN13: TStringField;
    cdsItem_VendaEAN13: TStringField;
    qryUsuarioNOME: TStringField;
    qryUsuarioCHAPA: TStringField;
    cdsUsuarioNOME: TStringField;
    cdsUsuarioCHAPA: TStringField;
    qryProdutoEAN13: TStringField;
    qryProdutoDUN14: TStringField;
    cdsProdutoEAN13: TStringField;
    cdsProdutoDUN14: TStringField;
    qryProdutoCODIGO_NCM: TStringField;
    cdsProdutoCODIGO_NCM: TStringField;
    qryProdutoTIPO_PROD: TStringField;
    cdsProdutoTIPO_PROD: TStringField;
    qryClienteCNPJ_CPF: TStringField;
    cdsClienteCNPJ_CPF: TStringField;
    qryEntrada_ProdutoDATA_VALIDADE: TDateField;
    cdsEntrada_ProdutoDATA_VALIDADE: TDateField;
    strngfldCaixaRESPONSAVEL: TStringField;
    strngfldCaixaOBSERVACAO: TStringField;
    strngfldCaixaRESPONSAVEL1: TStringField;
    strngfldCaixaOBSERVACAO1: TStringField;
    qryVenda_FornecedorEAN13: TStringField;
    cdsVenda_FornecedorDESC_PROD: TStringField;
    cdsVenda_FornecedorCOD_FORN: TStringField;
    cdsVenda_FornecedorDESC_FORN: TStringField;
    cdsVenda_FornecedorDATA_CADASTRO: TDateField;
    cdsVenda_FornecedorTOTAL: TLargeintField;
    cdsVenda_FornecedorEAN13: TStringField;
    qryEntrada_ProdutoPERC_LUCRO: TFMTBCDField;
    cdsEntrada_ProdutoPERC_LUCRO: TFMTBCDField;
    qryUnidade: TSQLQuery;
    dspUnidade: TDataSetProvider;
    cdsUnidade: TClientDataSet;
    dtsUnidade: TDataSource;
    qryUnidadeCOD_UND: TStringField;
    qryUnidadeDESC_UND: TStringField;
    qryUnidadeSIGLA: TStringField;
    cdsUnidadeCOD_UND: TStringField;
    cdsUnidadeDESC_UND: TStringField;
    cdsUnidadeSIGLA: TStringField;
    qryProdutoUND_VENDA: TStringField;
    qryProdutoLOCAL_ESTOQUE: TStringField;
    qryProdutoSECAO: TStringField;
    cdsProdutoUND_VENDA: TStringField;
    cdsProdutoLOCAL_ESTOQUE: TStringField;
    cdsProdutoSECAO: TStringField;
    qryEntradaNF: TSQLQuery;
    dspEntradaNF: TDataSetProvider;
    cdsEntradaNF: TClientDataSet;
    dtsEntradaNF: TDataSource;
    qryEntradaNFN_NOTA: TStringField;
    qryEntradaNFCHAVE_NFE: TStringField;
    qryEntradaNFCOD_FORN: TStringField;
    qryEntradaNFDATA_ENTRADA: TDateField;
    qryEntradaNFVALOR_TOTAL: TFMTBCDField;
    qryEntradaNFRESPONSAVEL: TStringField;
    qryEntradaNFDESC_FORN: TStringField;
    cdsEntradaNFN_NOTA: TStringField;
    cdsEntradaNFCHAVE_NFE: TStringField;
    cdsEntradaNFCOD_FORN: TStringField;
    cdsEntradaNFDATA_ENTRADA: TDateField;
    cdsEntradaNFVALOR_TOTAL: TFMTBCDField;
    cdsEntradaNFRESPONSAVEL: TStringField;
    cdsEntradaNFDESC_FORN: TStringField;
    strngfldEntrada_ProdutoUND_COMPRA: TStringField;
    strngfldEntrada_ProdutoUND_COMPRA1: TStringField;
    qryEntrada_ProdutoID: TIntegerField;
    intgrfldEntrada_ProdutoID: TIntegerField;
    cdsEntrada_ProdutoVAL_CUSTO: TFMTBCDField;
    cdsEntrada_ProdutoVAL_VENDA: TFMTBCDField;
    qryEstoqueUND_VENDA: TStringField;
    cdsEstoqueUND_VENDA: TStringField;
    qryVendaDINHEIRO: TFMTBCDField;
    qryVendaCARTAO: TFMTBCDField;
    qryVendaCHEQUE: TFMTBCDField;
    qryVendaTICKET: TFMTBCDField;
    cdsVendaDINHEIRO: TFMTBCDField;
    cdsVendaCARTAO: TFMTBCDField;
    cdsVendaCHEQUE: TFMTBCDField;
    cdsVendaTICKET: TFMTBCDField;
    qryCaixaDINHEIRO: TFMTBCDField;
    qryCaixaCARTAO: TFMTBCDField;
    qryCaixaCHEQUE: TFMTBCDField;
    qryCaixaTICKET: TFMTBCDField;
    cdsCaixaDINHEIRO: TFMTBCDField;
    cdsCaixaCARTAO: TFMTBCDField;
    cdsCaixaCHEQUE: TFMTBCDField;
    cdsCaixaTICKET: TFMTBCDField;
    RLPDFFilter1: TRLPDFFilter;
    qryProdutoESTOQUE_MINIMO: TFMTBCDField;
    cdsProdutoESTOQUE_MINIMO: TFMTBCDField;
    qryEntrada_ProdutoQTDE: TFMTBCDField;
    cdsEntrada_ProdutoQTDE: TFMTBCDField;
    qryItem_VendaQTDE: TFMTBCDField;
    cdsItem_VendaQTDE: TFMTBCDField;
    qryEstoqueQTDE: TFMTBCDField;
    qryEstoqueESTOQUE_MINIMO: TFMTBCDField;
    cdsEstoqueQTDE: TFMTBCDField;
    cdsEstoqueESTOQUE_MINIMO: TFMTBCDField;
    qryEntrada_ProdutoQTDE_CONVERSAO: TFMTBCDField;
    qryEntrada_ProdutoUND_CONVERSAO: TStringField;
    cdsEntrada_ProdutoQTDE_CONVERSAO: TFMTBCDField;
    cdsEntrada_ProdutoUND_CONVERSAO: TStringField;
    qryEntrada_ProdutoVAL_PROD_NF: TFMTBCDField;
    cdsEntrada_ProdutoVAL_PROD_NF: TFMTBCDField;
    RLHTMLFilter1: TRLHTMLFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLRichFilter1: TRLRichFilter;
    qryDevolucao: TSQLQuery;
    dspDevolucao: TDataSetProvider;
    cdsDevolucao: TClientDataSet;
    dtsDevolucao: TDataSource;
    intgrfldDevolucaoID: TIntegerField;
    strngfldDevolucaoCOD_DEVOLUCAO: TStringField;
    strngfldDevolucaoMOTIVO: TStringField;
    qryDevolucaoVALOR_ITEM: TFMTBCDField;
    strngfldDevolucaoOBSERVACAO: TStringField;
    strngfldDevolucaoACAO_TOMADA: TStringField;
    qryDevolucaoQTDE: TFMTBCDField;
    strngfldDevolucaoCOD_FUNC: TStringField;
    strngfldDevolucaoN_VENDA: TStringField;
    intgrfldDevolucaoITEM: TIntegerField;
    qryDevolucaoDATA: TDateField;
    strngfldDevolucaoEAN13: TStringField;
    intgrfldDevolucaoID1: TIntegerField;
    strngfldDevolucaoCOD_DEVOLUCAO1: TStringField;
    strngfldDevolucaoMOTIVO1: TStringField;
    cdsDevolucaoVALOR_ITEM: TFMTBCDField;
    strngfldDevolucaoOBSERVACAO1: TStringField;
    strngfldDevolucaoACAO_TOMADA1: TStringField;
    cdsDevolucaoQTDE: TFMTBCDField;
    strngfldDevolucaoCOD_FUNC1: TStringField;
    strngfldDevolucaoN_VENDA1: TStringField;
    intgrfldDevolucaoITEM1: TIntegerField;
    cdsDevolucaoDATA: TDateField;
    strngfldDevolucaoEAN14: TStringField;
    strngfldDevolucaoREF_PROD: TStringField;
    strngfldDevolucaoREF_PROD1: TStringField;
    strngfldDevolucaoSTATUS: TStringField;
    strngfldDevolucaoDESC_PROD: TStringField;
    strngfldDevolucaoSTATUS1: TStringField;
    strngfldDevolucaoDESC_PROD1: TStringField;
    strngfldItem_VendaSTATUS: TStringField;
    strngfldItem_VendaSTATUS1: TStringField;
    qryItem_VendaUND: TStringField;
    cdsItem_VendaUND: TStringField;
    qryCaixaESTORNO: TFMTBCDField;
    cdsCaixaESTORNO: TFMTBCDField;
    qryDescarte: TSQLQuery;
    dspDescarte: TDataSetProvider;
    cdsDescarte: TClientDataSet;
    dtsDescarte: TDataSource;
    strngfldDevolucaoUND: TStringField;
    strngfldDevolucaoUND1: TStringField;
    qryDescarteID: TIntegerField;
    qryDescarteEAN13: TStringField;
    qryDescarteQTDE: TFMTBCDField;
    qryDescarteDATA_DESCARTE: TDateField;
    qryDescarteMOTIVO: TStringField;
    qryDescarteCOD_FORN: TStringField;
    qryDescarteCOD_FUNC: TStringField;
    qryDescarteDESC_PROD: TStringField;
    qryDescarteREF_PROD: TStringField;
    qryDescarteUND: TStringField;
    qryDescarteSTATUS: TStringField;
    qryDescarteORIGEM: TStringField;
    cdsDescarteID: TIntegerField;
    cdsDescarteEAN13: TStringField;
    cdsDescarteQTDE: TFMTBCDField;
    cdsDescarteDATA_DESCARTE: TDateField;
    cdsDescarteMOTIVO: TStringField;
    cdsDescarteCOD_FORN: TStringField;
    cdsDescarteCOD_FUNC: TStringField;
    cdsDescarteDESC_PROD: TStringField;
    cdsDescarteREF_PROD: TStringField;
    cdsDescarteUND: TStringField;
    cdsDescarteSTATUS: TStringField;
    cdsDescarteORIGEM: TStringField;
    qryACL: TSQLQuery;
    dspACL: TDataSetProvider;
    cdsACL: TClientDataSet;
    dtsACL: TDataSource;
    intgrfldACLID: TIntegerField;
    strngfldACLJANELA: TStringField;
    strngfldACLDESCRICAO: TStringField;
    qryACLADMINISTRADOR: TSmallintField;
    qryACLFUNCIONARIO: TSmallintField;
    intgrfldACLID1: TIntegerField;
    strngfldACLJANELA1: TStringField;
    strngfldACLDESCRICAO1: TStringField;
    cdsACLADMINISTRADOR: TSmallintField;
    cdsACLFUNCIONARIO: TSmallintField;
    qryItem_VendaDATA_CADASTRO: TDateField;
    cdsItem_VendaDATA_CADASTRO: TDateField;
    qryEntradaEstoque: TSQLQuery;
    cdsEntradaEstoque: TClientDataSet;
    dspEntradaEstoque: TDataSetProvider;
    dtsEntradaEstoque: TDataSource;
    qryEntradaEstoqueVALOR_TOTAL: TFMTBCDField;
    strngfldEntradaEstoqueCHAVE_NFE: TStringField;
    strngfldEntradaEstoqueN_NOTA: TStringField;
    qryEntradaEstoqueDATA_CADASTRO: TDateField;
    strngfldEntradaEstoqueEAN13: TStringField;
    strngfldEntradaEstoqueDESC_PROD: TStringField;
    qryEntradaEstoqueQTDE_CONVERSAO: TFMTBCDField;
    strngfldEntradaEstoqueUND_CONVERSAO: TStringField;
    qryEntradaEstoqueQTDE: TFMTBCDField;
    qryEntradaEstoqueVAL_CUSTO: TFMTBCDField;
    qryEntradaEstoqueVAL_VENDA: TFMTBCDField;
    strngfldEntradaEstoqueDESC_FORN: TStringField;
    cdsEntradaEstoqueVALOR_TOTAL: TFMTBCDField;
    strngfldEntradaEstoqueCHAVE_NFE1: TStringField;
    strngfldEntradaEstoqueN_NOTA1: TStringField;
    cdsEntradaEstoqueDATA_CADASTRO: TDateField;
    strngfldEntradaEstoqueEAN14: TStringField;
    strngfldEntradaEstoqueDESC_PROD1: TStringField;
    cdsEntradaEstoqueQTDE_CONVERSAO: TFMTBCDField;
    strngfldEntradaEstoqueUND_CONVERSAO1: TStringField;
    cdsEntradaEstoqueQTDE: TFMTBCDField;
    cdsEntradaEstoqueVAL_CUSTO: TFMTBCDField;
    cdsEntradaEstoqueVAL_VENDA: TFMTBCDField;
    strngfldEntradaEstoqueDESC_FORN1: TStringField;
    strngfldProdutoIMAGEM: TStringField;
    strngfldProdutoIMAGEM1: TStringField;
    strngfldEstoqueIMAGEM: TStringField;
    strngfldEstoqueIMAGEM1: TStringField;
    qryProdutoATIVO: TSmallintField;
    cdsProdutoATIVO: TSmallintField;
    qryEstoqueATIVO: TSmallintField;
    cdsEstoqueATIVO: TSmallintField;
    strngfldProdutoDESC_CUPOM: TStringField;
    strngfldProdutoDESC_CUPOM1: TStringField;
    strngfldEstoqueDESC_CUPOM: TStringField;
    strngfldEstoqueDESC_CUPOM1: TStringField;
    function CarregaPrivilegio: TStringList;
    function CarregaUnidadeMedida: TStringList;
    procedure cdsItem_VendaAfterScroll(DataSet: TDataSet);
  private

  public
    procedure AtualizaCDSProduto(Nota: string);
    function HexToTColor(sColor: string): TColor;
    procedure CarregaDescFornecedor(Codigo: string; var Edit: TEdit);
    procedure CarregaDescProduto(EAN13: string; var Edit: TEdit);
    procedure CapturaDimensaoImagem(Caminho: string; var largura,altura: integer);
  end;

var
  dm: Tdm;

const
    //Cláusula SELECT básica para todas as consultas
    SELECT: string = 'SELECT E.N_NOTA, E.COD_PROD, P.DESC_PROD, E.QTDE, E.UND, E.TIPO_ENTRADA, E.DATA_ENTRADA, E.REF_PROD, E.COD_FORN, F.DESC_FORN, '+
                     'E.VAL_CUSTO, E.VAL_VENDA, E.EAN13, E.DUN14, E.CODIGO_NCM, E.TIPO_PROD '               +
                     'FROM ENTRADA_PRODUTO E, PRODUTO P, FORNECEDOR F '          +
                     'WHERE E.COD_PROD = P.COD_PROD AND E.COD_FORN = F.COD_FORN AND REF_PROD = :REF';

    SELECT_UND: string = 'SELECT SIGLA FROM UNIDADE ';

    ORDERBY_UND: string = 'ORDER BY SIGLA';

    SELECT_PRODUTO: string = 'SELECT E.ID, E.N_NOTA, E.REF_PROD, P.DESC_PROD, E.QTDE, E.UND_COMPRA, E.VAL_CUSTO, E.VAL_VENDA, P.EAN13, P.DUN14, E.DATA_VALIDADE, E.PERC_LUCRO, E.UND_CONVERSAO, '+
                             'E.QTDE_CONVERSAO, E.VAL_PROD_NF '+
                             'FROM ENTRADA_PRODUTO E INNER JOIN PRODUTO P ON E.EAN13=P.EAN13 ';

    WHERE_PRODUTO: string = 'WHERE E.N_NOTA = :nota';

    // Instrução SQL para carregar a descrição do Produto
    SQLDESC_PROD : string = 'SELECT DESC_PROD FROM PRODUTO WHERE EAN13 = :ean13';

    // Instrução SQL para carregar a descrição do Fornecedor
    SQLDESC_FORN : string = 'SELECT DESC_FORN FROM FORNECEDOR WHERE COD_FORN = :cod';

implementation

uses UdmConexao, uPDV, uProcura_Venda;

{$R *.dfm}

procedure Tdm.CapturaDimensaoImagem(Caminho: string; var largura,
  altura: integer);
var
   tempGIF, tempJPEG, tempBMP, tempPNG: TGraphic;
   MS: TMemoryStream;
   FirstBytes: AnsiString;
begin
    try
       MS := TMemoryStream.Create;
       MS.LoadFromFile(Caminho);
       SetLength(FirstBytes, 8);
       MS.Read(FirstBytes[1], 8);

       if Copy(FirstBytes, 1, 2) = 'BM' then
       begin
          tempBMP := TBitmap.Create;
          tempBMP.LoadFromFile(Caminho);
          largura := tempBMP.Width;
          altura  := tempBMP.Height;
          FreeAndNil(tempBMP);
       end
       else
            if FirstBytes = #137'PNG'#13#10#26#10 then
            begin
                tempPNG := TPngImage.Create;
                tempPNG.LoadFromFile(Caminho);
                largura := tempPNG.Width;
                altura  := tempPNG.Height;
                FreeAndNil(tempPNG);
            end
            else
               if Copy(FirstBytes, 1, 2) = #$FF#$D8 then
               begin
                   tempJPEG := TJPEGImage.Create;
                   tempJPEG.LoadFromFile(Caminho);
                   largura := tempJPEG.Width;
                   altura  := tempJPEG.Height;
                   FreeAndNil(tempJPEG);
               end
               else
                  if Copy(FirstBytes, 1, 3) =  'GIF' then
                  begin
                      tempGIF := TGIFImage.Create;
                      tempGIF.LoadFromFile(Caminho);
                      largura := tempGIF.Width;
                      altura  := tempGIF.Height;
                      FreeAndNil(tempGIF);
                  end;
    finally

    end;
end;

function Tdm.HexToTColor(sColor: string): TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

procedure Tdm.AtualizaCDSProduto(Nota: string);
begin
     dm.cdsEntrada_Produto.Close;
     dm.qryEntrada_Produto.Close;
     dm.qryEntrada_Produto.SQL.Clear;
     dm.qryEntrada_Produto.SQL.Add(SELECT_PRODUTO);
     dm.qryEntrada_Produto.SQL.Add(WHERE_PRODUTO);
     dm.qryEntrada_Produto.ParamByName('nota').AsString := Nota;
     dm.qryEntrada_Produto.Open;
     dm.cdsEntrada_Produto.Open;
end;

procedure Tdm.CarregaDescFornecedor(Codigo: string; var Edit: TEdit);
var
   qry: TSQLQuery;
begin
    if Codigo <> '' then
    begin
         try
             qry := TSQLQuery.Create(nil);
             qry.SQLConnection := dmConexao.Conexao;

             qry.Close;
             qry.SQL.Clear;
             qry.SQL.Add(SQLDESC_FORN);
             qry.ParamByName('cod').AsString := codigo;
             qry.Open;

             if not qry.IsEmpty then
                Edit.text := qry.Fields[0].AsString
             else
             begin
                 MessageDlg('Fornecedor não encontrado!', mtError, [mbOK], 0);
                 Edit.SetFocus;
             end;
         except
            on E:Exception do
            ShowMessage('Erro ao procurar fornecedor !'#13#10 + E.Message);
         end;
    end;
end;

procedure Tdm.CarregaDescProduto(EAN13: string; var Edit: TEdit);
var
   qry: TSQLQuery;
begin
    if EAN13 <> '' then
    begin
        try
             qry := TSQLQuery.Create(nil);
             qry.SQLConnection := dmConexao.Conexao;

             qry.Close;
             qry.SQL.Clear;
             qry.SQL.Add(SQLDESC_PROD);
             qry.ParamByName('ean13').AsString := EAN13;
             qry.Open;

             if not qry.IsEmpty then
                Edit.text := qry.Fields[0].AsString
             else
             begin
                 MessageDlg('Produto não encontrado!', mtError, [mbOK], 0);
                 Edit.SetFocus;
             end;
        except
            on E:Exception do
            ShowMessage('Erro ao procurar produto !'#13#10 + E.Message);
        end;
    end;
end;

function Tdm.CarregaPrivilegio: TStringList;
var
    lista : TStringList;
begin
      //Carrega os privilégios
      lista := TStringList.Create;
      lista.Add('ADMINISTRAÇÃO');;
      lista.Add('FUNCIONÁRIO');

      Result := lista;
end;

function Tdm.CarregaUnidadeMedida: TStringList;
var
    lista : TStringList;
    qry   : TSQLQuery;
begin
      try
         qry := TSQLQuery.Create(nil);
         qry.SQLConnection := dmConexao.Conexao;

         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(SELECT_UND);
         qry.SQL.Add(ORDERBY_UND);
         qry.Open;

         lista := TStringList.Create;
         if not qry.IsEmpty then
         begin
              while not qry.Eof do
              begin
                  //Carrega as unidades de medida
                  lista.Add(qry.Fields[0].AsString);
                  qry.Next;
              end;
         end;
      except

      end;
      Result := lista;
end;

procedure Tdm.cdsItem_VendaAfterScroll(DataSet: TDataSet);
begin
     if (Assigned(frmPDV)) and (not Assigned(frmProcura_Venda))then
     begin
         //Carrega os valores no Form PDV
         frmPDV.edtProduto.Text        := dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString;
         frmPDV.edtValor_Unitario.Text := IntToStr(dm.cdsItem_Venda.FieldByName('QTDE').AsInteger) + ' x ' + FormatFloat('##0.00', dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat);
         frmPDV.edtSub_total.Text      := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat);
     end;
end;

end.
