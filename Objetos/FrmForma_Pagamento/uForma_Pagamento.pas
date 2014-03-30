unit uForma_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uFormBase, ACBrBase, ACBrEnterTab, Mask,
  JvExMask, JvToolEdit, JvBaseEdits;

type
  TfrmForma_Pagamento = class(TFormBase)
    pnl1: TPanel;
    lbl2: TLabel;
    btnFinalizar: TBitBtn;
    lblFormaPagamento: TLabel;
    grp3: TGroupBox;
    lbl3: TLabel;
    edtTotal: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtTroco: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    edtSubTotal: TEdit;
    ACBrEnterTab1: TACBrEnterTab;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCheque: TJvCalcEdit;
    edtCartao: TJvCalcEdit;
    edtTicket: TJvCalcEdit;
    edtDinheiro: TJvCalcEdit;
    edtDesconto: TJvCalcEdit;
    lbl1: TLabel;
    edtCliente: TJvComboEdit;
    Label4: TLabel;
    edtValorPago: TJvCalcEdit;
    btnAdicionarGrupo: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    edtValeTroca: TJvComboEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
    procedure Finalizar();
    function CalculaTroco(Subtotal, Total, ValorPago, Dinheiro, Cheque, Cartao, Ticket: Double): Double;
    function CalculaDesconto(subTotal: Double; percent: Double): Double;
    function VerificaValores(Subtotal, Total, Dinheiro, Cheque, Cartao, Ticket: Double): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtClienteButtonClick(Sender: TObject);
    procedure edtValorPagoExit(Sender: TObject);
    procedure btnAdicionarGrupoClick(Sender: TObject);
    procedure edtValeTrocaButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    FResposta : boolean;
    sFTmpDevolucao: string;
  end;

var
  frmForma_Pagamento: TfrmForma_Pagamento;

implementation

uses uDm, uPDV, uProcura_Cliente, uCad_Cliente, uProcuraDevolucao, uMenu;

{$R *.dfm}

procedure TfrmForma_Pagamento.btnAdicionarGrupoClick(Sender: TObject);
begin
    try
        frmCadCliente := TfrmCadCliente.Create(nil);
        frmCadCliente.ShowModal;
    finally
        FreeAndNil(frmCadCliente);
    end;
end;

procedure TfrmForma_Pagamento.btnFinalizarClick(Sender: TObject);
begin
    Finalizar;
end;

function TfrmForma_Pagamento.CalculaTroco(Subtotal, Total, ValorPago, Dinheiro, Cheque, Cartao, Ticket: Double): Double;
begin
    //Função para calcular o troco
    Result := 0;
    if VerificaValores(Subtotal, Total, Dinheiro, Cheque, Cartao, Ticket) then
       Result := ValorPago - Dinheiro;
end;

function TfrmForma_Pagamento.CalculaDesconto(subTotal, percent: Double): Double;
var
   resultado: Double;
begin
     resultado := (subTotal * percent) / 100;
     resultado := subTotal - resultado;
     Result := resultado;
end;

procedure TfrmForma_Pagamento.edtClienteButtonClick(Sender: TObject);
begin
    //Carrega o Form de pesquisa de cliente
     try
       frmProcura_Cliente := TfrmProcura_Cliente.Create(self);
       frmProcura_Cliente.ShowModal;
     finally
       FreeAndNil(frmProcura_Cliente);
     end;
end;

procedure TfrmForma_Pagamento.edtDescontoExit(Sender: TObject);
begin
    //Verifica se a tecla pressionada for ENTER e se o Edit Desconto contém valor
     if (edtDesconto.Text <> '') then
     begin
         edtTotal.Text    := FormatFloat('##0.00', CalculaDesconto(StrToFloat(edtSubTotal.Text), StrToFloat(edtDesconto.Text)));
         edtDinheiro.Text := edtTotal.Text;
     end;
end;

procedure TfrmForma_Pagamento.edtValeTrocaButtonClick(Sender: TObject);
begin
     try
         frmProcuraDevolucao := TfrmProcuraDevolucao.Create(nil);
         frmProcuraDevolucao.ShowModal;
     finally
         FreeAndNil(frmProcuraDevolucao);
     end;
end;

procedure TfrmForma_Pagamento.edtValorPagoExit(Sender: TObject);
begin
    //Verifica se a tecla pressionada for ENTER e se o Edit Dinheiro contém valor
     if (edtValorPago.Value > 0) then
     begin
         edtTroco.Text := FormatFloat('##0.00', CalculaTroco(StrToFloat(edtSubTotal.Text), StrToFloat(edtTotal.Text), edtValorPago.Value, edtDinheiro.Value, edtCheque.Value, edtCartao.Value, edtTicket.Value ));
     end;
end;

procedure TfrmForma_Pagamento.Finalizar();
begin
     //Procedimento que finaliza as funções da tela e volta para o procedimento do FormPDV

     // Confirma a finalização da venda
     if Application.MessageBox('Deseja finalizar essa venda', 'Confirmação', MB_YESNO)= mrYes then
     begin
         //Verifica se a soma das formas de pagamento é igual ao valor total
         if VerificaValores(StrToFloat(edtSubTotal.Text), StrToFloat(edtTotal.Text), edtDinheiro.Value,  edtCheque.Value, edtCartao.Value, edtTicket.Value) and (edtCliente.Text <> '') then
         begin
             FrmPDV.sFID_Funcionario := frmMenu.FCodUser;
             frmPDV.sFCod_cli        := edtCliente.Text;
             frmPDV.dFSub_total      := StrToFloat(edtSubTotal.Text);
             frmPDV.dFDesconto       := edtDesconto.Value;
             frmPDV.dFTotal          := StrToFloat(edtTotal.Text);
             frmPDV.dFDinheiro       := edtDinheiro.Value;
             frmPDV.dFCheque         := edtCheque.Value;
             frmPDV.dFCartao         := edtCartao.Value;
             frmPDV.dFTicket         := edtTicket.Value;
             frmPDV.dFValPago        := edtValorPago.Value;
             frmPDV.dFTroco          := StrToFloat(edtTroco.Text);
             frmPDV.bFResposta       := true;

             if edtValeTroca.Text <> '' then
             begin
                frmPDV.sFCodigoDevolucao := sFTmpDevolucao;
                frmPDV.dFValeTroca      := StrToFloat(edtValeTroca.Text);
             end;

             frmForma_Pagamento.Close;
         end
         else
            if edtCliente.Text <> '' then
               MessageDlg('Informe o código do cliente!', mtWarning, [mbOK], 0);
     end;
end;

procedure TfrmForma_Pagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action             := caFree;
     frmForma_Pagamento := nil;
end;

procedure TfrmForma_Pagamento.FormCreate(Sender: TObject);
begin
    //Carrega os valores na tela
    edtSubTotal.Text := frmPDV.edtTotal.Text;
    edtTotal.Text    := frmPDV.edtTotal.Text;
    edtDinheiro.Text := frmPDV.edtTotal.Text;
    edtCliente.Text  := frmPDV.sFCodCliente;
end;

procedure TfrmForma_Pagamento.KeyDown(var Key: Word; Shift: TShiftState);
begin

    if Key = VK_F5 then
    begin
        Finalizar;
    end;

    if Key = VK_ESCAPE then
    begin
        frmForma_Pagamento.Close;
        frmPDV.bFResposta := false;
    end;

    if key = VK_RETURN then

end;

function TfrmForma_Pagamento.VerificaValores(Subtotal, Total, Dinheiro, Cheque, Cartao,
  Ticket: Double): Boolean;
  var
    soma, diferenca: double;
begin
    if (edtValeTroca.Text <> '') then
    begin
        if (StrToFloat(edtValeTroca.Text) <= StrToFloat(edtSubTotal.Text)) then
        begin
            soma      := Dinheiro + Cartao + Cheque + Ticket;
            diferenca := StrToFloat(edtValeTroca.Text)+ soma;
            if Subtotal <> diferenca then
            begin
                Result := false;
                MessageDlg('Valor Total é diferente da soma das formas de pagamento + vale troca!', mtError, [mbOK], 0);
                Abort;
            end
            else
              Result := true;
        end
        else
        begin
            Result := false;
            MessageDlg('Vale troca é maior que o valor total!'#10'É necessário completar o valor.', mtError, [mbOK], 0);
            Abort;
        end;
    end
    else
    begin
        soma := Dinheiro + Cartao + Cheque + Ticket;
        if Total <> soma then
        begin
            Result := false;
            MessageDlg('Valor Total é diferente da soma das formas de pagamento (Dinheiro+Cheque+Cartão+Ticket)!', mtError, [mbOK], 0);
            Abort;
        end
        else
          Result := true;
    end;

end;

end.
