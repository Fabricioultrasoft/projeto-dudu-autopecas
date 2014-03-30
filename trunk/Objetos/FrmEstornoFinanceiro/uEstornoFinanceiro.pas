unit uEstornoFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ACBrBase, ACBrEnterTab, Mask, JvExMask,
  JvToolEdit, SqlExpr, DBXCommon, DB, uImpressora;

type
  TfrmEstornoFinanceiro = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    pnlRodape: TPanel;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    edtDocDevolucao: TJvComboEdit;
    lbl1: TLabel;
    Label1: TLabel;
    edtValor: TEdit;
    ACBrEnterTab1: TACBrEnterTab;
    lbl6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    Label4: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDocDevolucaoButtonClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    sFVenda     : string;

  end;

var
  frmEstornoFinanceiro: TfrmEstornoFinanceiro;

implementation

uses uProcuraDevolucao, UdmConexao, uDm, uPDV, uMenu;

{$R *.dfm}

procedure TfrmEstornoFinanceiro.btnFecharClick(Sender: TObject);
begin
    frmEstornoFinanceiro.Close;
end;

procedure TfrmEstornoFinanceiro.btnGravarClick(Sender: TObject);
var
   qry: TSQLQuery;
   idPag: Integer;
   trans : TDBXTransaction;
begin
    if (edtDocDevolucao.Text <> '') and (edtValor.Text <> '') then
    begin
        try
            trans := dmConexao.Conexao.BeginTransaction;

            qry := TSQLQuery.Create(nil);
            qry.SQLConnection := dmConexao.Conexao;

            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('EXECUTE PROCEDURE SP_CAIXA(:data, :valor, :dinheiro, :cheque, :cartao, :ticket, :nDoc, :tipoDoc, :resp, :observ, :estorn)');
            qry.ParamByName('data').AsDate       := Date;
            qry.ParamByName('valor').AsFloat     := 0;
            qry.ParamByName('dinheiro').AsFloat  := 0;
            qry.ParamByName('cheque').AsFloat    := 0;
            qry.ParamByName('ticket').AsFloat    := 0;
            qry.ParamByName('cartao').AsFloat    := 0;
            qry.ParamByName('nDoc').AsString     := edtDocDevolucao.Text;
            qry.ParamByName('tipoDoc').AsString  := 'E';
            qry.ParamByName('resp').AsString     := frmMenu.FNomeUser;
            qry.ParamByName('observ').AsString   := 'ESTORNO FINANCEIRO';
            qry.ParamByName('estorn').AsFloat    := StrToFloat(edtValor.Text);
            qry.ExecSQL();

            // Atualiza a tabela de devolução se necessário
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('UPDATE DEVOLUCAO SET STATUS = :status WHERE N_VENDA = :venda');
            qry.ParamByName('status').AsString := 'F';
            qry.ParamByName('venda').AsString  := sFVenda;
            qry.ExecSQL();

            dm.cdsDevolucao.Open;
            if dm.cdsDevolucao.Locate('N_VENDA', edtDocDevolucao.Text, [loCaseInsensitive, loPartialKey]) then
            begin

               dm.cdsDevolucao.Edit;
               dm.cdsDevolucao.FieldByName('STATUS').AsString := 'F';
               dm.cdsDevolucao.Post;
               if dm.cdsDevolucao.ApplyUpdates(0) > 0 then raise Exception.Create('Falha ao atualizar tabela de devoluções!');
            end;

            frmPDV.FImpressao.ImprimirEstornoFinanceiro(sFVenda, edtDocDevolucao.Text, frmMenu.FNomeUser, StrToFloat(edtValor.Text));
            dmConexao.Conexao.CommitFreeAndNil(Trans);
            Self.Close;
        except
            on E:Exception do
            begin
               MessageDlg('Erro ao inserir movimentação: ' + E.Message, mtError, [mbOK], 0);
               dmConexao.Conexao.RollbackFreeAndNil(Trans);
            end;
        end;
        Self.Close;
    end
    else
      MessageDlg('Campos obrigatórios(*) não foram preenchidos!', mtWarning, [mbOK], 0);
end;

procedure TfrmEstornoFinanceiro.edtDocDevolucaoButtonClick(Sender: TObject);
begin
     try
         frmProcuraDevolucao := TfrmProcuraDevolucao.Create(nil);
         frmProcuraDevolucao.ShowModal;
     finally
         FreeAndNil(frmProcuraDevolucao);
     end;
end;

procedure TfrmEstornoFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = VK_ESCAPE then btnFechar.Click;
    if Key = VK_F5     then btnGravar.Click;
end;

end.
