unit uProcura_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, uDm, ComCtrls, DBCtrls, uFormBase,
  Buttons, uPDV, pcnConversao, UdmConexao, uMenu, uForma_Pagamento, uQtde;

type
  TfrmProcura_Venda = class(TFormBase)
    pnlProcura: TPanel;
    grdItemVenda: TDBGrid;
    pnlRodape: TPanel;
    pnlInformacao: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNVenda: TEdit;
    dbtNVenda: TDBText;
    dbtDataVenda: TDBText;
    dbtValorTotal: TDBText;
    dbtPagamento: TDBText;
    btnFechar: TBitBtn;
    btnGeraNFe: TBitBtn;
    procedure edtNVendaChange(Sender: TObject);
    procedure PesquisaVenda();
    procedure btnGeraNFeClick(Sender: TObject);
    procedure GeraNFe();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExcluirItem();
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnAlterarQtdeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Venda: TfrmProcura_Venda;


const
    //Cláusula SELECT padrão para todas as consultas
    SELECT : string = 'SELECT V.N_VENDA, V.DATA_VENDA, V.COD_CLI, V.VAL_TOTAL, V.ID_PAGAMENTO, P.TIPO_PAGAMENTO, V.COD_FUNC, V.STATUS, V.DESCONTO, V.SUB_TOTAL ' +
                       'FROM VENDA V, PAGAMENTO P ';

    //Cláusula WHERE padrão para todas as consultas
    WHERE  : string = 'WHERE V.ID_PAGAMENTO = P.ID';

implementation

{$R *.dfm}

procedure TfrmProcura_Venda.btnAlterarQtdeClick(Sender: TObject);
begin
    try
      frmQtde := TfrmQtde.Create(self);
      frmQtde.ShowModal;
    finally
      FreeAndNil(frmQtde);
    end;
end;

procedure TfrmProcura_Venda.btnExcluirItemClick(Sender: TObject);
begin
     ExcluirItem();
end;

procedure TfrmProcura_Venda.btnGeraNFeClick(Sender: TObject);
begin
    GeraNFe()
end;

procedure TfrmProcura_Venda.edtNVendaChange(Sender: TObject);
begin
    PesquisaVenda();
end;

procedure TfrmProcura_Venda.ExcluirItem();
begin
     //Procedimento para excluir item da venda
     if dm.cdsItem_Venda.RecordCount > 0 then
     begin
        try
            if Application.MessageBox('Deseja excluir esse Item?', 'Confirmação', MB_YESNO)= mrYes then
            begin
                dm.cdsItem_Venda.Delete;
                dm.cdsItem_Venda.ApplyUpdates(0);
                //dm.cdsItem_Venda.Refresh;
            end;
        except
            on E:Exception do
            ShowMessage('Erro ao excluir Item !'#13#10 + E.Message);
         end;
     end;
end;

procedure TfrmProcura_Venda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.cdsVenda.Close;
     dm.cdsItem_Venda.Close;
     Action := caFree;
end;

procedure TfrmProcura_Venda.GeraNFe;
var
  NumItem: integer;
begin
    //Verifica se um registro foi selecionado
    if dm.cdsVenda.RecordCount = 0 then
    begin
         ShowMessage('É necessário selecionar um Pedido!');
         Abort;
    end;

    if dm.cdsItem_Venda.RecordCount = 0 then
    begin
        ShowMessage('Não existe itens nesse Pedido!');
        Abort;
    end;

    dm.ACBrNFe.NotasFiscais.Clear;

    //Repasse de informações para o componente ACBrNFe
    with dm.ACBrNFe.NotasFiscais.Add.NFe do
    begin
        //Informações do cabeçalho da NFe
        Ide.cNF     := StrToInt(dm.cdsVenda.FieldByName('N_VENDA').AsString);
        Ide.natOp   := 'VENDA';
        Ide.indPag  := ipVista;
        Ide.modelo  := 55;
        Ide.serie   := 1;
        Ide.nNF     := StrToInt(dm.cdsVenda.FieldByName('N_VENDA').AsString);
        Ide.dEmi    := now;
        Ide.dSaiEnt := now;
        Ide.tpNF    := tnSaida;
        Ide.tpImp   := tiRetrato;
        Ide.verProc := frmMenu.GetBuildInfo;
        Ide.cUF     := dmConexao.nCod_UF;
        Ide.cMunFG  := dmConexao.nCod_municipio;

        case dmConexao.nAmbiente of
           0: Ide.tpAmb  := taProducao;
           1: Ide.tpAmb  := taHomologacao;
        end;

        //Dados do Emitente
        Emit.CNPJCPF           := dmConexao.sCNPJ;
        Emit.IE                := dmConexao.sI_E;
        Emit.xNome             := dmConexao.sFantasia;
        Emit.xFant             := dmConexao.sFantasia;
        Emit.CRT               := crtSimplesNacional;
        Emit.EnderEmit.xLgr    := dmConexao.sEndereco;
        Emit.EnderEmit.nro     := dmConexao.sNumero;
        Emit.EnderEmit.xCpl    := '';
        Emit.EnderEmit.xBairro := dmConexao.sBairro;
        Emit.EnderEmit.cMun    := dmConexao.nCod_municipio;
        Emit.EnderEmit.xMun    := dmConexao.sCidade;
        Emit.EnderEmit.UF      := dmConexao.sUF;
        Emit.EnderEmit.CEP     := StrToInt(dmConexao.sCEP);
        Emit.EnderEmit.fone    := dmConexao.sTelefone;
        Emit.EnderEmit.cPais   := dmConexao.nCod_pais;
        Emit.EnderEmit.xPais   := dmConexao.sPais;

        //Dados de Destinatário
        Dest.CNPJCPF           := '22611499802';
        //Dest.IE                := '0';
        Dest.xNome             := 'William Francisco Leite';
        Dest.EnderDest.xLgr    := 'R: jorge de Lima';
        Dest.EnderDest.nro     := '22';
        Dest.EnderDest.xBairro := 'Jd. Santa Maria';
        Dest.EnderDest.cMun    := dmConexao.nCod_municipio;
        Dest.EnderDest.xMun    := 'São Roque';
        Dest.EnderDest.UF      := 'SP';
        Dest.EnderDest.CEP     := 18132360;
        Dest.EnderDest.cPais   := dmConexao.nCod_pais;
        Dest.EnderDest.xPais   := dmConexao.sPais;
        Dest.EnderDest.fone    := '1147125656';

        //Dados da Entrega
        //Entrega.xLgr           :=
        //Entrega.nro            :=
        //Entrega.xCpl           :=
        //Entrega.xBairro        :=
        //Entrega.cMun           :=
        //Entrega.xMun           :=
        //Entrega.UF             :=

        //Informações dos itens
        NumItem := 0;
        dm.cdsItem_Venda.First;
        while not dm.cdsItem_Venda.Eof do
        begin
             dm.Busca_EntradaProduto(dm.cdsItem_Venda.FieldByName('REF_PROD').AsString);
             dm.Busca_Produto(dm.cdsItem_Venda.FieldByName('COD_PROD').AsString);
             Inc(NumItem);
             with Det.Add do
             begin
                 Prod.nItem   := NumItem;
                 Prod.cProd   := dm.cdsItem_Venda.FieldByName('REF_PROD').AsString;
                 Prod.cEAN    := dm.cdsEntrada_Produto.FieldByName('EAN13').AsString;
                 Prod.xProd   := dm.cdsProduto.FieldByName('DESC_PROD').AsString;
                 Prod.NCM     := dm.cdsEntrada_Produto.FieldByName('CODIGO_NCM').AsString;
                 Prod.EXTIPI  := '';

                 case dm.cdsEntrada_Produto.FieldByName('TIPO_PROD').AsInteger of
                     0, 1, 2, 4: Prod.CFOP := '5405';
                 else
                     Prod.CFOP    := '5405';
                 end;

                 //Informações do produto
                 Prod.uCom     := dm.cdsEntrada_Produto.FieldByName('UND').AsString;
                 Prod.qCom     := dm.cdsItem_Venda.FieldByName('QTDE').AsFloat;
                 Prod.vUnCom   := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat;
                 Prod.cEANTrib := dm.cdsEntrada_Produto.FieldByName('EAN13').AsString;

                 //Campos de Tributação
                 Prod.cEANTrib := dm.cdsEntrada_Produto.FieldByName('EAN13').AsString;;
                 Prod.uTrib    := dm.cdsEntrada_Produto.FieldByName('UND').AsString;
                 Prod.qTrib    := dm.cdsItem_Venda.FieldByName('QTDE').AsFloat;
                 Prod.vUnTrib  := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat;

                 //Valores Adicionais
                 Prod.vFrete    := 0;
                 Prod.vSeg      := 0;
                 Prod.vProd     := dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat;
                 Prod.vDesc     := dm.cdsItem_Venda.FieldByName('DESCONTO').AsFloat;
                 Prod.IndTot    := itSomaTotalNFe;

                 with Imposto do
                 begin
                     with ICMS do
                     begin
                        //CST         := cst41;
                        orig        := oeNacional;
                        CSOSN       := csosn102;
                     end;
                 end;
             end;
            dm.cdsItem_Venda.Next;
        end;

        Total.ICMSTot.vII    := 0;
        Total.ICMSTot.vBC    := 0;
        Total.ICMSTot.vBCST  := 0;
        Total.ICMSTot.vST    := 0;
        Total.ICMSTot.vFrete := 0;
        Total.ICMSTot.vICMS  := 0;
        Total.ICMSTot.vFrete := 0;
        Total.ICMSTot.vSeg   := 0;
        Total.ICMSTot.vII    := 0;
        Total.ICMSTot.vIPI   := 0;
        Total.ICMSTot.vOutro := 0;
        Total.ICMSTot.vProd  := dm.cdsVenda.FieldByName('SUB_TOTAL').AsFloat;
        Total.ICMSTot.vDesc  := dm.cdsVenda.FieldByName('DESCONTO').AsFloat;;
        Total.ICMSTot.vNF    := dm.cdsVenda.FieldByName('VAL_TOTAL').AsFloat;
    end;

    dm.ACBrNFe.NotasFiscais.GerarNFe;
    dm.ACBrNFe.NotasFiscais.SaveToFile(dmConexao.sPath_Arquivo, false);
    ShowMessage('Arquivo xml gerado com sucesso! ' + dm.ACBrNFe.NotasFiscais.Items[0].NomeArq);
end;

procedure TfrmProcura_Venda.PesquisaVenda;
begin
    //Pesquisa Venda com todos parâmetros
    dm.qryVenda.Close;
    dm.qryVenda.SQL.Clear;
    dm.qryVenda.SQL.Add(SELECT);
    dm.qryVenda.SQL.Add(WHERE);

    if edtNVenda.Text <> '' then
       dm.qryVenda.SQL.Add('AND V.N_VENDA =' + QuotedStr(edtNVenda.Text));

    dm.qryVenda.Open;

    if dm.qryVenda.RecordCount > 0 then
    begin
        dm.cdsVenda.Open;
        dm.cdsVenda.Refresh;

        dm.qryItem_Venda.Close;
        dm.qryItem_Venda.SQL.Clear;
        dm.qryItem_Venda.SQL.Add('SELECT ID, ID_ITEM, N_VENDA, COD_PROD, REF_PROD, DESC_PROD, QTDE, VAL_PROD, TOTAL_PROD, TIPO_ENTRADA, DESCONTO');
        dm.qryItem_Venda.SQL.Add('FROM ITEM_VENDA');
        dm.qryItem_Venda.SQL.Add('WHERE N_VENDA =' + QuotedStr(edtNVenda.Text));
        dm.qryItem_Venda.Open;
        dm.cdsItem_Venda.Open;
        dm.cdsItem_Venda.Refresh;
    end;
end;

end.
