unit uSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, SqlExpr,
  ACBrBase, ACBrEnterTab, uImpressora;

type
  TfrmSangria = class(TForm)
    pnl1: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    mmoObservacao: TMemo;
    edtResponsavel: TEdit;
    edtValor: TJvCalcEdit;
    lbl1: TLabel;
    pnlTitulo: TPanel;
    lbl5: TLabel;
    cmbTipo: TComboBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    lbl9: TLabel;
    lbl10: TLabel;
    ckbCupom: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure GravarSangria();
    procedure ImprimirCupom(Valor: Double; Responsavel, Motivo, Tipo: string);
    procedure ImprimirTela(Valor: Double; Responsavel, Motivo, Tipo: string);
  public
    { Public declarations }
  end;

var
  frmSangria: TfrmSangria;
  Impressora: TImpressora;

implementation

uses UConexao, UdmConexao, uPDV, uMenu;

{$R *.dfm}

procedure TfrmSangria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    frmSangria := nil;
end;

procedure TfrmSangria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then Self.Close;
    if Key = VK_F5 then self.GravarSangria;
end;

procedure TfrmSangria.GravarSangria;
var
   qry: TSQLQuery;
   idPag: Integer;
begin
    if (edtValor.Text <> '') and (edtResponsavel.Text <> '') and (cmbTipo.Text <> '') then
    begin
        try
            qry := TSQLQuery.Create(nil);
            qry.SQLConnection := dmConexao.Conexao;

            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('EXECUTE PROCEDURE SP_CAIXA(:data, :valor, :dinheiro, :cheque, :cartao, :ticket, :nDoc, :tipoDoc, :resp, :observ, :estorn)');
            qry.ParamByName('data').AsDate       := Date;
            qry.ParamByName('valor').AsFloat     := edtValor.Value;
            qry.ParamByName('dinheiro').AsFloat  := 0;
            qry.ParamByName('cheque').AsFloat    := 0;
            qry.ParamByName('ticket').AsFloat    := 0;
            qry.ParamByName('cartao').AsFloat    := 0;
            qry.ParamByName('nDoc').AsString     := 'S/N';
            qry.ParamByName('tipoDoc').AsString  := 'R';
            qry.ParamByName('resp').AsString     := edtResponsavel.Text;
            qry.ParamByName('observ').AsString   := mmoObservacao.Lines.Text;
            qry.ParamByName('estorn').AsFloat    := 0;
            qry.ExecSQL();

            if ckbCupom.Checked then
               ImprimirCupom(edtValor.Value, edtResponsavel.Text, mmoObservacao.Lines.Text, cmbTipo.Text);

            Self.Close;
        except
            on E:Exception do
            MessageDlg('Erro ao inserir movimentação: ' + E.Message, mtError, [mbOK], 0);
        end;
        Self.Close;
    end
    else
      MessageDlg('Campos obrigatórios(*) não foram preenchidos!', mtWarning, [mbOK], 0);
end;

procedure TfrmSangria.ImprimirCupom(Valor: Double; Responsavel, Motivo,
  Tipo: string);
begin
    frmPDV.FImpressao.ImprimirSangria(FloatToStr(Valor), Responsavel, Tipo, Motivo);
end;

procedure TfrmSangria.ImprimirTela(Valor: Double; Responsavel, Motivo,
  Tipo: string);
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
    frmPDV.redtItem.Lines.Add('SANGRIA'+#10);
    frmPDV.redtItem.Paragraph.Alignment := taLeftJustify;
    frmPDV.redtItem.Lines.Add('Responsável: '+ Responsavel);
    frmPDV.redtItem.Lines.Add('Valor: ' + FormatFloat('R$ ##0.00', Valor));
    frmPDV.redtItem.Lines.Add('Tipo: ' + Tipo);
    frmPDV.redtItem.Lines.Add('Data: ' + FormatDateTime('dd/mm/yyyy', Date));
    frmPDV.redtItem.Lines.Add('Hora: ' + FormatDateTime('hh:mm:ss', time));
    frmPDV.redtItem.Lines.Add('Motivo: ' + #10 + UpperCase(Motivo));
    frmPDV.redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
end;

end.
