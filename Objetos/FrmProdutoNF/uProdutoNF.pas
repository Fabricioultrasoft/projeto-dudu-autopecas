unit uProdutoNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, JvExMask, JvToolEdit, JvBaseEdits, ComCtrls, SqlExpr,
  ACBrBase, ACBrEnterTab, Buttons, uFormBase;

type
  TfrmProdutoNF = class(TFormBaseCad)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    edtCod_Prod: TJvComboEdit;
    Label10: TLabel;
    edtReferencia: TEdit;
    lbl5: TLabel;
    Label6: TLabel;
    dtpValidade: TDateTimePicker;
    Label17: TLabel;
    Label15: TLabel;
    pnl3: TPanel;
    btn1: TBitBtn;
    btnGravar: TBitBtn;
    lblDescricaoProduto: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtQtdeComprada: TJvCalcEdit;
    Label9: TLabel;
    Label8: TLabel;
    cmbUnd: TComboBox;
    Label14: TLabel;
    Label1: TLabel;
    edtQtdeConversao: TJvCalcEdit;
    Label3: TLabel;
    Label5: TLabel;
    cmbUndConversao: TComboBox;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    lbl2: TLabel;
    Label16: TLabel;
    lbl3: TLabel;
    edtVal_Venda: TJvCalcEdit;
    edtPercentagem: TJvCalcEdit;
    edtVal_Custo: TJvCalcEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    edtValProdNf: TJvCalcEdit;
    Label18: TLabel;
    Label19: TLabel;
    btnAtualizarValores: TBitBtn;
    ACBrEnterTab1: TACBrEnterTab;
    btnAdicionarGrupo: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCod_ProdButtonClick(Sender: TObject);
    procedure edtCod_ProdExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPercentagemExit(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtValProdNfExit(Sender: TObject);
    procedure btnAtualizarValoresClick(Sender: TObject);
    procedure btnAdicionarGrupoClick(Sender: TObject);
  private
    procedure Incluir();                   override;
    procedure Editar();                    override;
    procedure Gravar(Operacao: TOperacao); override;
    procedure Excluir();                   override;
    function VerificaCampos: Boolean;
    function VerificaDuplicidade(EAN13, Nota: string): Boolean;
  public
    procedure CarregaDescProduto(EAN13: string);
  end;

var
  frmProdutoNF: TfrmProdutoNF;

const
  // Instrução SQL para carregar a descrição do Produto
  SQLDESC_PROD : string = 'SELECT DESC_PROD FROM PRODUTO WHERE EAN13 = :ean13';

  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO ENTRADA_PRODUTO (N_NOTA, QTDE, REF_PROD, VAL_CUSTO, VAL_VENDA, EAN13, DATA_VALIDADE, PERC_LUCRO, UND_COMPRA, UND_CONVERSAO, QTDE_CONVERSAO, VAL_PROD_NF)'+
                   'VALUES(:nota, :qtde, :ref, :custo, :venda, :ean13, :data_valid, :perc, :und, :undC, :qtdeC, :valnf)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE ENTRADA_PRODUTO SET N_NOTA=:nota ,QTDE=:qtde, REF_PROD=:ref, VAL_CUSTO=:custo, VAL_VENDA=:venda, EAN13=:ean13, UND_CONVERSAO=:undC, QTDE_CONVERSAO=:qtdeC, ' +
                   'DATA_VALIDADE=:data_valid, PERC_LUCRO=:perc, UND_COMPRA=:und, VAL_PROD_NF=:valnf WHERE ID=:id';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT ID FROM ENTRADA_PRODUTO WHERE N_NOTA = :nota AND EAN13 = :ean13';

implementation

{$R *.dfm}

uses UdmConexao, uDm, uEntrada_Produtos, uCad_Produto, uProcura_Produto,
  uFuncao;

procedure TfrmProdutoNF.btnGravarClick(Sender: TObject);
begin
    btnAtualizarValores.Click;
    Gravar(FOperacao);
end;

procedure TfrmProdutoNF.btnAdicionarGrupoClick(Sender: TObject);
begin
    try
       frmCadProduto := TfrmCadProduto.Create(nil);
       frmCadProduto.ShowModal;
    finally
       FreeAndNil(frmCadProduto);
    end;
end;

procedure TfrmProdutoNF.btnAtualizarValoresClick(Sender: TObject);
begin
    if edtValProdNf.Value > 0 then
    begin
        edtVal_Custo.Value := edtValProdNf.Value / edtQtdeConversao.Value;
    end;

    edtVal_Venda.Value := TFuncoes.CalcularPorcentagem(edtPercentagem.Value, edtVal_Custo.Value)
end;

procedure TfrmProdutoNF.CarregaDescProduto(EAN13: string);
var
   qry: TSQLQuery;
begin
    if EAN13 <> '' then
    begin
        try
             qry := TSQLQuery.Create(nil);
             qry.SQLConnection := dmConexao.Conexao;

             qry.Close;
             qry.SQL.Clear;
             qry.SQL.Add(SQLDESC_PROD);
             qry.ParamByName('ean13').AsString := EAN13;
             qry.Open;

             if not qry.IsEmpty then
                lblDescricaoProduto.text := qry.Fields[0].AsString
             else
             begin
                 MessageDlg('Produto não encontrado!', mtError, [mbOK], 0);
                 edtCod_Prod.SetFocus;
             end;
        except
            on E:Exception do
            ShowMessage('Erro ao procurar produto !'#13#10 + E.Message);
        end;
    end;
end;

procedure TfrmProdutoNF.Editar;
begin
  inherited;
   //
end;

procedure TfrmProdutoNF.edtCod_ProdButtonClick(Sender: TObject);
begin
    try
        frmProcura_Produto := TfrmProcura_Produto.Create(nil);
        frmProcura_Produto.ShowModal;
    finally
        FreeAndNil(frmProcura_Produto);
    end;
end;

procedure TfrmProdutoNF.edtCod_ProdExit(Sender: TObject);
begin
    CarregaDescProduto(edtCod_Prod.Text);
end;

procedure TfrmProdutoNF.edtPercentagemExit(Sender: TObject);
begin
    edtVal_Venda.Value := TFuncoes.CalcularPorcentagem(edtPercentagem.Value, edtVal_Custo.Value)
end;

procedure TfrmProdutoNF.edtValProdNfExit(Sender: TObject);
begin
    if edtValProdNf.Value > 0 then
    begin
        edtVal_Custo.Value := edtValProdNf.Value / edtQtdeConversao.Value;
    end;
end;

procedure TfrmProdutoNF.Excluir;
begin
  inherited;
   //
end;

procedure TfrmProdutoNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    frmProdutoNF := nil;
end;

procedure TfrmProdutoNF.FormCreate(Sender: TObject);
begin
    cmbUnd.Items.AddStrings(dm.CarregaUnidadeMedida);
    cmbUndConversao.Items.AddStrings(dm.CarregaUnidadeMedida);
end;

procedure TfrmProdutoNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then self.Close;
    if key = VK_F3     then btnGravar.Click;
    if Key = VK_F5     then btnAtualizarValores.Click;
end;

procedure TfrmProdutoNF.Gravar(Operacao: TOperacao);
begin
    //Procedimento de gravação

     if VerificaCampos() then
     begin
         //Verifica se a operação é de Inclusão
         if (Operacao = opInsert) then
         begin
             if (VerificaDuplicidade(edtCod_Prod.Text, frmEntrada_Produtos.FNota)) then
             begin
                 try
                      dm.qryEntrada_Produto.Close;
                      dm.qryEntrada_Produto.SQL.Clear;
                      dm.qryEntrada_Produto.SQL.Add(INSERT);
                      dm.qryEntrada_Produto.Params.ParamByName('nota').AsString      := frmEntrada_Produtos.FNota;
                      dm.qryEntrada_Produto.Params.ParamByName('qtde').value         := edtQtdeComprada.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('ref').AsString       := edtReferencia.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('custo').AsFloat      := edtVal_Custo.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('venda').AsFloat      := edtVal_Venda.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('ean13').AsString     := edtCod_Prod.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('data_valid').AsDate  := dtpValidade.Date;
                      dm.qryEntrada_Produto.Params.ParamByName('perc').AsFloat       := edtPercentagem.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('und').AsString       := cmbUnd.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('qtdeC').AsFloat      := edtQtdeConversao.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('undC').AsString      := cmbUndConversao.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('valnf').AsFloat      := edtValProdNf.Value;
                      dm.qryEntrada_Produto.ExecSQL();
                      dm.AtualizaCDSProduto(frmEntrada_Produtos.FNota);
                      LimpaCAmpos();
                 except
                      on E:Exception do
                      ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
                 end;
             end;
         end
         else
         begin
              //Verifica se a operação é de Update
              if (Operacao = opUpdate) then
              begin
                  try
                      dm.qryEntrada_Produto.Close;
                      dm.qryEntrada_Produto.SQL.Clear;
                      dm.qryEntrada_Produto.SQL.Add(EDICAO);
                      dm.qryEntrada_Produto.Params.ParamByName('nota').AsString      := frmEntrada_Produtos.FNota;
                      dm.qryEntrada_Produto.Params.ParamByName('qtde').value         := edtQtdeComprada .Value;
                      dm.qryEntrada_Produto.Params.ParamByName('ref').AsString       := edtReferencia.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('custo').AsFloat      := edtVal_Custo.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('venda').AsFloat      := edtVal_Venda.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('ean13').AsString     := edtCod_Prod.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('data_valid').AsDate  := dtpValidade.Date;
                      dm.qryEntrada_Produto.Params.ParamByName('perc').AsFloat       := edtPercentagem.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('und').AsString       := cmbUnd.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('qtdeC').AsFloat     := edtQtdeConversao.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('undC').AsString      := cmbUndConversao.Text;
                      dm.qryEntrada_Produto.Params.ParamByName('valnf').AsFloat      := edtValProdNf.Value;
                      dm.qryEntrada_Produto.Params.ParamByName('id').AsInteger       := frmEntrada_Produtos.FID;
                      dm.qryEntrada_Produto.ExecSQL();
                      dm.AtualizaCDSProduto(frmEntrada_Produtos.FNota);
                      LimpaCAmpos();
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
         SetOperacao(opNone);
         self.Close
     end;
end;

procedure TfrmProdutoNF.Incluir;
begin
  inherited;
  //
end;

function TfrmProdutoNF.VerificaCampos: Boolean;
begin
    //Verifica o preenchimento dos campos obrigatórios
     if (edtCod_Prod.Text <> '') and (dtpValidade.Date > Date) and (edtQtdeComprada.Value > 0) and (cmbUnd.Text <> '') and
        (edtVal_Custo.Value <> 0) and (edtPercentagem.Value <> 0) and (edtVal_Venda.Value <> 0) and (edtQtdeConversao.Value > 0) and (cmbUndConversao.Text <> '') and
        (edtValProdNf.Value > 0) then
     begin
        Result := True;
     end
     else
     begin
        Result := False;
        Application.MessageBox('Existem campos de preenchimento obrigatório não preenchidos!', 'Erro', MB_OK);
        Abort;
     end;
end;

function TfrmProdutoNF.VerificaDuplicidade(EAN13, Nota: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('nota').AsString  := Nota;
        qryVerif.ParamByName('ean13').AsString :=  EAN13;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Produto já cadastrado com o código ' + qryVerif.Fields[0].AsString + ' para essa nota fiscal!', mtError, [mbOK], 0);
            Result := false;
        end
        else
        begin
            Result := true
        end;
    except
        on E:Exception do
        MessageDlg('Erro ao verificar duplicidade: ' + E.Message, mtError, [mbOK], 0);
    end;
end;

end.
