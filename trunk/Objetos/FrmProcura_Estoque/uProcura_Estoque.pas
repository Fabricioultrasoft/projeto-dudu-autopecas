unit uProcura_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, uPDV, DB, uQtde, MidasLib,
  ComCtrls, SqlExpr;

type
  TfrmProcura_Estoque = class(TForm)
    pnlTitulo: TPanel;
    pnlFiltros: TPanel;
    pnlTipo: TPanel;
    grdEstoque: TDBGrid;
    pnlAplicacao: TPanel;
    Label3: TLabel;
    pnlRodape: TPanel;
    Label4: TLabel;
    pnl1: TPanel;
    lbl1: TLabel;
    edtAplicacao: TEdit;
    rgOpcao: TRadioGroup;
    pnl2: TPanel;
    lbl2: TLabel;
    edtQtde: TEdit;
    mmAplicacao: TDBRichEdit;
    lbl4: TLabel;
    edtDescricao: TEdit;
    lbl5: TLabel;
    lbl3: TLabel;
    edtReferencia: TEdit;
    edtCodigo: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CarregaConsulta();
    procedure CarregaItensOrcamento();
    procedure CarregaItensVenda();
    procedure grdEstoqueDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgOpcaoClick(Sender: TObject);
    procedure grdEstoqueTitleClick(Column: TColumn);
    procedure FindRichEdit(RichEdit: TDBRichEdit; texto: string);
    procedure ConsultaUniversal();
    procedure ConsultaUniversalChange(Sender: TObject);
    procedure Enter(Sender: TObject; var Key: Char);
    procedure grdEstoqueDblClick(Sender: TObject);
    procedure grdEstoqueKeyPress(Sender: TObject; var Key: Char);
    function GeraID: integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcura_Estoque: TfrmProcura_Estoque;

const
    //Cláusula select para limpar itens pesquisados
    SELECT_ITEM : string = 'SELECT * FROM ITEM_VENDA WHERE ID=0';

    //Cláusula select universal usada em todas as consultas
    SELECT : string = 'SELECT DISTINCT E.REF_PROD, E.COD_PROD, E.TIPO_ENTRADA, P.DESC_PROD, G.DESC_GRUPO, E.QTDE, P.ESTOQUE_MINIMO, P.UND, E.VAL_CUSTO, E.VAL_VENDA, P.APLICACAO ' +
                      'FROM ESTOQUE E,PRODUTO P, GRUPO G';

    //Cláusula Where universal usada em todas as consultas
    WHERE  : string = 'WHERE E.COD_PROD = P.COD_PROD AND E.COD_GRUPO = G.COD_GRUPO ';

implementation

uses uDm, uOrcamento, uRelatorio, UdmConexao;

{$R *.dfm}

function TfrmProcura_Estoque.GeraID: integer;
var
   qryID: TSQLQuery;
begin

    //Função para capturar o ID gerado na procedure do banco de dados
    try
        try
            qryID := TSQLQuery.Create(nil);
            qryID.SQLConnection := dmConexao.Conexao;

            qryID.Close;
            qryID.SQL.Clear;
            qryID.SQL.Add('SELECT gen_id(gen_item_orcamento_id,1) FROM RDB$DATABASE');
            qryID.Open;

            Result := qryID.Fields[0].AsInteger;
        except
            on E:Exception do
            begin
                ShowMessage('Erro gerar Código do Orçamento!'#13#10 + E.Message);
                Result := 0;
            end;
        end;
    finally
        FreeAndNil(qryID);
    end;
end;

procedure TfrmProcura_Estoque.Enter(Sender: TObject; var Key: Char);
begin
    //Simula o TAB para trocar de campos
    if key = #13 then
    begin
        key := #0;
        SelectNext(ActiveControl, true, true);
    end;
end;

procedure TfrmProcura_Estoque.FindRichEdit(RichEdit: TDBRichEdit; texto: string);
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

procedure TfrmProcura_Estoque.CarregaItensOrcamento;
begin
     //Procedimento para carregar os itens na ClientDataSet de itens de orçamento
     dm.cdsItem_Orc.Open;

     //Cria um índice para ordenar pelo campo ID
     dm.cdsItem_Orc.IndexFieldNames := 'ID';

     //Verifica se o item existe, caso não exista inseri um novo registro
     if not dm.cdsItem_Orc.Locate('REF_PROD', dm.cdsEstoque.FieldByName('REF_PROD').AsString, [loCaseInsensitive, loPartialKey]) then
     begin
        //Carrega valores no cds Itens do Orçamento
        dm.cdsOrcamento.Open;
        dm.cdsItem_Orc.Append;
        dm.cdsItem_Orc.FieldByName('ID').AsInteger            := GeraID;
        dm.cdsItem_Orc.FieldByName('COD_ORC').AsString        := frmOrcamento.edtNumero.Text;
        dm.cdsItem_Orc.FieldByName('COD_PROD').AsString       := dm.cdsEstoque.FieldByName('COD_PROD').AsString;
        dm.cdsItem_Orc.FieldByName('REF_PROD').AsString       := dm.cdsEstoque.FieldByName('REF_PROD').AsString;
        dm.cdsItem_Orc.FieldByName('DESC_PROD').AsString      := dm.cdsEstoque.FieldByName('DESC_PROD').AsString;
        dm.cdsItem_Orc.FieldByName('VAL_PROD').AsString       := dm.cdsEstoque.FieldByName('VAL_VENDA').AsString;
        dm.cdsItem_Orc.FieldByName('TIPO_ENTRADA').AsString   := dm.cdsEstoque.FieldByName('TIPO_ENTRADA').AsString;
        dm.cdsItem_Orc.FieldByName('TIPO_ORCAMENTO').AsString := frmOrcamento.cmbTipo.Text;
        frmOrcamento.grdOrcamento.SelectedIndex := 3;
     end;
end;

procedure TfrmProcura_Estoque.CarregaConsulta();
begin
     //Carrega consulta inicial
     dm.qryEstoque.Close;
     dm.qryEstoque.SQL.Clear;
     dm.qryEstoque.SQL.Add(SELECT);
     dm.qryEstoque.SQL.Add(WHERE);
      case rgOpcao.ItemIndex of
           1: dm.qryEstoque.SQL.Add('AND TIPO_ENTRADA =' + QuotedStr('C'));
           2: dm.qryEstoque.SQL.Add('AND TIPO_ENTRADA =' + QuotedStr('S'));
      end;
     dm.qryEstoque.Open;
     dm.cdsEstoque.Open;
     dm.cdsEstoque.Refresh;
end;

procedure TfrmProcura_Estoque.CarregaItensVenda;
begin
     //Procedimento para carregar os itens na ClientDataSet de itens de venda
     dm.qryItem_Venda.close;
     dm.qryItem_Venda.SQL.Clear;
     dm.qryItem_Venda.SQL.Add(SELECT_ITEM);
     dm.qryItem_Venda.Open;

     dm.cdsItem_Venda.Open;

     //Cria um índice para ordenar pelo campo ID_ITEM
     dm.cdsItem_Venda.IndexFieldNames := 'ID_ITEM';

     //Verifica se o item existe, caso não exista inseri um novo registro
     if not dm.cdsItem_Venda.Locate('REF_PROD', dm.cdsEstoque.FieldByName('REF_PROD').AsString, [loCaseInsensitive, loPartialKey]) then
     begin
         dm.cdsItem_Venda.Append;
         dm.cdsItem_Venda.FieldByName('ID_ITEM').AsInteger     := dm.cdsItem_Venda.RecordCount + 1;
         dm.cdsItem_Venda.FieldByName('N_VENDA').AsString      := frmPDV.lblVenda.Caption;
         dm.cdsItem_Venda.FieldByName('COD_PROD').AsString     := dm.cdsEstoque.FieldByName('COD_PROD').AsString;
         dm.cdsItem_Venda.FieldByName('REF_PROD').AsString     := dm.cdsEstoque.FieldByName('REF_PROD').AsString;
         dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString    := dm.cdsEstoque.FieldByName('DESC_PROD').AsString;
         dm.cdsItem_Venda.FieldByName('TIPO_ENTRADA').AsString := dm.cdsEstoque.FieldByName('TIPO_ENTRADA').AsString;
         dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat      := dm.cdsEstoque.FieldByName('VAL_VENDA').AsFloat;
     end;
end;

procedure TfrmProcura_Estoque.ConsultaUniversal;
begin
      //Consulta universal para todos os parâmetros
      dm.qryEstoque.Close;
      dm.qryEstoque.SQL.Clear;
      dm.qryEstoque.SQL.Add(SELECT);
      dm.qryEstoque.SQL.Add(WHERE);

      if edtCodigo.Text <> '' then
         dm.qryEstoque.SQL.Add('AND E.COD_PROD LIKE' + QuotedStr(edtCodigo.Text + '%'));

      if edtReferencia.Text <> '' then
         dm.qryEstoque.SQL.Add('AND E.REF_PROD LIKE' + QuotedStr(edtReferencia.Text + '%'));

      if edtDescricao.Text <> '' then
         dm.qryEstoque.SQL.Add('AND P.DESC_PROD LIKE' + QuotedStr(edtDescricao.Text + '%'));

      if edtAplicacao.Text <> '' then
         dm.qryEstoque.SQL.Add('AND P.APLICACAO LIKE' + QuotedStr('%' + edtAplicacao.Text + '%'));

      if edtQtde.Text <> '' then
         dm.qryEstoque.SQL.Add('AND E.QTDE <= ' + edtQtde.Text);

      case rgOpcao.ItemIndex of
           1: dm.qryEstoque.SQL.Add('AND TIPO_ENTRADA =' + QuotedStr('C'));
           2: dm.qryEstoque.SQL.Add('AND TIPO_ENTRADA =' + QuotedStr('S'));
      end;

      dm.qryEstoque.Open;
      dm.cdsEstoque.Refresh;
end;

procedure TfrmProcura_Estoque.ConsultaUniversalChange(Sender: TObject);
begin
     //Evento que dispara à consulta para todos edts
     ConsultaUniversal();
     FindRichEdit(mmAplicacao, edtAplicacao.Text);
end;

procedure TfrmProcura_Estoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsEstoque.Close;
    Action             := caFree;
    frmProcura_Estoque := nil;
end;

procedure TfrmProcura_Estoque.FormCreate(Sender: TObject);
begin
     dm.cdsEstoque.Open;
end;

procedure TfrmProcura_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmProcura_Estoque.Close;
     if Key = VK_F1     then
     begin
          CarregaConsulta();
          rgOpcao.ItemIndex := 0;
     end;

     if Key = VK_F2     then
     begin
        CarregaConsulta();
        rgOpcao.ItemIndex := 1;
     end;

     if Key = VK_F3     then
     begin
         CarregaConsulta();
         rgOpcao.ItemIndex := 2;
     end;

     if Key = VK_F5     then
     begin
        try
           frmRelatorio := TfrmRelatorio.Create(self);
           frmRelatorio.GeraReport('Report_Estoque', 'RTEstoque.rav');
        finally
            FreeAndNil(frmRelatorio);
        end;
     end;

end;

procedure TfrmProcura_Estoque.grdEstoqueDblClick(Sender: TObject);
begin
    //Carrega os campos após duplo clique sobre o registro
     if Assigned(frmOrcamento) then
     begin
         frmProcura_Estoque.Close;
         CarregaItensOrcamento();
     end;

     if Assigned(frmPDV) and (frmPDV.edtStatus.Text = 'Venda Aberta')then
     begin
         CarregaItensVenda();
         frmProcura_Estoque.Close;
         try
           frmQtde := TfrmQtde.Create(self);
           frmQtde.ShowModal;
         finally
           FreeAndNil(frmQtde);
         end;
     end;
end;

procedure TfrmProcura_Estoque.grdEstoqueDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    //Muda a cor da coluna estoque_minimo caso o valor esteja abaixo do estoque minímo
    if dm.cdsEstoque.FieldByName('ESTOQUE_MINIMO').AsInteger > dm.cdsEstoque.FieldByName('QTDE').AsInteger then
    begin
        grdEstoque.Canvas.Brush.Color := clRed;
        grdEstoque.Canvas.FillRect(Rect);
        grdEstoque.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

end;

procedure TfrmProcura_Estoque.grdEstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
    begin
       if Assigned(frmOrcamento) then
       begin
           frmProcura_Estoque.Close;
           CarregaItensOrcamento();
       end;

       if Assigned(frmPDV) and (frmPDV.edtStatus.Text = 'Venda Aberta')then
       begin
           CarregaItensVenda();
           frmProcura_Estoque.Close;
           try
             frmQtde := TfrmQtde.Create(self);
             frmQtde.ShowModal;
           finally
             FreeAndNil(frmQtde);
           end;
       end;
    end;
end;

procedure TfrmProcura_Estoque.grdEstoqueTitleClick(Column: TColumn);
begin
    //Ordena os dados a partir do click no título da coluna
    dm.cdsEstoque.IndexFieldNames := Column.FieldName;
end;

procedure TfrmProcura_Estoque.rgOpcaoClick(Sender: TObject);
begin
    CarregaConsulta;
end;

end.
