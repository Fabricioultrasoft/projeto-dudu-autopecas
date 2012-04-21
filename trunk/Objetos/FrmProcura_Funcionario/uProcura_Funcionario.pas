unit uProcura_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmProcura_Funcionario = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl1: TLabel;
    edtPesquisa: TEdit;
    grdFunc: TDBGrid;
    pnl3: TPanel;
    lbl2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure CarregaConsulta();
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure grdFuncKeyPress(Sender: TObject; var Key: Char);
    procedure grdFuncTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Funcionario: TfrmProcura_Funcionario;

implementation

uses uDm, uOrcamento;

{$R *.dfm}

procedure TfrmProcura_Funcionario.CarregaConsulta;
begin
    //Carrega consulta básica
    dm.qryUsuario.Close;
    dm.qryUsuario.SQL.Clear;
    dm.qryUsuario.SQL.Add('SELECT COD_USER, DESC_USUARIO, PRIVILEGIO, SENHA, DATA_CADASTRO FROM USUARIO');
    dm.qryUsuario.Open;
    dm.cdsUsuario.Open;
    dm.cdsUsuario.Refresh;
end;

procedure TfrmProcura_Funcionario.edtPesquisaChange(Sender: TObject);
begin
    //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesquisa
    if edtPesquisa.Text <> '' then
    begin
        dm.qryUsuario.Close;
        dm.qryUsuario.SQL.Clear;
        dm.qryUsuario.SQL.Add('SELECT COD_USER, DESC_USUARIO, PRIVILEGIO, SENHA, DATA_CADASTRO FROM USUARIO WHERE DESC_USUARIO LIKE'+ QuotedStr(edtPesquisa.Text + '%'));
        dm.qryUsuario.Open;
    end
    else
    begin
        CarregaConsulta();
    end;
    dm.cdsUsuario.Refresh;
end;

procedure TfrmProcura_Funcionario.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
        grdFunc.SetFocus;
    end;
end;

procedure TfrmProcura_Funcionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsUsuario.Close;
    Action                 := caFree;
    frmProcura_Funcionario := nil;
end;

procedure TfrmProcura_Funcionario.FormCreate(Sender: TObject);
begin
     CarregaConsulta();
end;

procedure TfrmProcura_Funcionario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then frmProcura_Funcionario.Close;
end;

procedure TfrmProcura_Funcionario.grdFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
          if Assigned(frmOrcamento) then
          begin
              frmOrcamento.edtCod_Func.Text := dm.cdsUsuario.FieldByName('COD_USER').AsString;
              frmProcura_Funcionario.Close;
          end;

     end;
end;

procedure TfrmProcura_Funcionario.grdFuncTitleClick(Column: TColumn);
begin
     //Ordena os registros de acordo com o título da coluna clicada
     dm.cdsUsuario.IndexFieldNames := Column.FieldName;
end;

end.
