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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnFechar: TBitBtn;
    btnTrocaDevolucao: TBitBtn;
    pnl1: TPanel;
    grdItemVenda: TDBGrid;
    lbl6: TLabel;
    lbl7: TLabel;
    edtVenda: TEdit;
    edtData: TEdit;
    edtCodFunc: TEdit;
    edtSubTotal: TEdit;
    edtDesconto: TEdit;
    edtValorTotal: TEdit;
    edtDinheiro: TEdit;
    edtCheque: TEdit;
    edtCartao: TEdit;
    edtTicket: TEdit;
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
    procedure grdItemVendaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
    if (grdItemVenda.SelectedRows.Count > 0) then
    begin
        if (dm.cdsItem_Venda.FieldByName('QTDE').AsFloat > 0) then
        begin
            try
               frmTrocaDevolucao := TfrmTrocaDevolucao.Create(Self);
               frmTrocaDevolucao.ShowModal;
            finally
               FreeAndNil(frmTrocaDevolucao);
            end;
        end
        else
           MessageDlg('Item sem quantidade!', mtWarning, [mbOK], 0);
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

procedure TfrmProcura_Venda.grdItemVendaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    //Muda a cor da coluna conforme o status da devolução
    if dm.cdsItem_Venda.FieldByName('STATUS').AsString = 'A' then
    begin
        grdItemVenda.Canvas.Brush.Color := dm.HexToTColor('D04646');
        grdItemVenda.Canvas.FillRect(Rect);
        grdItemVenda.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
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
            edtVenda.Text      := dm.qryVenda.FieldByName('N_VENDA').AsString;
            edtData.Text       := FormatDateTime('dd/mm/yyyy', dm.qryVenda.FieldByName('DATA_VENDA').AsDateTime);
            edtCodFunc.Text    := dm.qryVenda.FieldByName('COD_FUNC').AsString;
            edtSubTotal.Text   := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('SUB_TOTAL').AsFloat);
            edtDesconto.Text   := FormatFloat('#0.00', dm.qryVenda.FieldByName('DESCONTO').AsFloat);
            edtValorTotal.Text := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('VAL_TOTAL').AsFloat);
            edtDinheiro.Text   := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('DINHEIRO').AsFloat);
            edtCheque.Text     := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('CHEQUE').AsFloat);
            edtCartao.Text     := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('CARTAO').AsFloat);
            edtTicket.Text     := FormatFloat('##,##0.00', dm.qryVenda.FieldByName('TICKET').AsFloat);

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
