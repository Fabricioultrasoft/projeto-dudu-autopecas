unit uProcuraDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, Grids, DBGrids, StdCtrls, ExtCtrls ;

type
  TfrmProcuraDevolucao = class(TFormBase)
    pnlTitulo: TPanel;
    pnl1: TPanel;
    lbl5: TLabel;
    edtCodigo: TEdit;
    grdProd: TDBGrid;
    pnlRodape: TPanel;
    lbl1: TLabel;
    lbl6: TLabel;
    procedure edtCodigoChange(Sender: TObject);
    procedure grdProdKeyPress(Sender: TObject; var Key: Char);
    procedure grdProdDblClick(Sender: TObject);
    procedure grdProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
  private
    { Private declarations }
  public
    procedure ConsultaUniversal();
    procedure CarregaValor();
  end;

var
  frmProcuraDevolucao: TfrmProcuraDevolucao;

const
     //Cláusula SELECT básica para todas as consultas
     SELECT : string = 'SELECT D.ID, D.COD_DEVOLUCAO, D.N_VENDA, D.ITEM, D.EAN13, D.DATA, D.COD_FUNC, D.VALOR_ITEM, D.MOTIVO, D.OBSERVACAO, D.QTDE, D.ACAO_TOMADA, D.REF_PROD, D.STATUS, P.DESC_PROD ' +
                       'FROM DEVOLUCAO D INNER JOIN PRODUTO P ON D.EAN13 = P.EAN13 ';

     //Cláusula WHERE básica para todas as consultas
     WHERE  : string = 'WHERE (D.N_VENDA LIKE :venda OR P.DESC_PROD LIKE :desc)';

     // Instrução SQL para ordenação de registros
     ORDERBY : string = ' ORDER BY D.DATA';

implementation

uses uDm, uForma_Pagamento, uEstornoFinanceiro;

{$R *.dfm}

{ TfrmProcuraDevolucao }

procedure TfrmProcuraDevolucao.CarregaValor;
begin
    if  dm.cdsDevolucao.FieldByName('STATUS').AsString = 'A' then
    begin
        if Assigned(frmForma_Pagamento) then
        begin
            frmForma_Pagamento.edtValeTroca.Text := FormatFloat('##,##0.00',  dm.cdsDevolucao.FieldByName('VALOR_ITEM').AsFloat);
            frmForma_Pagamento.sFTmpDevolucao    := dm.cdsDevolucao.FieldByName('COD_DEVOLUCAO').AsString;
            if StrToFloat(frmForma_Pagamento.edtTotal.Text) >= dm.cdsDevolucao.FieldByName('VALOR_ITEM').AsFloat then
            begin
               frmForma_Pagamento.edtTotal.Text     := FormatFloat('##,##0.00', StrToFloat(frmForma_Pagamento.edtTotal.Text) - dm.cdsDevolucao.FieldByName('VALOR_ITEM').AsFloat );
               frmForma_Pagamento.edtDinheiro.Value := StrToFloat(frmForma_Pagamento.edtTotal.Text) ;
            end;
        end
        else
        begin
            if Assigned(frmEstornoFinanceiro) then
            begin
                frmEstornoFinanceiro.edtDocDevolucao.Text := dm.cdsDevolucao.FieldByName('COD_DEVOLUCAO').AsString;
                frmEstornoFinanceiro.edtValor.Text        := FormatFloat('##,##0.00',  dm.cdsDevolucao.FieldByName('VALOR_ITEM').AsFloat);
                frmEstornoFinanceiro.sFVenda              := dm.cdsDevolucao.FieldByName('N_VENDA').AsString;
            end;
        end;
        Self.Close;
    end
    else
       MessageDlg('Item já finalizado!', mtError, [mbOK], 0);
end;

procedure TfrmProcuraDevolucao.ConsultaUniversal;
begin
     //Consulta Universal para todos os parâmetros
     dm.cdsDevolucao.Close;
     dm.qryDevolucao.Close;
     dm.qryDevolucao.SQL.Clear;
     dm.qryDevolucao.SQL.Add(SELECT);
     dm.qryDevolucao.SQL.Add(WHERE);

     if Assigned(frmEstornoFinanceiro) then
        dm.qryDevolucao.SQL.Add(' AND D.ACAO_TOMADA = '+QuotedStr('ESTORNO FINANCEIRO'));

     if Assigned(frmForma_Pagamento) then
        dm.qryDevolucao.SQL.Add(' AND D.ACAO_TOMADA <> '+QuotedStr('ESTORNO FINANCEIRO')) ;

     dm.qryDevolucao.SQL.Add(ORDERBY);
     dm.qryDevolucao.ParamByName('venda').AsString := edtCodigo.Text + '%';
     dm.qryDevolucao.ParamByName('desc').AsString := edtCodigo.Text + '%';
     dm.qryDevolucao.Open;
     dm.cdsDevolucao.Open;
     dm.cdsDevolucao.Refresh;
end;

procedure TfrmProcuraDevolucao.edtCodigoChange(Sender: TObject);
begin
    ConsultaUniversal();
end;

procedure TfrmProcuraDevolucao.FormCreate(Sender: TObject);
begin
    If (not Assigned(frmForma_Pagamento)) and (not Assigned(frmEstornoFinanceiro))then
    begin
       dm.cdsDevolucao.Close;
       dm.qryDevolucao.Close;
       dm.qryDevolucao.SQL.Clear;
       dm.qryDevolucao.SQL.Add(SELECT);
       dm.qryDevolucao.SQL.Add(ORDERBY);
       dm.qryDevolucao.Open;
       dm.cdsDevolucao.Open;
       dm.cdsDevolucao.Refresh;
    end;
end;

procedure TfrmProcuraDevolucao.grdProdDblClick(Sender: TObject);
begin
    if (Assigned(frmForma_Pagamento)) then CarregaValor;
    if (Assigned(frmEstornoFinanceiro)) then CarregaValor;
end;

procedure TfrmProcuraDevolucao.grdProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    //Muda a cor da coluna conforme o status da devolução
    if dm.cdsDevolucao.FieldByName('STATUS').AsString = 'F' then
    begin
        grdProd.Canvas.Brush.Color := dm.HexToTColor('D04646');
        grdProd.Canvas.FillRect(Rect);
        grdProd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmProcuraDevolucao.grdProdKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (Assigned(frmForma_Pagamento)) then CarregaValor;
end;

procedure TfrmProcuraDevolucao.KeyDown(var Key: Word; Shift: TShiftState);
begin
    inherited;
    dm.cdsDevolucao.Close;
end;

end.
