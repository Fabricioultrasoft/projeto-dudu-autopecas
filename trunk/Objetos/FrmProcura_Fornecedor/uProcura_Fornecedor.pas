unit uProcura_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TfrmProcura_Fornecedor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgrdForn: TDBGrid;
    Label1: TLabel;
    edtPesquisa: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdFornKeyPress(Sender: TObject; var Key: Char);
    procedure CarregaCampo();
    procedure CarregaConsulta();
    procedure dbgrdFornTitleClick(Column: TColumn);
    procedure dbgrdFornDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Fornecedor: TfrmProcura_Fornecedor;

implementation

uses uDm, uCad_Produto, uEntrada_Produtos;

{$R *.dfm}

procedure TfrmProcura_Fornecedor.CarregaCampo;
begin
     //Carrega o campo na form Entrada de produtos
     frmEntrada_Produtos.edtCod_Forn.Text := dm.cdsFornecedor.FieldByName('COD_FORN').AsString;
end;

procedure TfrmProcura_Fornecedor.CarregaConsulta;
begin
    //Carrega a consulta básica
    dm.qryFornecedor.Close;
    dm.qryFornecedor.SQL.Clear;
    dm.qryFornecedor.SQL.Add('SELECT COD_FORN, DESC_FORN, FONE, REPRESENTANTE, FONE_REPRES FROM FORNECEDOR');
    dm.qryFornecedor.Open;
    dm.cdsFornecedor.Open;
    dm.cdsFornecedor.Refresh;
end;

procedure TfrmProcura_Fornecedor.dbgrdFornDblClick(Sender: TObject);
begin
    //Carrega os campos após duplo click no registro
    CarregaCampo();
    frmProcura_Fornecedor.Close;
end;

procedure TfrmProcura_Fornecedor.dbgrdFornKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
         CarregaCampo();
         frmProcura_Fornecedor.Close;
     end;
end;

procedure TfrmProcura_Fornecedor.dbgrdFornTitleClick(Column: TColumn);
begin
     //Ordena os campos no Grid após o click na coluna
     dm.cdsFornecedor.IndexFieldNames := Column.FieldName;
end;

procedure TfrmProcura_Fornecedor.edtPesquisaChange(Sender: TObject);
begin
     //Pesquisa disparada no edtpesquisa
     if edtPesquisa.Text <> '' then
     begin
        dm.qryFornecedor.Close;
        dm.qryFornecedor.SQL.Clear;
        dm.qryFornecedor.SQL.Add('SELECT COD_FORN, DESC_FORN, FONE, REPRESENTANTE, FONE_REPRES FROM FORNECEDOR');
        dm.qryFornecedor.SQL.Add('WHERE DESC_FORN LIKE'+ QuotedStr(edtPesquisa.Text + '%'));
        dm.qryFornecedor.Open
     end
     else
     begin
         CarregaConsulta();
     end;
     dm.cdsFornecedor.Refresh;
end;

procedure TfrmProcura_Fornecedor.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
         dbgrdForn.SetFocus;
     end;
end;

procedure TfrmProcura_Fornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsFornecedor.close;
    Action                := caFree;
    frmProcura_Fornecedor := nil;
end;

procedure TfrmProcura_Fornecedor.FormCreate(Sender: TObject);
begin
    CarregaConsulta();
end;

procedure TfrmProcura_Fornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then frmProcura_Fornecedor.Close;
end;

end.
