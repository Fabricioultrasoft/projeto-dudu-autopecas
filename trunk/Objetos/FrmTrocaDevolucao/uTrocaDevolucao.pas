unit uTrocaDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, DBCtrls, ACBrBase, ACBrEnterTab, JvExMask, JvToolEdit, JvBaseEdits,
  DBXCommon;

type
  TfrmTrocaDevolucao = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cmbMotivo: TComboBox;
    cmbAcaoTomada: TComboBox;
    mmoObsevacao: TMemo;
    Label5: TLabel;
    Label1: TLabel;
    ckbCupom: TCheckBox;
    Label2: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    Label3: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtQtdeDevolvida: TJvCalcEdit;
    lbl4: TLabel;
    edtReferencia: TEdit;
    pnlRodape: TPanel;
    lbl6: TLabel;
    btnFechar: TBitBtn;
    btnGravar: TBitBtn;
    lbl1: TLabel;
    cmbUnd: TComboBox;
    lbl5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GravarDevolucao();
  end;

var
  frmTrocaDevolucao: TfrmTrocaDevolucao;

const
   // Instrução SQL para INSERT
   INSERT : string = 'INSERT INTO DEVOLUCAO (MOTIVO, VALOR_ITEM, OBSERVACAO, ACAO_TOMADA, QTDE, COD_FUNC, N_VENDA, ITEM, DATA, EAN13, REF_PROD, UND)'+
                     'VALUES(:motivo, :valor, :observacao, :acao, :qtde, :func, :venda, :item, :data, :ean13, :ref, :und)';

implementation

uses uDm, UdmConexao;

{$R *.dfm}

procedure TfrmTrocaDevolucao.btnFecharClick(Sender: TObject);
begin
     frmTrocaDevolucao.Close;
end;

procedure TfrmTrocaDevolucao.btnGravarClick(Sender: TObject);
begin
    GravarDevolucao;
end;

procedure TfrmTrocaDevolucao.FormCreate(Sender: TObject);
begin
    edtQtdeDevolvida.Value := dm.cdsItem_Venda.FieldByName('QTDE').Value;
    cmbUnd.Items.AddStrings(dm.CarregaUnidadeMedida);
end;

procedure TfrmTrocaDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then btnFechar.Click;
    if key = VK_F5     then GravarDevolucao;
    
end;

procedure TfrmTrocaDevolucao.GravarDevolucao;
var
   Trans : TDBXTransaction;
begin
    if (edtQtdeDevolvida.Value > 0) and (cmbMotivo.Text <> '') and (cmbAcaoTomada.Text <> '') and (mmoObsevacao.Text <> '') and (cmbUnd.Text <> '') then
        begin
            try
                // Inicia uma transação
                Trans := dmConexao.Conexao.BeginTransaction;

                dm.qryDevolucao.Close;
                dm.qryDevolucao.SQL.Clear;
                dm.qryDevolucao.SQL.Add(INSERT);
                dm.qryDevolucao.ParamByName('motivo').AsString    := cmbMotivo.Text;
                dm.qryDevolucao.ParamByName('valor').AsFloat      := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat * edtQtdeDevolvida.Value;
                dm.qryDevolucao.ParamByName('observacao').AsString:= mmoObsevacao.Lines.Text;
                dm.qryDevolucao.ParamByName('acao').AsString      := cmbAcaoTomada.Text;
                dm.qryDevolucao.ParamByName('qtde').AsFloat       := edtQtdeDevolvida.Value;
                dm.qryDevolucao.ParamByName('func').AsString      := '002';
                dm.qryDevolucao.ParamByName('venda').AsString     := dm.cdsItem_Venda.FieldByName('N_VENDA').AsString;
                dm.qryDevolucao.ParamByName('item').AsInteger     := dm.cdsItem_Venda.FieldByName('ID_ITEM').AsInteger;
                dm.qryDevolucao.ParamByName('data').AsDateTime    := Date;
                dm.qryDevolucao.ParamByName('ean13').AsString     := dm.cdsItem_Venda.FieldByName('EAN13').AsString;
                dm.qryDevolucao.ParamByName('ref').AsString       := edtReferencia.Text;
                dm.qryDevolucao.ParamByName('und').AsString       := cmbUnd.Text;
                dm.qryDevolucao.ExecSQL();

                dm.cdsItem_Venda.Edit;
                dm.cdsItem_Venda.FieldByName('QTDE').AsFloat    := dm.cdsItem_Venda.FieldByName('QTDE').AsFloat - edtQtdeDevolvida.Value;
                dm.cdsItem_Venda.FieldByName('STATUS').AsString := 'A';
                dm.cdsItem_Venda.Post;
                if dm.cdsItem_Venda.ApplyUpdates(0) > 0 then
                   raise Exception.Create('Erro ao retirar item da venda!');

                if cmbAcaoTomada.ItemIndex = 1 then
                   MessageDlg('CRÉDITO DISPONÍVEL PARA RETIRADA ' + FormatFloat('R$ ##,##0.00', dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat * edtQtdeDevolvida.Value) + '!', mtInformation, [mbOK], 0);

                dmConexao.Conexao.CommitFreeAndNil(Trans);
            except
                on E:Exception do
                begin
                    MessageDlg('Erro ao inserir devolução: ' + E.Message, mtError, [mbOK], 0);
                    dmConexao.Conexao.RollbackFreeAndNil(Trans);
                end;
            end;
            Self.Close;
        end
        else
          MessageDlg('Campos obrigatórios(*) não foram preenchidos!', mtWarning, [mbOK], 0);
end;

end.
