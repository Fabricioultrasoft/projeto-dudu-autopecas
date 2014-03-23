unit uProcura_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmProcura_Cliente = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtPesquisa: TEdit;
    pnl3: TPanel;
    grdCliente: TDBGrid;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CarregaConsulta();
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure grdClienteKeyPress(Sender: TObject; var Key: Char);
    procedure grdClienteTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Cliente: TfrmProcura_Cliente;

implementation

uses uDm, uPDV, uForma_Pagamento, uRelatorio;

{$R *.dfm}

procedure TfrmProcura_Cliente.CarregaConsulta;
begin
     //Carregando consulta básica
     dm.qryCliente.Close;
     dm.qryCliente.SQL.Clear;
     dm.qryCliente.SQL.Add('SELECT COD_CLI, NOME_RAZAO, CNPJ, INSC_EST, FONE, CEP, RUA, NUMERO, BAIRRO, CIDADE, UF');
     dm.qryCliente.SQL.Add('FROM CLIENTE');
     dm.qryCliente.Open;
     dm.cdsCliente.Open;
     dm.cdsCliente.Refresh;
end;

procedure TfrmProcura_Cliente.edtPesquisaChange(Sender: TObject);
begin
    //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesquisa
    if edtPesquisa.Text <> '' then
    begin
       dm.qryCliente.Close;
       dm.qryCliente.SQL.Clear;
       dm.qryCliente.SQL.Add('SELECT COD_CLI, NOME_RAZAO, CNPJ, INSC_EST, FONE, CEP, RUA, NUMERO, BAIRRO, CIDADE, UF');
       dm.qryCliente.SQL.Add('FROM CLIENTE');
       dm.qryCliente.SQL.Add('WHERE NOME_RAZAO LIKE'+ QuotedStr(edtPesquisa.Text + '%'));
       dm.qryCliente.Open;
       dm.cdsCliente.Refresh;
    end
    else
    begin
        CarregaConsulta();
    end;

end;

procedure TfrmProcura_Cliente.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
        grdCliente.SetFocus;
    end;
end;

procedure TfrmProcura_Cliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action             := caFree;
    frmProcura_Cliente := nil;
end;

procedure TfrmProcura_Cliente.FormCreate(Sender: TObject);
begin
    CarregaConsulta();
end;

procedure TfrmProcura_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then frmProcura_Cliente.Close;
    if Key = VK_F5 then
     begin
        if not dm.cdsCliente.IsEmpty then
        begin
            try
              frmRelatorio := TfrmRelatorio.Create(nil);
              frmRelatorio.rlCliente.Preview();
            finally
              FreeAndNil(frmRelatorio);
            end;
        end
        else
           MessageDlg('Não existem registros!', mtWarning, [mbOK], 0);
    end;

end;

procedure TfrmProcura_Cliente.grdClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
    //Verifica se a tecla pressionada foi ENTER
    if Key = #13 then
    begin

        //Verifica se o frmPDV está ativo na memória
        if Assigned(frmPDV) then
        begin
           frmPDV.sFCod_cli           := dm.cdsCliente.FieldByName('COD_CLI').AsString;
           frmProcura_Cliente.Close;

           //Verifica se o frmForma_Pagamento está ativo na memória, caso esteja carrega o Código do cliente no edtCliente
           if Assigned(frmForma_Pagamento) then
              frmForma_Pagamento.edtCliente.Text := dm.cdsCliente.FieldByName('COD_CLI').AsString;
        end;
    end;
end;

procedure TfrmProcura_Cliente.grdClienteTitleClick(Column: TColumn);
begin
     //Ordena os registro de acordo com título da coluna que foi clicado
     dm.cdsCliente.IndexFieldNames := Column.FieldName;
end;

end.
