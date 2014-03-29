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
    pnlRodape: TPanel;
    Label4: TLabel;
    edtCodigo: TEdit;
    lbl5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CarregaCampos();
    procedure CarregaConsulta();
    procedure grdProdKeyPress(Sender: TObject; var Key: Char);
    procedure grdProdTitleClick(Column: TColumn);
    procedure ConsultaUniversal();
    procedure ConsultaUniversalChange(Sender: TObject);
    procedure Enter(Sender: TObject; var Key: Char);
    procedure grdProdDblClick(Sender: TObject);
    procedure CarregaCodigo();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Produto: TfrmProcura_Produto;

const
     //Cláusula SELECT básica para todas as consultas
     SELECT : string = 'SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND_VENDA, P.COD_GRUPO, G.DESC_GRUPO, P.EAN13, P.DUN14, P.CODIGO_NCM, P.TIPO_PROD, P.LOCAL_ESTOQUE, P.SECAO ' +
                       'FROM PRODUTO P LEFT JOIN GRUPO G ON P.COD_GRUPO = G.ID';

     //Cláusula WHERE básica para todas as consultas
     WHERE  : string = 'WHERE P.COD_GRUPO = G.COD_GRUPO ';


implementation

uses uDm, uCad_Produto, uEntrada_Produtos, uPDV, uQtde, uAgenda, uRelatorio,
  uMenu, uProdutoNF, uCadDescarte;

{$R *.dfm}

procedure TfrmProcura_Produto.CarregaCampos;
begin
    //Carrega os campos no Form de Cadastro de Produtos
    frmCadProduto.edtCodigo.Text         := dm.cdsProduto.FieldByName('COD_PROD').AsString;
    frmCadProduto.edtDesc.Text           := dm.cdsProduto.FieldByName('DESC_PROD').AsString;
    frmCadProduto.edtGrupo.Text          := dm.cdsProduto.FieldByName('COD_GRUPO').AsString;
    frmCadProduto.edtEstoque.Value       := dm.cdsProduto.FieldByName('ESTOQUE_MINIMO').AsInteger;
    frmCadProduto.edtEAN13.Text          := dm.cdsProduto.FieldByName('EAN13').AsString;
    frmCadProduto.edtDUN14.Text          := dm.cdsProduto.FieldByName('DUN14').AsString;
    frmCadProduto.cmbUnd.ItemIndex       := frmCadProduto.cmbUnd.Items.IndexOf(dm.cdsProduto.FieldByName('UND_VENDA').AsString);
    frmCadProduto.edtTipo.Text           := dm.cdsProduto.FieldByName('TIPO_PROD').AsString;
    frmCadProduto.edtNcm.Text            := dm.cdsProduto.FieldByName('CODIGO_NCM').AsString;
    frmCadProduto.edtLocalEstoque.Text   := dm.cdsProduto.FieldByName('LOCAL_ESTOQUE').AsString;
    frmCadProduto.edtSecao.Text          := dm.cdsProduto.FieldByName('SECAO').AsString;
    frmCadProduto.CarregaDescGrupo(dm.cdsProduto.FieldByName('COD_GRUPO').AsString);
end;

procedure TfrmProcura_Produto.CarregaCodigo;
begin
    // Carrega o código de barras na tela para entrada de produtos NF
    if Assigned(frmProdutoNF) then
    begin
       frmProdutoNF.edtCod_Prod.Text := dm.cdsProduto.FieldByName('EAN13').AsString;
       dm.CarregaDescProduto(dm.cdsProduto.FieldByName('EAN13').AsString, frmProdutoNF.lblDescricaoProduto);
    end;

    if Assigned(frmDescarte) then
    begin
       frmDescarte.edtCod_Prod.Text := dm.cdsProduto.FieldByName('EAN13').AsString;
       dm.CarregaDescProduto(dm.cdsProduto.FieldByName('EAN13').AsString, frmDescarte.lblDescricaoProduto);
    end;
end;

procedure TfrmProcura_Produto.CarregaConsulta;
begin
     //Procedimento para carrega a consulta inicial
     dm.qryProduto.Close;
     dm.qryProduto.SQL.Clear;
     dm.qryProduto.SQL.Add(SELECT);
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
     if edtCodigo.Text <> '' then
        dm.qryProduto.SQL.Add(' WHERE EAN13 LIKE' + QuotedStr(edtCodigo.Text + '%') + ' OR DESC_PROD LIKE' + QuotedStr(edtCodigo.Text + '%'));

     dm.qryProduto.Open;
     dm.cdsProduto.Refresh;
end;

procedure TfrmProcura_Produto.ConsultaUniversalChange;
begin
    //Evento universal de consulta para todos edts
    ConsultaUniversal();
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
        if not dm.cdsProduto.IsEmpty then
        begin
            try
              frmRelatorio := TfrmRelatorio.Create(nil);
              frmRelatorio.rlProduto.Preview();
            finally
              FreeAndNil(frmRelatorio);
            end;
        end
        else
           MessageDlg('Não existem registros!', mtWarning, [mbOK], 0);
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

     if Assigned(frmProdutoNF) or Assigned(frmDescarte) then
     begin
         CarregaCodigo;
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

         if Assigned(frmProdutoNF) or Assigned(frmDescarte) then
         begin
             CarregaCodigo;
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
