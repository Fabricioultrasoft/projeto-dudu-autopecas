unit uFechamento_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids, Buttons, FMTBcd, DB,
  SqlExpr, uFormBase, uImpressora, uImpressao;

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
    edtSubTotal: TEdit;
    edtDinheiro: TEdit;
    edtCartao: TEdit;
    edtCheque: TEdit;
    grdRegistros: TDBGrid;
    lbl8: TLabel;
    edtSangria: TEdit;
    lbl9: TLabel;
    edtTotal: TEdit;
    lbl10: TLabel;
    edtSuprimento: TEdit;
    Label1: TLabel;
    edtTicket: TEdit;
    btnImprimir: TBitBtn;
    Label2: TLabel;
    edtEstorno: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregaConsulta();
    procedure CarregaRegistros();
    procedure dtpIncialChange(Sender: TObject);
    procedure dtpFinalChange(Sender: TObject);
    procedure grdRegistrosTitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    FVerificacaoImpressora: Boolean;
    FImpressora : TImpressora;
  end;

var
  frmFechamento_Caixa: TfrmFechamento_Caixa;
  FImpressao : TImpressao;
  dinheiro, cartao, cheque, ticket, subtotal, sangria, suprimento, estorno, total: Double;

const
    // Instrução SQL padrão para soma
    SELECT_SOMA : string = 'SELECT COALESCE(SUM(VALOR_PAGAMENTO), 0) AS TOTAL FROM CAIXA ';

    // Instrução SQL padrão para somar dinheiro
    SELECT_ESPECIE : string = 'SELECT COALESCE(SUM(DINHEIRO), 0), COALESCE(SUM(CHEQUE), 0), COALESCE(SUM(CARTAO), 0), COALESCE(SUM(TICKET), 0), COALESCE(SUM(ESTORNO), 0) FROM CAIXA ';

    // Instrução SQL para captura das vendas
    SELECT_VENDA: string = 'SELECT C.DATA_ENTRADA, C.VALOR_PAGAMENTO, C.N_DOCUMENTO, C.TIPO_DOCUMENTO, C.RESPONSAVEL, C.OBSERVACAO, C.DINHEIRO, C.CARTAO, C.CHEQUE, C.TICKET, C.ESTORNO '+
                           'FROM CAIXA C WHERE DATA_ENTRADA BETWEEN :DTI AND :DTF';

    // Instrução WHERE padrão para todas as somas
    WHERE_SOMA: string  = 'WHERE DATA_ENTRADA BETWEEN :DTI AND :DTF ';


implementation

uses uDm, UdmConexao, uProgresso, uMenu;

{$R *.dfm}

procedure TfrmFechamento_Caixa.btnImprimirClick(Sender: TObject);
begin
    FImpressora := TImpressora.Create(miEpson, PAnsiChar('USB'));
    FImpressao  := TImpressao.Create(frmMenu.FCabFechamento, FImpressora);

    try
        frmProgresso := TfrmProgresso.Create(nil);
        frmProgresso.Show;
    finally
        FreeAndNil(frmProgresso);
    end;
    FImpressao.StatusImpressora := FVerificacaoImpressora;
    FImpressao.ImprimiFechamentoCaixa(frmMenu.FNomeUser, dtpIncial.Date, dtpFinal.Date, dinheiro, cartao, cheque, ticket, subtotal,
                                      sangria, suprimento, estorno, total);
end;

procedure TfrmFechamento_Caixa.CarregaConsulta;
var
   select: string;
   qrySoma: TSQLQuery;
begin
    try
        //Instâncio objeto do tipo TSQLQuery e seto a conexão com o banco de dados
        qrySoma := TSQLQuery.Create(nil);
        qrySoma.SQLConnection := dmConexao.Conexao;

        //Soma todos os pagamentos independente do tipo de pagamento
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(SELECT_SOMA);
        qrySoma.SQL.Add(WHERE_SOMA + ' AND TIPO_DOCUMENTO = :tipo ');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.ParamByName('tipo').AsString := 'V';
        qrySoma.Open;
        edtSubTotal.Text := FormatFloat('R$ ##,##0.00', qrySoma.Fields[0].Value);
        subtotal         := qrySoma.Fields[0].Value;

        //Soma somente todos os tipos de pagamento mais o estorno
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(SELECT_ESPECIE);
        qrySoma.SQL.Add(WHERE_SOMA);
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.Open;
        edtDinheiro.Text := FormatFloat('R$ ##,##0.00', qrySoma.Fields[0].Value);
        dinheiro         := qrySoma.Fields[0].Value;
        edtCheque.Text   := FormatFloat('R$ ##,##0.00', qrySoma.Fields[1].Value);
        cheque           := qrySoma.Fields[1].Value;
        edtCartao.Text   := FormatFloat('R$ ##,##0.00', qrySoma.Fields[2].Value);
        cartao           := qrySoma.Fields[2].Value;
        edtTicket.Text   := FormatFloat('R$ ##,##0.00', qrySoma.Fields[3].Value);
        ticket           := qrySoma.Fields[3].Value;
        edtEstorno.Text  := FormatFloat('R$ ##,##0.00', qrySoma.Fields[4].Value);
        estorno          := qrySoma.Fields[4].Value;

        //Soma somente as Sangrias
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(SELECT_SOMA);
        qrySoma.SQL.Add(WHERE_SOMA + ' AND TIPO_DOCUMENTO = :tipo ');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.ParamByName('tipo').AsString := 'R';
        qrySoma.Open;
        edtSangria.Text := FormatFloat('R$ ##,##0.00', qrySoma.Fields[0].Value);
        sangria         := qrySoma.Fields[0].Value;

        //Soma somente os Suprimentos
        qrySoma.Close;
        qrySoma.SQL.Clear;
        qrySoma.SQL.Add(SELECT_SOMA);
        qrySoma.SQL.Add(WHERE_SOMA + ' AND TIPO_DOCUMENTO = :tipo ');
        qrySoma.ParamByName('DTI').AsDate := dtpIncial.Date;
        qrySoma.ParamByName('DTF').AsDate := dtpFinal.Date;
        qrySoma.ParamByName('tipo').AsString := 'S';
        qrySoma.Open;
        edtSuprimento.Text := FormatFloat('R$ ##,##0.00', qrySoma.Fields[0].Value);
        suprimento         := qrySoma.Fields[0].Value;

        // Calcula o total deduzindo a sangria
        edtTotal.Text   := FormatFloat('R$ ##,##0.00', ((suprimento + subtotal)- (sangria + estorno)));
        total           := ((suprimento + subtotal)- (sangria + estorno));

    finally
         FreeAndNil(qrySoma);
    end;
end;

procedure TfrmFechamento_Caixa.CarregaRegistros;
begin
    //Carrega a consulta da tabela caixa e da tabela pagamento
    dm.qryCaixa.Close;
    dm.qryCaixa.SQL.Clear;
    dm.qryCaixa.SQL.Add(SELECT_VENDA);
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
