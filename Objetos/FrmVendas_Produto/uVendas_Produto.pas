unit uVendas_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls, uDm,
  uRelatorio;

type
  TfrmVendas_Produto = class(TFormBase)
    pnl1: TPanel;
    pnl2: TPanel;
    grdVendas: TDBGrid;
    pnl3: TPanel;
    btnFechar: TBitBtn;
    lbl1: TLabel;
    pnl4: TPanel;
    lbl2: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    lbl4: TLabel;
    lbl5: TLabel;
    edtFornecedor: TEdit;
    btnImprimir: TBitBtn;
    procedure CarregaDados();
    procedure CarregaData();
    procedure btnFecharClick(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure grdVendasTitleClick(Column: TColumn);
    procedure dtpFinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendas_Produto: TfrmVendas_Produto;

const
    SELECT  : string = 'SELECT EAN13, DESC_PROD, COD_FORN, DESC_FORN, DATA_CADASTRO, SUM(TOTAL) AS TOTAL ' +
                       'FROM V_VENDA_FORNECEDOR';

    GROUP_BY: string = 'GROUP BY EAN13, DESC_PROD, COD_FORN, DESC_FORN, DATA_CADASTRO';


implementation

{$R *.dfm}

procedure TfrmVendas_Produto.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmVendas_Produto.btnImprimirClick(Sender: TObject);
var
   s : TStringBuilder;
begin
     try
         s := TStringBuilder.Create;
         s.Append(FormatDateTime('dd/mm/yyyy', dtpInicial.Date) + ' à ' + FormatDateTime('dd/mm/yyyy', dtpFinal.Date));
         frmRelatorio := TfrmRelatorio.Create(self);
         frmRelatorio.GeraReport('Report_Venda_Fornecedor', 'RTVenda_Fornecedor', s.ToString);
     finally
         FreeAndNil(frmRelatorio);
     end;
end;

procedure TfrmVendas_Produto.CarregaDados;
begin
     dm.qryVenda_Fornecedor.Close;
     dm.qryVenda_Fornecedor.SQL.Clear;
     dm.qryVenda_Fornecedor.SQL.Add(SELECT);
     dm.qryVenda_Fornecedor.SQL.Add(GROUP_BY);
     dm.qryVenda_Fornecedor.Open;
end;

procedure TfrmVendas_Produto.CarregaData;
begin
    dtpInicial.Date := Now;
    dtpFinal.Date := Now;
end;

procedure TfrmVendas_Produto.dtpFinalChange(Sender: TObject);
begin
    if dtpInicial.Date < dtpFinal.Date then
    begin
         dm.qryVenda_Fornecedor.Close;
         dm.qryVenda_Fornecedor.SQL.Clear;
         dm.qryVenda_Fornecedor.SQL.Add(SELECT);
         dm.qryVenda_Fornecedor.SQL.Add('WHERE DATA_CADASTRO BETWEEN :DTI AND :DTF');
         dm.qryVenda_Fornecedor.ParamByName('DTI').AsDate := dtpInicial.Date;
         dm.qryVenda_Fornecedor.ParamByName('DTF').AsDate := dtpFinal.Date;

         if edtFornecedor.Text <> '' then
            dm.qryVenda_Fornecedor.SQL.Add('AND DESC_FORN LIKE' + QuotedStr(edtFornecedor.Text + '%') + ' OR DESC_PROD LIKE' + QuotedStr(edtFornecedor.Text + '%'));

         dm.qryVenda_Fornecedor.SQL.Add(GROUP_BY);
         dm.qryVenda_Fornecedor.Open;
    end
    else
    begin
      ShowMessage('Intervalo de datas inválido!');
    end;
    dm.cdsVenda_Fornecedor.Open;
    dm.cdsVenda_Fornecedor.Refresh;
end;

procedure TfrmVendas_Produto.edtFornecedorChange(Sender: TObject);
begin
     if edtFornecedor.Text <> '' then
     begin
         dm.qryVenda_Fornecedor.Close;
         dm.qryVenda_Fornecedor.SQL.Clear;
         dm.qryVenda_Fornecedor.SQL.Add(SELECT);

         if edtFornecedor.Text <> '' then
            dm.qryVenda_Fornecedor.SQL.Add('WHERE DESC_FORN LIKE ' + QuotedStr(edtFornecedor.Text + '%') + ' OR DESC_PROD LIKE' + QuotedStr(edtFornecedor.Text + '%'));

         dm.qryVenda_Fornecedor.SQL.Add(' AND DATA_CADASTRO BETWEEN :DTI AND :DTF');
         dm.qryVenda_Fornecedor.ParamByName('DTI').AsDate := dtpInicial.Date;
         dm.qryVenda_Fornecedor.ParamByName('DTF').AsDate := dtpFinal.Date;
         dm.qryVenda_Fornecedor.SQL.Add(GROUP_BY);
         dm.qryVenda_Fornecedor.Open;
     end
     else
     begin
        CarregaDados;
     end;
     dm.cdsVenda_Fornecedor.Open;
     dm.cdsVenda_Fornecedor.Refresh;
end;

procedure TfrmVendas_Produto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsVenda_Fornecedor.Close;
end;

procedure TfrmVendas_Produto.FormCreate(Sender: TObject);
begin
    CarregaData;
end;

procedure TfrmVendas_Produto.grdVendasTitleClick(Column: TColumn);
begin
     dm.cdsVenda_Fornecedor.IndexFieldNames := Column.FieldName;
end;

end.

