unit uEntrada_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase, uProcura_Fornecedor, SqlExpr, Mask, JvExMask,
  JvToolEdit, JvBaseEdits;

type
  TfrmEntrada_Produtos = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnRelat: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpEntrada_Produtos: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    dtpEntrada: TDateTimePicker;
    edtN_Documento: TEdit;
    lbl4: TLabel;
    Label15: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    btnPesquisar: TBitBtn;
    edtCod_Forn: TJvComboEdit;
    Label18: TLabel;
    edtValorTotal: TJvCalcEdit;
    Label19: TLabel;
    edtResponsavel: TEdit;
    grpProdutoNF: TGroupBox;
    DBGrid1: TDBGrid;
    btnIncluirProduto: TBitBtn;
    btnEditarProduto: TBitBtn;
    btnExcluirProduto: TBitBtn;
    Label2: TLabel;
    Label4: TLabel;
    edtChaveNfe: TEdit;
    lblDescricaoFornecedor: TEdit;
    Label6: TLabel;
    btnCancelar: TBitBtn;
    btnAdicionarGrupo: TBitBtn;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Incluir();                   override;
    procedure Editar();                    override;
    procedure Cancelar();                    override;
    procedure Gravar(Operacao: TOperacao);   override;
    procedure Excluir();                   override;
    procedure setOperacao(Operacao: TOperacao); override;
    function VerificaCampos: Boolean;
    function VerificaDuplicidade(Documento, Fornecedor: string): Boolean;
    procedure CarregaCampos();
    procedure DoClose(var Action: TCloseAction);override;
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure btnRelatClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtCod_FornExit(Sender: TObject);
    procedure edtCod_ProdButtonClick(Sender: TObject);
    procedure edtCod_FornButtonClick(Sender: TObject);
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure btnEditarProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAdicionarGrupoClick(Sender: TObject);
  private
    procedure IncluirProduto();
    procedure EditarProduto();
    procedure ExcluirProduto();
  public
    FNota: string;
    FID:   Integer;

    procedure CarregaDescFornecedor(Codigo: string);
  end;

var
  frmEntrada_Produtos: TfrmEntrada_Produtos;
  Param: string;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO ENTRADA_NF (N_NOTA, DATA_ENTRADA, COD_FORN, VALOR_TOTAL, RESPONSAVEL, CHAVE_NFE)'+
                   'VALUES(:nota, :data_ent, :forn, :valor, :resp, :nfe)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE ENTRADA_NF SET N_NOTA=:nota ,DATA_ENTRADA=:data_ent ,COD_FORN=:forn, VALOR_TOTAL=:valor, ' +
                   'RESPONSAVEL=:resp, CHAVE_NFE=:nfe WHERE N_NOTA=:nota';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM ENTRADA_NF WHERE N_NOTA = :nota';

   // Instrução SQL para DELETE para produto da nota
  DELETE_PRODUTO: string = 'DELETE FROM ENTRADA_PRODUTO WHERE ID = :id';


  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT N_NOTA FROM ENTRADA_NF WHERE N_NOTA = :nDoc AND COD_FORN = :cod';

  // Instrução SQL para carregar a descrição do Fornecedor
  SQLDESC_FORN : string = 'SELECT DESC_FORN FROM FORNECEDOR WHERE COD_FORN = :cod';


implementation

uses uProcura_Produto, uDm, uRelatorio, uCalcula_Perc, UdmConexao,
  uProdura_EntradaProduto, uProdutoNF, uCad_Fornecedor;

{$R *.dfm}

procedure TfrmEntrada_Produtos.btnAdicionarGrupoClick(Sender: TObject);
begin
    try
        frmCadFornecedor := TfrmCadFornecedor.Create(nil);
        frmCadFornecedor.ShowModal;
    finally
        FreeAndNil(frmCadFornecedor);
    end;
end;

procedure TfrmEntrada_Produtos.btnCancelarClick(Sender: TObject);
begin
    Cancelar();
end;

procedure TfrmEntrada_Produtos.btnEditarClick(Sender: TObject);
begin
     Editar();
end;

procedure TfrmEntrada_Produtos.btnEditarProdutoClick(Sender: TObject);
begin
    EditarProduto;
end;

procedure TfrmEntrada_Produtos.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmEntrada_Produtos.btnExcluirProdutoClick(Sender: TObject);
begin
    ExcluirProduto;
end;

procedure TfrmEntrada_Produtos.btnIncluirClick(Sender: TObject);
begin
    Incluir();
end;

procedure TfrmEntrada_Produtos.btnIncluirProdutoClick(Sender: TObject);
begin
    IncluirProduto;
end;

procedure TfrmEntrada_Produtos.btnPesquisarClick(Sender: TObject);
begin
    //Carrega o form para procura de produtos
     try
       frmProcura_EntradaProduto := TfrmProcura_EntradaProduto.Create(self);
       frmProcura_EntradaProduto.ShowModal;
     finally
       FreeAndNil(frmProcura_EntradaProduto);

     end;
end;

procedure TfrmEntrada_Produtos.btnRelatClick(Sender: TObject);
begin
     //Gera o relatório
     try
       frmRelatorio := TfrmRelatorio.Create(self);
       frmRelatorio.GeraReport('Report_Entrada_Produtos', 'RTEntrada_Produtos.rav');
     finally
       FreeAndNil(frmRelatorio);
     end;
end;

procedure TfrmEntrada_Produtos.btnSairClick(Sender: TObject);
begin
    frmEntrada_Produtos.Close;
end;

procedure TfrmEntrada_Produtos.btnSalvarClick(Sender: TObject);
begin
     Gravar(FOperacao);
end;

procedure TfrmEntrada_Produtos.Cancelar;
begin
  inherited;
  grpEntrada_Produtos.Enabled := false;
  grpProdutoNF.Enabled := false;
end;

procedure TfrmEntrada_Produtos.CarregaCampos;
begin
    //Carregar os valores nos campos do form
    edtN_Documento.Text := dm.cdsEntrada_Produto.FieldByName('N_NOTA').AsString;
    dtpEntrada.Date     := dm.cdsEntrada_Produto.FieldByName('DATA_ENTRADA').AsDateTime;
    edtCod_Forn.Text    := dm.cdsEntrada_Produto.FieldByName('COD_FORN').AsString;
    edtValorTotal.value := dm.cdsEntrada_Produto.FieldByName('VALOR_TOTAL').AsFloat;
    edtResponsavel.Text := dm.cdsEntrada_Produto.FieldByName('RESPONSAVEL').AsString;
    edtChaveNfe.Text    := dm.cdsEntrada_Produto.FieldByName('CHAVE_NFE').AsString;
end;

procedure TfrmEntrada_Produtos.CarregaDescFornecedor(Codigo: string);
var
   qry: TSQLQuery;
begin
    if Codigo <> '' then
    begin
         try
             qry := TSQLQuery.Create(nil);
             qry.SQLConnection := dmConexao.Conexao;

             qry.Close;
             qry.SQL.Clear;
             qry.SQL.Add(SQLDESC_FORN);
             qry.ParamByName('cod').AsString := codigo;
             qry.Open;

             if not qry.IsEmpty then
                lblDescricaoFornecedor.text := qry.Fields[0].AsString
             else
             begin
                 MessageDlg('Fornecedor não encontrado!', mtError, [mbOK], 0);
                 edtCod_Forn.SetFocus;
             end;
         except
            on E:Exception do
            ShowMessage('Erro ao procurar fornecedor !'#13#10 + E.Message);
         end;
    end;
end;

procedure TfrmEntrada_Produtos.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos;
end;

procedure TfrmEntrada_Produtos.DBGrid1DblClick(Sender: TObject);
begin
    EditarProduto;
end;

procedure TfrmEntrada_Produtos.DoClose(var Action: TCloseAction);
begin
    inherited;
    dm.cdsEntradaNF.Close;
    dm.cdsEntrada_Produto.Close;
    Action              := caFree;
    frmEntrada_Produtos := nil;
end;

procedure TfrmEntrada_Produtos.Editar;
begin
     //Procedimento de Edição de registro
     inherited;
     setOperacao(opUpdate);
     grpEntrada_Produtos.Enabled := True;
     pgCadastro.ActivePageIndex  := 0;
     edtN_Documento.SetFocus;
end;

procedure TfrmEntrada_Produtos.EditarProduto;
begin
    if edtN_Documento.Text <> '' then
    begin
        try
           FNota := edtN_Documento.Text;
           frmProdutoNF := TfrmProdutoNF.Create(nil);
           FID          := dm.cdsEntrada_Produto.FieldByName('ID').AsInteger;
           frmProdutoNF.SetOperacao(opUpdate);
           frmProdutoNF.edtCod_Prod.Text          := dm.cdsEntrada_Produto.FieldByName('EAN13').AsString;
           frmProdutoNF.edtReferencia.Text        := dm.cdsEntrada_Produto.FieldByName('REF_PROD').AsString;
           frmProdutoNF.dtpValidade.Date          := dm.cdsEntrada_Produto.FieldByName('DATA_VALIDADE').AsDateTime;
           frmProdutoNF.edtQtdeComprada.Value     := dm.cdsEntrada_Produto.FieldByName('QTDE').Value;
           frmProdutoNF.cmbUnd.ItemIndex          := frmProdutoNF.cmbUnd.Items.IndexOf(dm.cdsEntrada_Produto.FieldByName('UND_COMPRA').AsString);
           frmProdutoNF.cmbUndConversao.ItemIndex := frmProdutoNF.cmbUndConversao.Items.IndexOf(dm.cdsEntrada_Produto.FieldByName('UND_CONVERSAO').AsString);
           frmProdutoNF.edtQtdeConversao.Value    := dm.cdsEntrada_Produto.FieldByName('QTDE_CONVERSAO').Value;
           frmProdutoNF.edtVal_Custo.Value        := dm.cdsEntrada_Produto.FieldByName('VAL_CUSTO').AsFloat;
           frmProdutoNF.edtPercentagem.Value      := dm.cdsEntrada_Produto.FieldByName('PERC_LUCRO').AsFloat;
           frmProdutoNF.edtVal_Venda.Value        := dm.cdsEntrada_Produto.FieldByName('VAL_VENDA').AsFloat;
           frmProdutoNF.edtValProdNf.Value        := dm.cdsEntrada_Produto.FieldByName('VAL_PROD_NF').AsFloat;
           frmProdutoNF.CarregaDescProduto(dm.cdsEntrada_Produto.FieldByName('EAN13').AsString);
           frmProdutoNF.ShowModal;
        finally
           FreeAndNil(frmProdutoNF);
        end;
    end;
end;

procedure TfrmEntrada_Produtos.edtCod_FornExit(Sender: TObject);
begin
     CarregaDescFornecedor(edtCod_Forn.Text);
end;

procedure TfrmEntrada_Produtos.Excluir;
begin
    //Procedimento de exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryEntradaNF.Close;
            dm.qryEntradaNF.SQL.Clear;
            dm.qryEntradaNF.SQL.Add(DELETE);
            dm.qryEntradaNF.ParamByName('nota').AsString := edtN_Documento.Text;
            dm.qryEntradaNF.ExecSQL();
            LimpaCampos();
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
    end;
end;

procedure TfrmEntrada_Produtos.ExcluirProduto;
begin
    //Procedimento de exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryEntrada_Produto.Close;
            dm.qryEntrada_Produto.SQL.Clear;
            dm.qryEntrada_Produto.SQL.Add(DELETE_PRODUTO);
            dm.qryEntrada_Produto.ParamByName('id').AsInteger := dm.cdsEntrada_Produto.FieldByName('ID').AsInteger;
            dm.qryEntrada_Produto.ExecSQL();
            dm.AtualizaCDSProduto(dm.cdsEntrada_Produto.FieldByName('N_NOTA').AsString);
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
    end;
end;

procedure TfrmEntrada_Produtos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
     inherited;

     if Key = VK_F6 then btnPesquisar.Click;
     if Key = VK_F7 then IncluirProduto;
     if Key = VK_F8 then EditarProduto;
     if Key = VK_F9 then ExcluirProduto;
end;

procedure TfrmEntrada_Produtos.setOperacao(Operacao: TOperacao);
begin
     inherited;
     if (FOperacao = opUpdate) then
        grpProdutoNF.Enabled := True
     else
        grpProdutoNF.Enabled := false;

end;

procedure TfrmEntrada_Produtos.Gravar(Operacao: TOperacao);
begin
     //Procedimento de gravação

     if VerificaCampos then
     begin
         //Verifica se a operação é de Inclusão
         if (Operacao = opInsert) then
         begin
             if (VerificaDuplicidade(edtN_Documento.Text, edtCod_Forn.Text)) then
             begin
                 try
                      dm.qryEntradaNF.Close;
                      dm.qryEntradaNF.SQL.Clear;
                      dm.qryEntradaNF.SQL.Add(INSERT);
                      dm.qryEntradaNF.Params.ParamByName('nota').AsString   := edtN_Documento.Text;
                      dm.qryEntradaNF.Params.ParamByName('data_ent').AsDate := dtpEntrada.Date;
                      dm.qryEntradaNF.Params.ParamByName('forn').AsString   := edtCod_Forn.Text;
                      dm.qryEntradaNF.Params.ParamByName('valor').AsFloat   := edtValorTotal.Value;
                      dm.qryEntradaNF.Params.ParamByName('nfe').AsString    := edtChaveNfe.Text;
                      dm.qryEntradaNF.Params.ParamByName('resp').AsString   := edtResponsavel.Text;
                      dm.qryEntradaNF.ExecSQL();
                      LimpaCAmpos();
                      grpEntrada_Produtos.Enabled := False;
                      setOperacao(opNone);
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
                      dm.qryEntradaNF.Close;
                      dm.qryEntradaNF.SQL.Clear;
                      dm.qryEntradaNF.SQL.Add(EDICAO);
                      dm.qryEntradaNF.Params.ParamByName('nota').AsString      := edtN_Documento.Text;
                      dm.qryEntradaNF.Params.ParamByName('data_ent').AsDate    := dtpEntrada.Date;
                      dm.qryEntradaNF.Params.ParamByName('forn').AsString      := edtCod_Forn.Text;
                      dm.qryEntradaNF.Params.ParamByName('valor').AsFloat   := edtValorTotal.Value;
                      dm.qryEntradaNF.Params.ParamByName('nfe').AsString    := edtChaveNfe.Text;
                      dm.qryEntradaNF.Params.ParamByName('resp').AsString   := edtResponsavel.Text;
                      dm.qryEntradaNF.ExecSQL();
                      grpEntrada_Produtos.Enabled := False;
                      setOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
end;

procedure TfrmEntrada_Produtos.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
     setOperacao(opInsert);
     grpEntrada_Produtos.Enabled := True;
     pgCadastro.ActivePageIndex  := 0;
     edtN_Documento.SetFocus;
     LimpaCampos();
end;

procedure TfrmEntrada_Produtos.IncluirProduto;
begin
    if edtN_Documento.Text <> '' then
    begin
        try
           FNota := edtN_Documento.Text;
           frmProdutoNF := TfrmProdutoNF.Create(nil);
           frmProdutoNF.SetOperacao(opInsert);
           frmProdutoNF.ShowModal;
        finally
           FreeAndNil(frmProdutoNF);
        end;
    end;
end;

procedure TfrmEntrada_Produtos.edtCod_ProdButtonClick(Sender: TObject);
begin
     //Carrega o form para procura de produtos cadastrados
    try
      frmProcura_Produto := TfrmProcura_Produto.Create(self);
      frmProcura_Produto.ShowModal;
    except
       FreeAndNil(frmProcura_Produto);
    end;
end;

procedure TfrmEntrada_Produtos.edtCod_FornButtonClick(Sender: TObject);
begin
     //Carrega o form para procura de fornecedor
    try
      frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
      frmProcura_Fornecedor.ShowModal;
    finally
      FreeAndNil(frmProcura_Fornecedor);
    end;
end;

function TfrmEntrada_Produtos.VerificaCampos: Boolean;
begin
     //Verifica o preenchimento dos campos obrigatórios
     if (edtN_Documento.Text <> '') and (edtCod_Forn.Text <> '') and (edtValorTotal.Value > 0) then
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

function TfrmEntrada_Produtos.VerificaDuplicidade(Documento, Fornecedor: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('nDoc').AsString := Documento;
        qryVerif.ParamByName('cod').AsString :=  Fornecedor;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Nota Fiscal já cadastrado com o número (' + qryVerif.Fields[0].AsString + ') para esse fornecedor!', mtError, [mbOK], 0);
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
