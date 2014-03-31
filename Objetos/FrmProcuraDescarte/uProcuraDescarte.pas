unit uProcuraDescarte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmProcuraDescarte = class(TFormBase)
    pnlTitulo: TPanel;
    pnl1: TPanel;
    lbl5: TLabel;
    edtCodigo: TEdit;
    grdProd: TDBGrid;
    pnlRodape: TPanel;
    lbl1: TLabel;
    lblFinalizado: TLabel;
    procedure edtCodigoChange(Sender: TObject);
    procedure grdProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
  public
    procedure ConsultaUniversal();
  end;

var
  frmProcuraDescarte: TfrmProcuraDescarte;

const
   // Instrução SQL para SELECT geral
  SELECT: string = 'SELECT D.ID, D.EAN13, D.QTDE, D.DATA_DESCARTE, D.MOTIVO, D.COD_FORN, D.COD_FUNC, P.DESC_PROD, D.REF_PROD, D.UND, D.STATUS '+
                   'FROM DESCARTE D INNER JOIN PRODUTO P ON D.EAN13 = P.EAN13';

  // Instrução SQL para ordenação de registros
  ORDERBY : string = ' ORDER BY DATA_DESCARTE';

implementation

uses uDm, uRelatorio;

{$R *.dfm}

procedure TfrmProcuraDescarte.ConsultaUniversal;
begin
     //Consulta Universal para todos os parâmetros
     dm.qryDescarte.Close;
     dm.qryDescarte.SQL.Clear;
     dm.qryDescarte.SQL.Add(SELECT);
     if edtCodigo.Text <> '' then
        dm.qryDescarte.SQL.Add(' WHERE D.EAN13 LIKE' + QuotedStr(edtCodigo.Text + '%') + ' OR P.DESC_PROD LIKE' + QuotedStr(edtCodigo.Text + '%'));

     dm.qryDescarte.SQL.Add(ORDERBY);
     dm.qryDescarte.Open;
     dm.cdsDescarte.Open;
     dm.cdsDescarte.Refresh;
end;

procedure TfrmProcuraDescarte.edtCodigoChange(Sender: TObject);
begin
    ConsultaUniversal;
end;

procedure TfrmProcuraDescarte.FormCreate(Sender: TObject);
begin
    lblFinalizado.Font.Color := clGreen
end;

procedure TfrmProcuraDescarte.grdProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    //Muda a cor da coluna estoque_minimo caso o valor esteja abaixo do estoque minímo
   if dm.cdsDescarte.FieldByName('STATUS').AsString = 'F' then
   begin
      grdProd.Canvas.Brush.Color := clGreen;
      grdProd.Canvas.FillRect(Rect);
      grdProd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end
end;

procedure TfrmProcuraDescarte.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
   if Key = VK_F5 then
    begin
        if not dm.cdsDescarte.IsEmpty then
        begin
            try
              frmRelatorio := TfrmRelatorio.Create(nil);
              frmRelatorio.RLDescarte.Preview();
            finally
              FreeAndNil(frmRelatorio);
            end;
        end
        else
           MessageDlg('Não existem registros!', mtWarning, [mbOK], 0);
    end;

end;

end.
