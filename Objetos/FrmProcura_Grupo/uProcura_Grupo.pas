unit uProcura_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmProcura_Grupo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    dbgrdForn: TDBGrid;
    Panel4: TPanel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure CarregaCampo();
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdFornKeyPress(Sender: TObject; var Key: Char);
    procedure CarregaConsulta();
    procedure dbgrdFornTitleClick(Column: TColumn);
    procedure dbgrdFornDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Grupo: TfrmProcura_Grupo;

implementation

uses uDm, uCad_Produto;

{$R *.dfm}

procedure TfrmProcura_Grupo.CarregaCampo;
begin
     //Carrega o código de grupo no form de cadastro de produtos
     frmCadProduto.edtGrupo.Text := dm.cdsGrupo.FieldByName('COD_GRUPO').AsString;
end;

procedure TfrmProcura_Grupo.CarregaConsulta;
begin
     //Carrega consulta básica
     dm.qryGrupo.Close;
     dm.qryGrupo.SQL.Clear;
     dm.qryGrupo.SQL.Add('SELECT COD_GRUPO, DESC_GRUPO, DATA_CADASTRO FROM GRUPO');
     dm.qryGrupo.Open;
     dm.cdsGrupo.Open;
     dm.cdsGrupo.Refresh;
end;

procedure TfrmProcura_Grupo.dbgrdFornDblClick(Sender: TObject);
begin
    CarregaCampo();
    frmProcura_Grupo.Close;
end;

procedure TfrmProcura_Grupo.dbgrdFornKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
         CarregaCampo();
         frmProcura_Grupo.Close;
     end;
end;

procedure TfrmProcura_Grupo.dbgrdFornTitleClick(Column: TColumn);
begin
    //Ordena os registros de acordo com o título da coluna clicada
    dm.cdsGrupo.IndexFieldNames := Column.FieldName;
end;

procedure TfrmProcura_Grupo.edtPesquisaChange(Sender: TObject);
begin
     //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesquisa
     if edtPesquisa.Text <> '' then
     begin
           dm.qryGrupo.Close;
           dm.qryGrupo.SQL.Clear;
           dm.qryGrupo.SQL.Add('SELECT COD_GRUPO, DESC_GRUPO, DATA_CADASTRO FROM GRUPO');
           dm.qryGrupo.SQL.Add('WHERE DESC_GRUPO LIKE'+ QuotedStr(edtPesquisa.Text + '%'));
           dm.qryGrupo.Open;
     end
     else
     begin
         CarregaConsulta();
     end;
     dm.cdsGrupo.Refresh;
end;

procedure TfrmProcura_Grupo.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
         dbgrdForn.SetFocus;
     end;
end;

procedure TfrmProcura_Grupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsGrupo.close;
    Action           := caFree;
    frmProcura_Grupo := nil;
end;

procedure TfrmProcura_Grupo.FormCreate(Sender: TObject);
begin
    CarregaConsulta();
end;

procedure TfrmProcura_Grupo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmProcura_Grupo.Close;
     if Key = VK_RETURN then self.CarregaCampo();
     
end;

end.
