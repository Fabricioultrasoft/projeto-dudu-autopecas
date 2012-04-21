unit uDm;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, uFuncao, ACBrNFe;

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
    cdsClienteCNPJ: TStringField;
    cdsClienteINSC_EST: TStringField;
    strngfldClienteNOME_RAZAO: TStringField;
    qryClienteCOD_CLI: TStringField;
    qryClienteNOME_RAZAO: TStringField;
    qryClienteCNPJ: TStringField;
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
    qryProdutoESTOQUE_MINIMO: TIntegerField;
    qryProdutoUND: TStringField;
    qryProdutoCOD_GRUPO: TStringField;
    qryProdutoDESC_GRUPO: TStringField;
    qryProdutoAPLICACAO: TStringField;
    cdsProdutoCOD_PROD: TStringField;
    cdsProdutoDESC_PROD: TStringField;
    cdsProdutoESTOQUE_MINIMO: TIntegerField;
    cdsProdutoUND: TStringField;
    cdsProdutoCOD_GRUPO: TStringField;
    cdsProdutoDESC_GRUPO: TStringField;
    cdsProdutoAPLICACAO: TStringField;
    qryEstoque: TSQLQuery;
    cdsEstoque: TClientDataSet;
    dtsEstoque: TDataSource;
    dspEstoque: TDataSetProvider;
    qryEstoqueREF_PROD: TStringField;
    qryEstoqueCOD_PROD: TStringField;
    qryEstoqueDESC_PROD: TStringField;
    qryEstoqueQTDE: TIntegerField;
    qryEstoqueESTOQUE_MINIMO: TIntegerField;
    qryEstoqueUND: TStringField;
    cdsEstoqueREF_PROD: TStringField;
    cdsEstoqueCOD_PROD: TStringField;
    cdsEstoqueDESC_PROD: TStringField;
    cdsEstoqueQTDE: TIntegerField;
    cdsEstoqueESTOQUE_MINIMO: TIntegerField;
    cdsEstoqueUND: TStringField;
    qryEstoqueAPLICACAO: TStringField;
    cdsEstoqueAPLICACAO: TStringField;
    qryEstoqueDESC_GRUPO: TStringField;
    cdsEstoqueDESC_GRUPO: TStringField;
    qryEntrada_Produto: TSQLQuery;
    dtsEntrada_Produto: TDataSource;
    cdsEntrada_Produto: TClientDataSet;
    dspEntrada_Produto: TDataSetProvider;
    qryEntrada_ProdutoN_NOTA: TStringField;
    qryEntrada_ProdutoCOD_PROD: TStringField;
    qryEntrada_ProdutoQTDE: TIntegerField;
    qryEntrada_ProdutoUND: TStringField;
    qryEntrada_ProdutoTIPO_ENTRADA: TStringField;
    qryEntrada_ProdutoDATA_ENTRADA: TDateField;
    cdsEntrada_ProdutoN_NOTA: TStringField;
    cdsEntrada_ProdutoCOD_PROD: TStringField;
    cdsEntrada_ProdutoQTDE: TIntegerField;
    cdsEntrada_ProdutoUND: TStringField;
    cdsEntrada_ProdutoTIPO_ENTRADA: TStringField;
    cdsEntrada_ProdutoDATA_ENTRADA: TDateField;
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
    qryOrcamento: TSQLQuery;
    dspOrcamento: TDataSetProvider;
    cdsOrcamento: TClientDataSet;
    dtsOrcamento: TDataSource;
    strngfldOrcamentoCOD_ORC: TStringField;
    dtfldOrcamentoDATA_ORCAMENTO: TDateField;
    strngfldOrcamentoTIPO_ORCAMENTO: TStringField;
    fmtbcdfldOrcamentoVAL_TOTAL: TFMTBCDField;
    qryItem_Orc: TSQLQuery;
    cdsItem_Orc: TClientDataSet;
    strngfldItem_OrcCOD_ORC: TStringField;
    strngfldItem_OrcCOD_PROD: TStringField;
    strngfldItem_OrcDESC_PROD: TStringField;
    intgrfldItem_OrcQTDE: TIntegerField;
    fmtbcdfldItem_OrcVAL_PROD: TFMTBCDField;
    fmtbcdfldItem_OrcTOTAL_PROD: TFMTBCDField;
    strngfldOrcamentoCOD_ORC1: TStringField;
    dtfldOrcamentoDATA_ORCAMENTO1: TDateField;
    strngfldOrcamentoTIPO_ORCAMENTO1: TStringField;
    fmtbcdfldOrcamentoVAL_TOTAL1: TFMTBCDField;
    strngfldItem_OrcCOD_ORC1: TStringField;
    strngfldItem_OrcCOD_PROD1: TStringField;
    strngfldItem_OrcDESC_PROD1: TStringField;
    intgrfldItem_OrcQTDE1: TIntegerField;
    fmtbcdfldItem_OrcVAL_PROD1: TFMTBCDField;
    fmtbcdfldItem_OrcTOTAL_PROD1: TFMTBCDField;
    dtsItem_Orc: TDataSource;
    dspItem_Orc: TDataSetProvider;
    cdsItem_OrcS_TOTAL_PROD: TAggregateField;
    stringUsuarioPRIVILEGIO: TStringField;
    stringUsuarioSENHA: TStringField;
    dtfldUsuarioDATA_CADASTRO: TDateField;
    stringUsuarioPRIVILEGIO1: TStringField;
    stringUsuarioSENHA1: TStringField;
    dtfldUsuarioDATA_CADASTRO1: TDateField;
    stringOrcamentoCOD_FUNC: TStringField;
    stringOrcamentoCOD_FUNC1: TStringField;
    intgrfldItem_OrcID: TIntegerField;
    intgrfldItem_OrcID1: TIntegerField;
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
    intgrfldItem_VendaQTDE: TIntegerField;
    fmtbcdfldItem_VendaVAL_PROD: TFMTBCDField;
    fmtbcdfldItem_VendaTOTAL_PROD: TFMTBCDField;
    stringItem_VendaN_VENDA1: TStringField;
    stringItem_VendaCOD_PROD1: TStringField;
    stringItem_VendaDESC_PROD1: TStringField;
    intgrfldItem_VendaQTDE1: TIntegerField;
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
    intgrfldCaixaID_PAGAMENTO: TIntegerField;
    stringCaixaTIPO_PAGAMENTO: TStringField;
    stringCaixaN_DOCUMENTO: TStringField;
    cdsCaixa: TClientDataSet;
    dspCaixa: TDataSetProvider;
    dtfldCaixaDATA_ENTRADA1: TDateField;
    fmtbcdfldCaixaVALOR_PAGAMENTO1: TFMTBCDField;
    intgrfldCaixaID_PAGAMENTO1: TIntegerField;
    stringCaixaTIPO_PAGAMENTO1: TStringField;
    stringCaixaN_DOCUMENTO1: TStringField;
    stringUsuarioDESC_USUARIO: TStringField;
    stringUsuarioDESC_USUARIO1: TStringField;
    intgrfldVendaID_PAGAMENTO: TIntegerField;
    intgrfldVendaID_PAGAMENTO1: TIntegerField;
    stringOrcamentoDESC_USUARIO: TStringField;
    stringOrcamentoDESC_USUARIO1: TStringField;
    stringEstoqueTIPO_ENTRADA: TStringField;
    stringEstoqueTIPO_ENTRADA1: TStringField;
    stringItem_OrcTIPO_ENTRADA: TStringField;
    stringItem_OrcTIPO_ENTRADA1: TStringField;
    stringItem_VendaTIPO_ENTRADA: TStringField;
    stringItem_VendaTIPO_ENTRADA1: TStringField;
    fmtbcdfldEstoqueVAL_CUSTO: TFMTBCDField;
    fmtbcdfldEstoqueVAL_VENDA: TFMTBCDField;
    fmtbcdfldEstoqueVAL_CUSTO1: TFMTBCDField;
    fmtbcdfldEstoqueVAL_VENDA1: TFMTBCDField;
    stringEntrada_ProdutoREF_PROD: TStringField;
    fmtbcdfldEntrada_ProdutoVAL_CUSTO: TFMTBCDField;
    fmtbcdfldEntrada_ProdutoVAL_VENDA: TFMTBCDField;
    stringEntrada_ProdutoREF_PROD1: TStringField;
    fmtbcdfldEntrada_ProdutoVAL_CUSTO1: TFMTBCDField;
    fmtbcdfldEntrada_ProdutoVAL_VENDA1: TFMTBCDField;
    stringEntrada_ProdutoDESC_FORN: TStringField;
    stringEntrada_ProdutoDESC_FORN1: TStringField;
    stringEntrada_ProdutoCOD_FORN: TStringField;
    stringEntrada_ProdutoCOD_FORN1: TStringField;
    qryVenda_Fornecedor: TSQLQuery;
    stringVenda_FornecedorREF_PROD: TStringField;
    stringVenda_FornecedorDESC_PROD: TStringField;
    stringVenda_FornecedorCOD_FORN: TStringField;
    stringVenda_FornecedorDESC_FORN: TStringField;
    dtfldVenda_FornecedorDATA_CADASTRO: TDateField;
    lrgntfldVenda_FornecedorTOTAL: TLargeintField;
    dspVenda_Fornecedor: TDataSetProvider;
    cdsVenda_Fornecedor: TClientDataSet;
    dtsVenda_Fornecedor: TDataSource;
    ID_ITEMOrcamentoID_PAGAMENTO: TIntegerField;
    ID_ITEMOrcamentoID_PAGAMENTO1: TIntegerField;
    stringCaixaTIPO_DOCUMENTO: TStringField;
    stringCaixaTIPO_DOCUMENTO1: TStringField;
    stringOrcamentoTIPO_PAGAMENTO: TStringField;
    stringOrcamentoTIPO_PAGAMENTO1: TStringField;
    stringItem_OrcREF_PROD: TStringField;
    stringItem_OrcREF_PROD1: TStringField;
    stringItem_VendaREF_PROD: TStringField;
    stringItem_VendaREF_PROD1: TStringField;
    stringItem_OrcTIPO_ORCAMENTO: TStringField;
    stringItem_OrcTIPO_ORCAMENTO1: TStringField;
    stringVendaSTATUS: TStringField;
    stringVendaSTATUS1: TStringField;
    stringVendaTIPO_PAGAMENTO: TStringField;
    stringVendaTIPO_PAGAMENTO1: TStringField;
    ACBrNFe: TACBrNFe;
    stringEntrada_ProdutoEAN13: TStringField;
    stringEntrada_ProdutoDUN14: TStringField;
    stringEntrada_ProdutoEAN14: TStringField;
    stringEntrada_ProdutoDUN15: TStringField;
    fmtbcdfldVendaDESCONTO: TFMTBCDField;
    fmtbcdfldVendaDESCONTO1: TFMTBCDField;
    fmtbcdfldVendaSUB_TOTAL: TFMTBCDField;
    fmtbcdfldVendaSUB_TOTAL1: TFMTBCDField;
    stringEntrada_ProdutoCODIGO_NCM: TStringField;
    stringEntrada_ProdutoCODIGO_NCM1: TStringField;
    ID_ITEMEntrada_ProdutoTIPO_PROD: TIntegerField;
    ID_ITEMEntrada_ProdutoTIPO_PROD1: TIntegerField;
    fmtbcdfldItem_VendaDESCONTO: TFMTBCDField;
    fmtbcdfldItem_VendaDESCONTO1: TFMTBCDField;
    function CarregaPrivilegio: TStringList;
    procedure intgrfldItem_OrcQTDE1Validate(Sender: TField);
    procedure cdsItem_OrcAfterPost(DataSet: TDataSet);
    function Busca_ItemPedido(N_Venda: string): Boolean;
    function Busca_EntradaProduto(Referencia: string):boolean;
    function Busca_Produto(Codigo: string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

const
    //Cláusula SELECT básica para todas as consultas
    SELECT: string = 'SELECT E.N_NOTA, E.COD_PROD, P.DESC_PROD, E.QTDE, E.UND, E.TIPO_ENTRADA, E.DATA_ENTRADA, E.REF_PROD, E.COD_FORN, F.DESC_FORN, '+
                     'E.VAL_CUSTO, E.VAL_VENDA, E.EAN13, E.DUN14, E.CODIGO_NCM, E.TIPO_PROD '               +
                     'FROM ENTRADA_PRODUTO E, PRODUTO P, FORNECEDOR F '          +
                     'WHERE E.COD_PROD = P.COD_PROD AND E.COD_FORN = F.COD_FORN AND REF_PROD = :REF';

implementation

uses UdmConexao, uOrcamento, uPDV;

{$R *.dfm}

function Tdm.Busca_ItemPedido(N_Venda: string): Boolean;
begin
     cdsItem_Venda.Close;
     with qryItem_Venda do
     begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT * FROM ITEM_VENDA WHERE N_VENDA = :VENDA');
         Params[0].AsString := N_Venda;
         Open;
     end;
     cdsItem_Venda.Open;

     Result := false;
     if cdsItem_Venda.RecordCount > 0 then
        Result := true;
end;

function Tdm.Busca_Produto(Codigo: string): boolean;
begin
     cdsProduto.Close;
     with qryProduto do
     begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND, P.COD_GRUPO, G.DESC_GRUPO, P.APLICACAO');
         SQL.Add('FROM PRODUTO P, GRUPO G');
         SQL.Add('WHERE P.COD_GRUPO = G.COD_GRUPO AND COD_PROD = :COD');
         Params[0].AsString := Codigo;
         Open;
     end;
     cdsProduto.Open;

     Result := false;
     if cdsProduto.RecordCount > 0 then
        Result := true;
end;

function Tdm.Busca_EntradaProduto(Referencia: string): boolean;
begin
     cdsEntrada_Produto.Close;
     with qryEntrada_Produto do
     begin
         Close;
         SQL.Clear;
         SQL.Add(SELECT);
         Params[0].AsString := Referencia;
         Open;
     end;
     cdsEntrada_Produto.Open;

     Result := false;
     if cdsEntrada_Produto.RecordCount > 0 then
        Result := true;
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

procedure Tdm.cdsItem_OrcAfterPost(DataSet: TDataSet);
begin
    //Carrega o valor total dos itens no edtVal_Total
    if Assigned(frmOrcamento) and (dm.cdsItem_Orc.FieldByName('TOTAL_PROD').AsInteger >= 0) then
    begin
        frmOrcamento.edtVal_Total.Text := FormatFloat('##0.00', dm.cdsItem_Orc.FieldByName('S_TOTAL_PROD').Value);
    end;
end;

procedure Tdm.intgrfldItem_OrcQTDE1Validate(Sender: TField);
begin
     //Calcula o valor total dos produtos após a inclusão da quantidade
     if Assigned(frmOrcamento) then
     begin
         dm.cdsItem_Orc.FieldByName('TOTAL_PROD').AsFloat := TFuncoes.CalculaValorProd(dm.cdsItem_Orc.FieldByName('QTDE').AsInteger, dm.cdsItem_Orc.FieldByName('VAL_PROD').AsFloat);
     end;
end;

end.
