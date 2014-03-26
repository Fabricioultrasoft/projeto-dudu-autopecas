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
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDocDevolucaoButtonClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    sFVenda     : string;

    procedure ImprimeCupom(Venda, Documento, Responsavel: string; Valor: double);
    procedure ImprimirTela(Venda, Documento, Responsavel: string; Valor: double);
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
            qry.ParamByName('resp').AsString     := 'WILLIAM';
            qry.ParamByName('observ').AsString   := 'ESTORNO FINANCEIRO';
            qry.ParamByName('estorn').AsFloat     := StrToFloat(edtValor.Text);
            qry.ExecSQL();

            // Atualiza a tabela de devolução se necessário
            dm.cdsDevolucao.Open;
            if dm.cdsDevolucao.Locate('COD_DEVOLUCAO', edtDocDevolucao.Text, [loCaseInsensitive, loPartialKey]) then
            begin
               dm.cdsDevolucao.Edit;
               dm.cdsDevolucao.FieldByName('STATUS').AsString := 'F';
               dm.cdsDevolucao.Post;
               if dm.cdsDevolucao.ApplyUpdates(0) > 0 then raise Exception.Create('Falha ao atualizar tabela de devoluções!');
            end;

            frmPDV.redtItem.Clear;
            ImprimeCupom(sFVenda, edtDocDevolucao.Text, 'WILLIAM', StrToFloat(edtValor.Text));
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

procedure TfrmEstornoFinanceiro.ImprimeCupom(Venda, Documento, Responsavel: string;
  Valor: double);
var
  texto: AnsiString;
begin

    texto := Concat(texto, frmPDV.FImpressora.InseriTraco(48, false, true));
    texto := Concat(texto, '<ce><b>RELATÓRIO GERENCIAL</b></ce>'#10#10);
    texto := Concat(texto, '<ce><b>ESTORNO FINANCEIRO</b></ce>'#10#10);
    texto := Concat(texto, 'Número da Venda: ' + Venda + #10);
    texto := Concat(texto, 'Número da Devolução: ' + Documento + #10);
    texto := Concat(texto, 'Responsável: ' + Responsavel + #10);
    texto := Concat(texto, 'Valor: ' + FormatFloat('R$ ##0.00', Valor) + #10);
    texto := Concat(texto, 'Data: ' + FormatDateTime('dd/mm/yyyy', Date) + #10);
    texto := Concat(texto, 'Hora: ' + FormatDateTime('hh:mm:ss', time) + #10);
    texto := Concat(texto, frmPDV.FImpressora.InseriTraco(48, True, true));

    ImprimirTela(Venda, Documento, Responsavel, Valor);
    if frmPDV.FVerificacaoImpressora then
    begin
        frmPDV.FImpressora.ImprimeTextoTag(PAnsiChar(texto), frmMenu.FCabSangria);
        frmPDV.FImpressora.AcionaGuilhotina(0);
    end;
end;

procedure TfrmEstornoFinanceiro.ImprimirTela(Venda, Documento, Responsavel: string;
  Valor: double);
begin
    if frmMenu.FCabSangria then
    begin
        frmPDV.redtItem.Paragraph.Alignment := taCenter;
        frmPDV.redtItem.Lines.Add(frmMenu.FMsgCabecalho);
        frmPDV.redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
        frmPDV.redtItem.Lines.Add('*** ' + frmMenu.FRazao + ' ***');
        frmPDV.redtItem.Lines.Add('CNPJ: ' + frmMenu.FCNPJ  + ' Inscrição Estadual: '+ frmMenu.FInscricao);
        frmPDV.redtItem.Lines.Add('Rua: '+ frmMenu.FRua +', Número: '+ frmMenu.FNumero+ ' Bairro: ' + frmMenu.FBairro);
        frmPDV.redtItem.Lines.Add('Cidade: ' + frmMenu.FCidade);
        frmPDV.redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
    end;

    frmPDV.redtItem.Paragraph.Alignment := taCenter;
    frmPDV.redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
    frmPDV.redtItem.Lines.Add('RELATÓRIO GERENCIAL'+#10);
    frmPDV.redtItem.Lines.Add('ESTORNO FINANCEIRO'+#10);
    frmPDV.redtItem.Paragraph.Alignment := taLeftJustify;
    frmPDV.redtItem.Lines.Add('Número da Venda: ' + Venda);
    frmPDV.redtItem.Lines.Add('Número da Devolução: ' + Documento);
    frmPDV.redtItem.Lines.Add('Responsável: ' + Responsavel);
    frmPDV.redtItem.Lines.Add('Valor: ' + FormatFloat('R$ ##0.00', Valor));
    frmPDV.redtItem.Lines.Add('Data: ' + FormatDateTime('dd/mm/yyyy', Date));
    frmPDV.redtItem.Lines.Add('Hora: ' + FormatDateTime('hh:mm:ss', time));
    frmPDV.redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
end;

end.
