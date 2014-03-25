unit uProcura_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, uDm, ComCtrls, DBCtrls, uFormBase,
  Buttons, uPDV, pcnConversao, UdmConexao, uMenu, uForma_Pagamento, uQtde, Mask, uSenhaFiscal;

type
  TfrmProcura_Venda = class(TForm)
    pnlProcura: TPanel;
    pnlInformacao: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNVenda: TEdit;
    pnlRodape: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    btnFechar: TBitBtn;
    btnTrocaDevolucao: TBitBtn;
    pnl1: TPanel;
    grdItemVenda: TDBGrid;
    lbl6: TLabel;
    procedure edtNVendaChange(Sender: TObject);
    procedure PesquisaVenda();
    //procedure GeraNFe();
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCarregaVendaClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTrocaDevolucaoClick(Sender: TObject);
    procedure grdItemVendaDblClick(Sender: TObject);
  private
    { Private declarations }
  public

    procedure CarregaVenda();
  end;

var
  frmProcura_Venda: TfrmProcura_Venda;


const
    //Cláusula SELECT padrão para todas as consultas
    SELECT : string = 'SELECT V.N_VENDA, V.DATA_VENDA, V.COD_CLI, V.VAL_TOTAL, V.COD_FUNC, V.STATUS, V.DESCONTO, V.SUB_TOTAL, V.DINHEIRO, V.CHEQUE, V.CARTAO, V.TICKET ' +
                       'FROM VENDA V ';

    //Cláusula WHERE padrão para todas as consultas
    WHERE  : string = 'WHERE V.N_VENDA = :venda';

implementation

uses uTrocaDevolucao;

{$R *.dfm}

procedure TfrmProcura_Venda.btnCancelarVendaClick(Sender: TObject);
begin
    try
       frmSenhaFiscal := TfrmSenhaFiscal.Create(nil);
       frmSenhaFiscal.ShowModal;
    finally
       FreeAndNil(frmSenhaFiscal);
    end;
end;

procedure TfrmProcura_Venda.btnCarregaVendaClick(Sender: TObject);
begin
     CarregaVenda();
     frmProcura_Venda.Close;
end;

procedure TfrmProcura_Venda.btnFecharClick(Sender: TObject);
begin
     Self.Close;
end;

procedure TfrmProcura_Venda.btnTrocaDevolucaoClick(Sender: TObject);
begin
    if grdItemVenda.SelectedRows.Count > 0 then
    begin
        try
           frmTrocaDevolucao := TfrmTrocaDevolucao.Create(Self);
           frmTrocaDevolucao.ShowModal;
        finally
           FreeAndNil(frmTrocaDevolucao);
        end;
    end;
end;

procedure TfrmProcura_Venda.CarregaVenda;
begin
    //Procedimento para carregar dados da venda na tela de PDV
    if dm.cdsVenda.RecordCount > 0 then
    begin
        if Assigned(frmPDV) then
        begin
            //Carrega informações da venda
            frmPDV.sFNumeroVenda       := dm.cdsVenda.FieldByName('N_VENDA').AsString;
            frmPDV.sFCodCliente        := dm.cdsVenda.FieldByName('COD_CLI').AsString;
            frmPDV.lblData.Caption     := DateToStr(dm.cdsVenda.FieldByName('DATA_VENDA').AsDateTime);
            frmPDV.sFStatus            := dm.cdsVenda.FieldByName('STATUS').AsString;
            frmPDV.sFID_Funcionario    := dm.cdsVenda.FieldByName('COD_FUNC').AsString;
            frmPDV.dFDesconto          := dm.cdsVenda.FieldByName('DESCONTO').AsFloat;
            frmPDV.dFSub_total         := dm.cdsVenda.FieldByName('SUB_TOTAL').AsFloat;
            frmPDV.dFTotal             := dm.cdsVenda.FieldByName('VAL_TOTAL').AsFloat;
            frmPDV.edtTotal.Text  := FormatFloat('##0.00' ,dm.cdsVenda.FieldByName('SUB_TOTAL').AsFloat);
        end;
    end;
end;

procedure TfrmProcura_Venda.edtNVendaChange(Sender: TObject);
begin
    PesquisaVenda();
end;

procedure TfrmProcura_Venda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsVenda.Close;
    dm.cdsItem_Venda.Close;
    Action := caFree;
    frmProcura_Venda := nil;
end;

procedure TfrmProcura_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
        frmProcura_Venda.Close;

     if (Key = VK_F2)then
         btnTrocaDevolucao.Click
end;

procedure TfrmProcura_Venda.grdItemVendaDblClick(Sender: TObject);
begin
    btnTrocaDevolucao.Click;
end;

procedure TfrmProcura_Venda.PesquisaVenda;
begin
    try
        //Pesquisa Venda com todos parâmetros
        dm.qryVenda.Close;
        dm.qryVenda.SQL.Clear;
        dm.qryVenda.SQL.Add(SELECT);
        dm.qryVenda.SQL.Add(WHERE);
        dm.qryVenda.ParamByName('venda').AsString := trim(edtNVenda.Text);
        dm.qryVenda.Open;

        if not dm.qryVenda.IsEmpty then
        begin
            dm.cdsVenda.Open;
            dm.cdsVenda.Refresh;

            dm.qryItem_Venda.Close;
            dm.qryItem_Venda.SQL.Clear;
            dm.qryItem_Venda.SQL.Add('SELECT ID, ID_ITEM, N_VENDA, EAN13, COD_PROD, DESC_PROD, QTDE, VAL_PROD, TOTAL_PROD, DESCONTO, STATUS ');
            dm.qryItem_Venda.SQL.Add('FROM ITEM_VENDA');
            dm.qryItem_Venda.SQL.Add('WHERE N_VENDA =' + QuotedStr(edtNVenda.Text));
            dm.qryItem_Venda.Open;
            dm.cdsItem_Venda.Open;
            dm.cdsItem_Venda.Refresh;
        end;
    except
         on E:Exception do
         MessageDlg('Erro ao pesquisar venda ' + E.Message, mtError, [mbOK], 0);
    end;
end;

end.
