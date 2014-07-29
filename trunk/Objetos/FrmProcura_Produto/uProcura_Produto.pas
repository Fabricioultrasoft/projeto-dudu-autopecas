unit uProcura_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, DB, ComCtrls, ImgList;

type
  TfrmProcura_Produto = class(TForm)
    Panel2: TPanel;
    grdProd: TDBGrid;
    pnlTitulo: TPanel;
    pnlRodape: TPanel;
    Label4: TLabel;
    edtCodigo: TEdit;
    lbl5: TLabel;
    img: TImageList;
    ckbProdutoInativo: TCheckBox;
    shpAmarelo: TShape;
    lbl1: TLabel;
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
    procedure grdProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdProdCellClick(Column: TColumn);
    procedure ckbProdutoInativoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Produto: TfrmProcura_Produto;

const
     //Cláusula SELECT básica para todas as consultas
     SELECT : string = 'SELECT P.COD_PROD, P.DESC_PROD, P.ESTOQUE_MINIMO, P.UND_VENDA, P.COD_GRUPO, G.DESC_GRUPO, P.EAN13, P.DUN14, P.CODIGO_NCM, P.TIPO_PROD, P.LOCAL_ESTOQUE, P.SECAO, P.IMAGEM, P.ATIVO, P.DESC_CUPOM ' +
                       'FROM PRODUTO P LEFT JOIN GRUPO G ON P.COD_GRUPO = G.ID';

     //Cláusula WHERE básica para todas as consultas
     WHERE  : string = 'WHERE P.COD_GRUPO = G.COD_GRUPO ';


implementation

uses uDm, uCad_Produto, uEntrada_Produtos, uPDV, uQtde, uAgenda, uRelatorio,
  uMenu, uProdutoNF, uCadDescarte, uVisualizarImagem;

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
    frmCadProduto.ckbAtivo.Checked       := Boolean(dm.cdsProduto.FieldByName('ATIVO').AsInteger);
    frmCadProduto.CarregaDescGrupo(dm.cdsProduto.FieldByName('COD_GRUPO').AsString);
    frmCadProduto.edtDescCupom.Text      := dm.cdsProduto.FieldByName('DESC_CUPOM').AsString;

    if FileExists(ExtractFilePath(Application.ExeName) + dm.cdsProduto.FieldByName('IMAGEM').AsString) then
    begin
        frmCadProduto.imgProduto.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + dm.cdsProduto.FieldByName('IMAGEM').AsString);
        frmCadProduto.FCaminhoImagem := dm.cdsProduto.FieldByName('IMAGEM').AsString;
    end
    else
    begin
       frmCadProduto.imgProduto.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Imagens/semImagem.jpg');
       frmCadProduto.FCaminhoImagem := '';
    end;

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
     dm.qryProduto.SQL.Add('WHERE ATIVO = 1');
     dm.qryProduto.Open;
     dm.cdsProduto.Open;
     dm.cdsProduto.Refresh;
end;

procedure TfrmProcura_Produto.ckbProdutoInativoClick(Sender: TObject);
begin
    Self.ConsultaUniversal;
end;

procedure TfrmProcura_Produto.ConsultaUniversal;
begin
     //Consulta Universal para todos os parâmetros
     dm.qryProduto.Close;
     dm.qryProduto.SQL.Clear;
     dm.qryProduto.SQL.Add(SELECT);

     if ckbProdutoInativo.Checked then
     begin
         if edtCodigo.Text <> '' then
            dm.qryProduto.SQL.Add(' WHERE (EAN13 LIKE' + QuotedStr(edtCodigo.Text + '%') + ' OR DESC_PROD LIKE' + QuotedStr(edtCodigo.Text + '%'))
     end
     else
     begin
         if edtCodigo.Text <> '' then
            dm.qryProduto.SQL.Add(' WHERE (EAN13 LIKE' + QuotedStr(edtCodigo.Text + '%') + ' OR DESC_PROD LIKE' + QuotedStr(edtCodigo.Text + '%') + ') AND ATIVO = 1')
         else
            dm.qryProduto.SQL.Add(' WHERE ATIVO = 1');
     end;

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
    shpAmarelo.Brush.Color  := dm.HexToTColor('C1C100');
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

procedure TfrmProcura_Produto.grdProdCellClick(Column: TColumn);
var
  largura, altura: Integer;
begin
    if Column.Title.Caption = 'IMAGEM' then
    begin
        try
           frmVisualizarImagem := TfrmVisualizarImagem.Create(self);
           if (dm.cdsProduto.FieldByName('IMAGEM').AsString <> EmptyStr) and (FileExists(dm.cdsProduto.FieldByName('IMAGEM').AsString)) then
           begin
               frmVisualizarImagem.imgAmpliacao.Picture.LoadFromFile(dm.cdsProduto.FieldByName('IMAGEM').AsString);
               dm.CapturaDimensaoImagem(dm.cdsProduto.FieldByName('IMAGEM').AsString, largura, altura);
           end
           else
           begin
               frmVisualizarImagem.imgAmpliacao.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagens/semImagem.jpg');
               dm.CapturaDimensaoImagem(ExtractFilePath(Application.ExeName) + 'imagens/semImagem.jpg', largura, altura);
           end;

           frmVisualizarImagem.ClientWidth := largura;
           frmVisualizarImagem.ClientHeight:= altura + frmVisualizarImagem.pnl1.Height;
           frmVisualizarImagem.ShowModal;
        finally
           FreeAndNil(frmVisualizarImagem);
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

     if Assigned(frmProdutoNF) or Assigned(frmDescarte) then
     begin
         CarregaCodigo;
         frmProcura_Produto.Close;
     end;
end;

procedure TfrmProcura_Produto.grdProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check, iTopo, iLeft: Integer;
begin
    iTopo := 1;
    iLeft := 25;

    if dm.cdsProduto.FieldByName('ATIVO').AsInteger = 0 then
    begin
        grdProd.Canvas.Brush.Color := dm.HexToTColor('C1C100');
        grdProd.Canvas.FillRect(Rect);
        grdProd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

    if Column.Title.Caption = 'IMAGEM' then
    begin
        grdProd.Canvas.FillRect(Rect);
        img.Draw(grdProd.Canvas, Rect.Left+iLeft, Rect.Top+iTopo, 1);

        if dm.cdsACL.FieldByName('FUNCIONARIO').AsInteger = 1 then
           img.Draw(grdProd.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 2)
        else
           img.Draw(grdProd.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 0);
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
