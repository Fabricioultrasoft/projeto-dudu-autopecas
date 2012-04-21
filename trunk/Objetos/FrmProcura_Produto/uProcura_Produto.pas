unit uProcura_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, ComCtrls;

type
  TfrmProcura_Produto = class(TForm)
    Panel2: TPanel;
    grdProd: TDBGrid;
    pnlTitulo: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    edtAplicacao: TEdit;
    pnlAplicacao: TPanel;
    Label3: TLabel;
    pnlRodape: TPanel;
    Label4: TLabel;
    lbl1: TLabel;
    edtDescricao: TEdit;
    lbl2: TLabel;
    edtCodigo: TEdit;
    mmAplicacao: TDBRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CarregaCampos();
    procedure CarregaCodigo();
    procedure CarregaConsulta();
    procedure grdProdKeyPress(Sender: TObject; var Key: Char);
    procedure grdProdTitleClick(Column: TColumn);
    procedure FindRichEdit(RichEdit: TDBRichEdit; texto: string);
    procedure ConsultaUniversal();
    procedure ConsultaUniversalChange(Sender: TObject);
    procedure Enter(Sender: TObject; var Key: Char);
    procedure grdProdDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Produto: TfrmProcura_Produto;

const
     //Cláusula SELECT básica para todas as consultas
     SELECT : string = 'SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND, P.COD_GRUPO, G.DESC_GRUPO, P.APLICACAO ' +
                       'FROM PRODUTO P, GRUPO G';

     //Cláusula WHERE básica para todas as consultas
     WHERE  : string = 'WHERE P.COD_GRUPO = G.COD_GRUPO ';


implementation

uses uDm, uCad_Produto, uEntrada_Produtos, uPDV, uQtde, uAgenda, uRelatorio,
  uMenu;

{$R *.dfm}

procedure TfrmProcura_Produto.FindRichEdit(RichEdit: TDBRichEdit; texto: string);
var
  PosIni : integer;

begin
    //Carrega o RichEdit com as propriedades padrão
    RichEdit.SelStart  := 0;
    RichEdit.SelLength := length(RichEdit.Text);
    RichEdit.SelAttributes.color := clBlack;
    RichEdit.SelAttributes.style := [];
    RichEdit.SelAttributes.Size  := 8;

    //Encontra e atribui a posição inicial do texto no RichEdit
    PosIni := RichEdit.FindText(texto, 0, length(RichEdit.Text), []);

    //Verifica se o texto foi encontrado
    if PosIni >= 0 then
    begin
        RichEdit.SelStart  := PosIni;
        RichEdit.SelLength := length(texto);
        RichEdit.SelAttributes.color := clRed;
        RichEdit.SelAttributes.style := [fsBold];
        RichEdit.SelAttributes.Size  := RichEdit.SelAttributes.Size + 18;
    end;
end;

procedure TfrmProcura_Produto.CarregaCodigo;
begin
    //Procedimento para carragar código do produto no Formulário de Cadastro de Produto
    frmEntrada_Produtos.edtCod_Prod.Text := dm.cdsProduto.FieldByName('COD_PROD').AsString;
end;

procedure TfrmProcura_Produto.CarregaCampos;
begin
    //Carrega os campos no Form de Cadastro de Produtos
    frmCadProduto.edtCodigo.Text         := dm.cdsProduto.FieldByName('COD_PROD').AsString;
    frmCadProduto.edtDesc.Text           := dm.cdsProduto.FieldByName('DESC_PROD').AsString;
    frmCadProduto.edtGrupo.Text          := dm.cdsProduto.FieldByName('COD_GRUPO').AsString;
    frmCadProduto.edtEstoque_Min.Text    := IntToStr(dm.cdsProduto.FieldByName('ESTOQUE_MINIMO').AsInteger);
    frmCadProduto.edtUnd.Text            := dm.cdsProduto.FieldByName('UND').AsString;
    frmCadProduto.mmAplicacao.Lines.Text := dm.cdsProduto.FieldByName('APLICACAO').AsString;
end;

procedure TfrmProcura_Produto.CarregaConsulta;
begin
     //Procedimento para carrega a consulta inicial
     dm.qryProduto.Close;
     dm.qryProduto.SQL.Clear;
     dm.qryProduto.SQL.Add(SELECT);
     dm.qryProduto.SQL.Add('WHERE P.COD_GRUPO = G.COD_GRUPO');
     dm.qryProduto.Open;
     dm.cdsProduto.Open;
     dm.cdsProduto.Refresh;
end;

procedure TfrmProcura_Produto.ConsultaUniversal;
begin
     //Consulta Universal para todos os parâmetros
     dm.qryProduto.Close;
     dm.qryProduto.SQL.Clear;
     dm.qryProduto.SQL.Add(SELECT);
     dm.qryProduto.SQL.Add(WHERE);

     if edtCodigo.Text <> '' then
        dm.qryProduto.SQL.Add('AND COD_PROD LIKE' + QuotedStr(edtCodigo.Text + '%'));

     if edtDescricao.Text <> '' then
        dm.qryProduto.SQL.Add('AND DESC_PROD LIKE' + QuotedStr(edtDescricao.Text + '%'));

     if edtAplicacao.Text <> '' then
        dm.qryProduto.SQL.Add('AND APLICACAO LIKE'+ QuotedStr('%' + edtAplicacao.Text + '%'));

     dm.qryProduto.Open;
     dm.cdsProduto.Refresh;
end;

procedure TfrmProcura_Produto.ConsultaUniversalChange;
begin
    //Evento universal de consulta para todos edts
    ConsultaUniversal();
    FindRichEdit(mmAplicacao, edtAplicacao.Text);
end;

procedure TfrmProcura_Produto.Enter(Sender: TObject; var Key: Char);
begin
    //Simula o TAB para trocar de campos
    if key = #13 then
    begin
        key := #0;
        SelectNext(ActiveControl, true, true);
    end;
end;

procedure TfrmProcura_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action             := caFree;
    frmProcura_Produto := nil;
end;

procedure TfrmProcura_Produto.FormCreate(Sender: TObject);
begin
    CarregaConsulta();
end;

procedure TfrmProcura_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmProcura_Produto.Close;
     if Key = VK_F5 then
     begin
        try
          frmRelatorio := TfrmRelatorio.Create(self);
          frmRelatorio.GeraReport('Report_Produtos', 'RTProdutos.rav');
        finally
          FreeAndNil(frmRelatorio);
        end;
     end;
end;

procedure TfrmProcura_Produto.grdProdDblClick(Sender: TObject);
begin
     //Carrega os campos após duplo clique sobre o registro
     if Assigned(frmCadProduto) then
     begin
        CarregaCampos();
        frmProcura_Produto.Close;
     end;

     if Assigned(frmEntrada_Produtos) then
     begin
         CarregaCodigo();
         frmProcura_Produto.Close;
     end;
end;

procedure TfrmProcura_Produto.grdProdKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
         if Assigned(frmCadProduto) then
         begin
            CarregaCampos();
            frmProcura_Produto.Close;
         end;

         if Assigned(frmEntrada_Produtos) then
         begin
             CarregaCodigo();
             frmProcura_Produto.Close;
         end;
     end;
end;

procedure TfrmProcura_Produto.grdProdTitleClick(Column: TColumn);
begin
    //Ordena o DBGrid por coluna
    dm.cdsProduto.IndexFieldNames := Column.FieldName;
end;

end.
