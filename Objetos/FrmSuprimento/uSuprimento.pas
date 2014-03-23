unit uSuprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, JvExMask, JvToolEdit, JvBaseEdits, StdCtrls, ExtCtrls,
  ACBrBase, ACBrEnterTab, SqlExpr, uImpressora;

type
  TfrmSuprimento = class(TForm)
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl1: TLabel;
    mmoObservacao: TMemo;
    edtResponsavel: TEdit;
    edtValor: TJvCalcEdit;
    pnlTitulo: TPanel;
    ACBrEnterTab1: TACBrEnterTab;
    lbl6: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    ckbCupom: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure GravarSuprimento();
    procedure ImprimirCupom(Valor: Double; Responsavel, Motivo: string);
  public
    { Public declarations }
  end;

var
  frmSuprimento: TfrmSuprimento;
  Impressora: TImpressora;

implementation

uses UdmConexao, uPDV;

{$R *.dfm}

procedure TfrmSuprimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then Self.Close;
     if Key = VK_F5 then self.GravarSuprimento;
end;

procedure TfrmSuprimento.GravarSuprimento;
var
   qry: TSQLQuery;
   idPag: Integer;
begin
    if (edtValor.Text <> '') and (edtResponsavel.Text <> '') then
    begin
        try
            qry := TSQLQuery.Create(nil);
            qry.SQLConnection := dmConexao.Conexao;

            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('EXECUTE PROCEDURE SP_CAIXA(:data, :valor, :dinheiro, :cheque, :cartao, :ticket, :nDoc, :tipoDoc, :resp, :observ)');
            qry.ParamByName('data').AsDate       := Date;
            qry.ParamByName('valor').AsFloat     := edtValor.Value;
            qry.ParamByName('dinheiro').AsFloat  := 0;
            qry.ParamByName('cheque').AsFloat    := 0;
            qry.ParamByName('ticket').AsFloat    := 0;
            qry.ParamByName('cartao').AsFloat    := 0;
            qry.ParamByName('nDoc').AsString     := 'S/N';
            qry.ParamByName('tipoDoc').AsString  := 'S';
            qry.ParamByName('resp').AsString     := edtResponsavel.Text;
            qry.ParamByName('observ').AsString   := mmoObservacao.Lines.Text;
            qry.ExecSQL();

            if ckbCupom.Checked then
               ImprimirCupom(edtValor.Value, edtResponsavel.Text, mmoObservacao.Lines.Text);

            frmPDV.setStatusCaixa(svFechado);
        except
            on E:Exception do
            MessageDlg('Erro ao inserir movimentação: ' + E.Message, mtError, [mbOK], 0);
        end;
        Self.Close;
    end
    else
      MessageDlg('Campos obrigatórios(*) não foram preenchidos!', mtWarning, [mbOK], 0);
end;

procedure TfrmSuprimento.ImprimirCupom(Valor: Double; Responsavel, Motivo: string);
var
  texto: AnsiString;
begin
    Impressora := TImpressora.Create(miEpson, PAnsiChar('USB'));

    texto := Concat(texto, '<ce><b>SUPRIMENTO</b></ce>'#10#10);
    texto := Concat(texto, 'Responsável: ' + Responsavel + #10);
    texto := Concat(texto, 'Valor: ' + FormatFloat('R$ ##0.00', Valor) + #10);
    texto := Concat(texto, 'Data: ' + FormatDateTime('dd/mm/yyyy', Date) + #10);
    texto := Concat(texto, 'Hora: ' + FormatDateTime('hh:mm:ss', time) + #10);
    texto := Concat(texto, 'Motivo: ' + #10 + UpperCase(Motivo) + #10);
    texto := Concat(texto, Impressora.InseriTraco(48, True, true));

    Impressora.AbrirComunicacao;
    Impressora.ImprimeTextoTag(PAnsiChar(texto), true);
    Impressora.AcionaGuilhotina(0);
end;

end.
