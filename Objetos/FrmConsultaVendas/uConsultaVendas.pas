unit uConsultaVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmConsultaVendas = class(TForm)
    pnl3: TPanel;
    btnFechar: TBitBtn;
    btnImprimir: TBitBtn;
    grdVendas: TDBGrid;
    pnl2: TPanel;
    lbl1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    pnl1: TPanel;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpFinalChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

const
    SELECT  : string = 'SELECT ID, ID_ITEM, N_VENDA, COD_PROD, DESC_PROD, QTDE, VAL_PROD, TOTAL_PROD, DESCONTO, EAN13, STATUS, UND, DATA_CADASTRO FROM ITEM_VENDA ';

    ORDERBY: string = 'ORDER BY N_VENDA, DATA_CADASTRO';

implementation

uses uDm, uRelatorio;

{$R *.dfm}

procedure TfrmConsultaVendas.btnImprimirClick(Sender: TObject);
begin
    if not dm.cdsItem_Venda.IsEmpty then
    begin
        try
          frmRelatorio := TfrmRelatorio.Create(nil);
          frmRelatorio.rlVendas.Preview();
        finally
          FreeAndNil(frmRelatorio);
        end;
    end
    else
       MessageDlg('Não existem registros!', mtWarning, [mbOK], 0);
end;

procedure TfrmConsultaVendas.dtpFinalChange(Sender: TObject);
begin
    if dtpInicial.Date < dtpFinal.Date then
    begin
        try
           dm.qryItem_Venda.Close;
           dm.qryItem_Venda.SQL.Clear;
           dm.qryItem_Venda.SQL.Add(SELECT);
           dm.qryItem_Venda.SQL.Add('WHERE DATA_CADASTRO BETWEEN :DTI AND :DTF ');
           dm.qryItem_Venda.SQL.Add(ORDERBY);
           dm.qryItem_Venda.ParamByName('DTI').AsDate := dtpInicial.Date;
           dm.qryItem_Venda.ParamByName('DTF').AsDate := dtpFinal.Date;
           dm.qryItem_Venda.Open;
           dm.cdsItem_Venda.Open;
           dm.cdsItem_Venda.Refresh;
        except
            on E:Exception do
            MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
        end;
    end
    else
      ShowMessage('Intervalo de datas inválido!');
end;

procedure TfrmConsultaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsItem_Venda.Close;
end;

procedure TfrmConsultaVendas.FormCreate(Sender: TObject);
begin
    dm.cdsItem_Venda.Close;
end;

end.
