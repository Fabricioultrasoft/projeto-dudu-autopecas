unit uFechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, FMTBcd, DB,
  SqlExpr, uFormBase;

type
  TfrmFechamento_Caixa = class(TFormBase)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btn1: TBitBtn;
    pnl4: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    dtpIncial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    pgc1: TPageControl;
    tsValores: TTabSheet;
    tsRegistros: TTabSheet;
    grp2: TGroupBox;
    lbl7: TLabel;
    lbl6: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    edtTotal: TEdit;
    edtDinheiro: TEdit;
    edtCartao: TEdit;
    edtCheque: TEdit;
    grdRegistros: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregaConsulta();
    procedure CarregaRegistros();
    procedure dtpIncialChange(Sender: TObject);
    procedure dtpFinalChange(Sender: TObject);
    procedure grdRegistrosTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamento_Caixa: TfrmFechamento_Caixa;

implementation

uses uDm, UdmConexao;

{$R *.dfm}

procedure TfrmFechamento_Caixa.CarregaConsulta;
var
   select: string;
   qrySoma: TSQLQuery;
begin
    //Cláusula SELECT padrão para soma
    select := 'SELECT COALESCE(SUM(VALOR_PAGAMENTO), 0) AS TOTAL FROM CAIXA WHERE DATA_ENTRADA BETWEEN :DTI AND :DTF';
    try
        //Instâncio objeto do tipo TSQLQuery e seto a conexão com o banco de dados
        qrySoma := TSQLQuery.Create(nil);
        qrySoma.SQLConnection := dmConexao.Conexao;

        //Soma todos os pagamentos independente do tipo de pagamento
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(select);
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.Open;
        edtTotal.Text := FormatFloat('R$ ##0.00', qrySoma.Fields[0].Value);

        //Soma somente os pagamentos em DINHEIRO
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(select);
        qrySoma.SQL.Add('AND ID_PAGAMENTO = 1');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.Open;
        edtDinheiro.Text := FormatFloat('R$ ##0.00', qrySoma.Fields[0].Value);

        //Soma somente os pagamentos no CARTÃO
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(select);
        qrySoma.SQL.Add('AND ID_PAGAMENTO = 2');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.Open;
        edtCartao.Text := FormatFloat('R$ ##0.00', qrySoma.Fields[0].Value);

        //Soma somente os pagamentos no CHEQUE
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(select);
        qrySoma.SQL.Add('AND ID_PAGAMENTO = 3');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.Open;
        edtCheque.Text := FormatFloat('R$ ##0.00', qrySoma.Fields[0].Value);
    finally
         FreeAndNil(qrySoma);
    end;
end;

procedure TfrmFechamento_Caixa.CarregaRegistros;
begin
    //Carrega a consulta da tabela caixa e da tabela pagamento
    dm.qryCaixa.Close;
    dm.qryCaixa.SQL.Clear;
    dm.qryCaixa.SQL.Add('SELECT C.DATA_ENTRADA, C.VALOR_PAGAMENTO, C.ID_PAGAMENTO, P.TIPO_PAGAMENTO, C.N_DOCUMENTO, C.TIPO_DOCUMENTO');
    dm.qryCaixa.SQL.Add('FROM CAIXA C, PAGAMENTO P');
    dm.qryCaixa.SQL.Add('WHERE C.ID_PAGAMENTO=P.ID AND DATA_ENTRADA BETWEEN :DTI AND :DTF');
    dm.qryCaixa.ParamByName('DTI').AsDate := dtpIncial.Date;
    dm.qryCaixa.ParamByName('DTF').AsDate := dtpFinal.Date;
    dm.qryCaixa.Open;
    dm.cdsCaixa.Open;
    dm.cdsCaixa.Refresh;
end;

procedure TfrmFechamento_Caixa.dtpFinalChange(Sender: TObject);
begin
    //Dispara as querys
    CarregaConsulta;
    CarregaRegistros;
end;

procedure TfrmFechamento_Caixa.dtpIncialChange(Sender: TObject);
begin
     //Dispara as querys
     CarregaConsulta;
     CarregaRegistros;
end;

procedure TfrmFechamento_Caixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsCaixa.Close;
    Action              := caFree;
    frmFechamento_Caixa := nil;
end;

procedure TfrmFechamento_Caixa.grdRegistrosTitleClick(Column: TColumn);
begin
    //Ordena os registros de acordo com o título da coluna clicada
    dm.cdsCaixa.IndexFieldNames := Column.FieldName;
end;

end.
