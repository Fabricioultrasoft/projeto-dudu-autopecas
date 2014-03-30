unit uCadDescarte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormBase, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls, Buttons,
  ToolWin, Mask, JvExMask, JvToolEdit, JvBaseEdits, ACBrBase, ACBrEnterTab, SqlExpr;

type
  TfrmDescarte = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpDescarte: TGroupBox;
    Label15: TLabel;
    TabSheet1: TTabSheet;
    grp1: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    Label3: TLabel;
    edtpesq: TEdit;
    Label2: TLabel;
    edtCod_Prod: TJvComboEdit;
    Label10: TLabel;
    lblDescricaoProduto: TEdit;
    lbl5: TLabel;
    edtReferencia: TEdit;
    Label6: TLabel;
    dtpDescarte: TDateTimePicker;
    Label4: TLabel;
    edtQtdeDescartada: TJvCalcEdit;
    Label9: TLabel;
    lbl4: TLabel;
    edtCod_Forn: TJvComboEdit;
    Label11: TLabel;
    lblDescricaoFornecedor: TEdit;
    mmoObservacao: TMemo;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    Label8: TLabel;
    cmbUnd: TComboBox;
    Label12: TLabel;
    btnRelat: TBitBtn;
    lbl1: TLabel;
    cmbStatus: TComboBox;
    lbl2: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCod_ProdButtonClick(Sender: TObject);
    procedure edtCod_FornButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtpesqChange(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnRelatClick(Sender: TObject);
  private
    { Private declarations }
  public
    FID: integer;

    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Incluir();                                  override;
    procedure Editar();                                   override;
    procedure Cancelar();                                 override;
    procedure Gravar(Operacao: TOperacao);                override;
    procedure Excluir();                                  override;
    procedure CarregaCampos();
    procedure CarregaConsulta();
    procedure AtualizaGrid();
    function VerificaCampos(): boolean;
    function VerificarComboStatus():string;
  end;

var
  frmDescarte: TfrmDescarte;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO DESCARTE (EAN13, QTDE, DATA_DESCARTE, MOTIVO, COD_FORN, COD_FUNC, REF_PROD, UND, ORIGEM, STATUS)'+
                                         'VALUES(:ean13, :qtde, :data, :motivo, :forn, :func, :ref, :und, :orig, :status)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE DESCARTE SET '+
                   'EAN13=:ean13, QTDE=:qtde, DATA_DESCARTE=:data, MOTIVO=:motivo, COD_FORN=:forn, COD_FUNC=:func, REF_PROD=:ref, UND=:und, ORIGEM=:orig, STATUS=:status '+
                   'WHERE ID=:id';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM DESCARTE WHERE ID = :id';

  // Instrução SQL para SELECT geral
  SELECT: string = 'SELECT D.ID, D.EAN13, D.QTDE, D.DATA_DESCARTE, D.MOTIVO, D.COD_FORN, D.COD_FUNC, P.DESC_PROD, D.REF_PROD, D.UND '+
                   'FROM DESCARTE D INNER JOIN PRODUTO P ON D.EAN13 = P.EAN13';

  // Instrução SQL para WHERE de pesquisa
  WHERE: string = 'WHERE D.EAN13 LIKE :ean13 OR P.DESC_PROD LIKE :desc ';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT EAN13 FROM DESCARTE WHERE EAN13 = :ean13 AND DATA_DESCARTE = :data';

  // Instrução SQL para ordenação de registros
  ORDERBY : string = ' ORDER BY DATA_DESCARTE';


implementation

uses uDm, uProcura_Produto, uProcura_Fornecedor, UdmConexao, uProcuraDescarte,
  uRelatorio, uMenu;

{$R *.dfm}

{ TfrmDescarte }

procedure TfrmDescarte.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsDescarte.Close;
    CarregaConsulta();
    dm.cdsDescarte.Open;
end;

procedure TfrmDescarte.btnCancelarClick(Sender: TObject);
begin
    Cancelar;
end;

procedure TfrmDescarte.btnEditarClick(Sender: TObject);
begin
    Editar;
end;

procedure TfrmDescarte.btnExcluirClick(Sender: TObject);
begin
    Excluir;
end;

procedure TfrmDescarte.btnIncluirClick(Sender: TObject);
begin
    Incluir;
end;

procedure TfrmDescarte.btnPesquisarClick(Sender: TObject);
begin
    try
        frmProcuraDescarte := TfrmProcuraDescarte.Create(nil);
        frmProcuraDescarte.ShowModal;
    finally
        FreeAndNil(frmProcuraDescarte);
    end;
end;

procedure TfrmDescarte.btnRelatClick(Sender: TObject);
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

procedure TfrmDescarte.btnSairClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TfrmDescarte.btnSalvarClick(Sender: TObject);
begin
    Gravar(FOperacao);
end;

procedure TfrmDescarte.Cancelar;
begin
    inherited;
    grpDescarte.Enabled := false;
end;

procedure TfrmDescarte.CarregaCampos;
begin
      //Carrega os valores do cds nos campos do formulário
      FID                     := dm.cdsDescarte.FieldByName('ID').AsInteger;
      edtCod_Prod.Text        := dm.cdsDescarte.FieldByName('EAN13').AsString;
      edtCod_Forn.Text        := dm.cdsDescarte.FieldByName('COD_FORN').AsString;
      edtReferencia.Text      := dm.cdsDescarte.FieldByName('REF_PROD').AsString;
      edtQtdeDescartada.Value := dm.cdsDescarte.FieldByName('QTDE').Value;
      mmoObservacao.Text      := dm.cdsDescarte.FieldByName('MOTIVO').AsString;
      dtpDescarte.Date        := dm.cdsDescarte.FieldByName('DATA_DESCARTE').AsDateTime;
      cmbUnd.ItemIndex        := cmbUnd.Items.IndexOf(dm.cdsDescarte.FieldByName('UND').AsString);
      dm.CarregaDescProduto(dm.cdsDescarte.FieldByName('EAN13').AsString, lblDescricaoProduto);
      dm.CarregaDescFornecedor(dm.cdsDescarte.FieldByName('COD_FORN').AsString, lblDescricaoFornecedor);
end;

procedure TfrmDescarte.CarregaConsulta;
begin
    // Carrega consulta básica
    dm.qryDescarte.Close;
    dm.qryDescarte.SQL.Clear;
    dm.qryDescarte.SQL.Add(SELECT);
    dm.qryDescarte.SQL.Add(ORDERBY);
    dm.qryDescarte.Open;
end;

procedure TfrmDescarte.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos;
end;

procedure TfrmDescarte.Editar;
begin
    inherited;
    SetOperacao(opUpdate);
    grpDescarte.Enabled         := True;
    pgCadastro.ActivePageIndex  := 0;
    grpDescarte.SetFocus;
end;

procedure TfrmDescarte.edtCod_FornButtonClick(Sender: TObject);
begin
    try
      frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
      frmProcura_Fornecedor.ShowModal;
    finally
      FreeAndNil(frmProcura_Fornecedor);
    end;
end;

procedure TfrmDescarte.edtCod_ProdButtonClick(Sender: TObject);
begin
    try
        frmProcura_Produto := TfrmProcura_Produto.Create(nil);
        frmProcura_Produto.ShowModal;
    finally
        FreeAndNil(frmProcura_Produto);
    end;
end;

procedure TfrmDescarte.edtpesqChange(Sender: TObject);
begin
    if (edtpesq.Text <> '') then
    begin
          dm.qryDescarte.Close;
          dm.qryDescarte.SQL.Clear;
          dm.qryDescarte.SQL.Add(SELECT);
          dm.qryDescarte.SQL.Add(WHERE);
          dm.qryDescarte.SQL.Add(ORDERBY);
          dm.qryDescarte.ParamByName('ean13').AsString := edtpesq.Text + '%';
          dm.qryDescarte.ParamByName('desc').AsString  := edtpesq.Text + '%';
          dm.qryDescarte.Open;
    end
    else
    begin
         CarregaConsulta();
    end;
    dm.cdsDescarte.Refresh;
end;

procedure TfrmDescarte.Excluir;
begin
   inherited;
   try
      if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
      begin
          dm.qryDescarte.Close;
          dm.qryDescarte.SQL.Clear;
          dm.qryDescarte.SQL.Add(DELETE);
          dm.qryDescarte.ParamByName('id').AsInteger := dm.cdsDescarte.FieldByName('ID').AsInteger;
          dm.qryDescarte.ExecSQL();
          LimpaCampos();
          AtualizaGrid();
      end;
   except
      on E:Exception do
      ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
   end;
end;

procedure TfrmDescarte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsDescarte.Close;
    Action := caFree;
    frmDescarte := nil;
end;

procedure TfrmDescarte.FormCreate(Sender: TObject);
begin
    dm.cdsDescarte.Open;
    cmbUnd.Items.AddStrings(dm.CarregaUnidadeMedida);
end;

procedure TfrmDescarte.Gravar(Operacao: TOperacao);
begin
    //Verifica se os campos obrigatórios foram preenchidos
     if (self.VerificaCampos()) then
     begin
         //Verifica se é operação de Inclusão
         if (Operacao = opInsert) then
         begin
             try
                  dm.qryDescarte.Close;
                  dm.qryDescarte.SQL.Clear;
                  dm.qryDescarte.SQL.Add(INSERT);
                  dm.qryDescarte.Params.ParamByName('ean13').AsString  := edtCod_Prod.Text;
                  dm.qryDescarte.Params.ParamByName('forn').AsString   := edtCod_Forn.Text;
                  dm.qryDescarte.Params.ParamByName('ref').AsString    := edtReferencia.Text;
                  dm.qryDescarte.Params.ParamByName('qtde').AsFloat    := edtQtdeDescartada.Value;
                  dm.qryDescarte.Params.ParamByName('motivo').AsString := mmoObservacao.Text;
                  dm.qryDescarte.Params.ParamByName('data').AsDateTime := dtpDescarte.Date;
                  dm.qryDescarte.Params.ParamByName('und').AsString    := cmbUnd.Text;
                  dm.qryDescarte.Params.ParamByName('func').AsString   := frmMenu.FCodUser;
                  dm.qryDescarte.Params.ParamByName('orig').AsString   := 'E';
                  dm.qryDescarte.Params.ParamByName('status').AsString := VerificarComboStatus;
                  dm.qryDescarte.ExecSQL();
                  AtualizaGrid();
                  LimpaCampos();
                  grpDescarte.Enabled := False;
                  SetOperacao(opNone);
             except
                  on E:Exception do
                  ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
             end;
         end
         else
         begin
              //Verifica se é operação de Update
              if (Operacao = opUpdate) then
              begin
                  try
                      dm.qryDescarte.Close;
                      dm.qryDescarte.SQL.Clear;
                      dm.qryDescarte.SQL.Add(EDICAO);
                      dm.qryDescarte.Params.ParamByName('ean13').AsString  := edtCod_Prod.Text;
                      dm.qryDescarte.Params.ParamByName('forn').AsString   := edtCod_Forn.Text;
                      dm.qryDescarte.Params.ParamByName('ref').AsString    := edtReferencia.Text;
                      dm.qryDescarte.Params.ParamByName('qtde').AsFloat    := edtQtdeDescartada.Value;
                      dm.qryDescarte.Params.ParamByName('motivo').AsString := mmoObservacao.Lines.Text;
                      dm.qryDescarte.Params.ParamByName('data').AsDate     := dtpDescarte.Date;
                      dm.qryDescarte.Params.ParamByName('und').AsString    := cmbUnd.Text;
                      dm.qryDescarte.Params.ParamByName('func').AsString   := '001';
                      dm.qryDescarte.Params.ParamByName('orig').AsString   := 'E';
                      dm.qryDescarte.Params.ParamByName('status').AsString := VerificarComboStatus;
                      dm.qryDescarte.Params.ParamByName('id').AsInteger    := FID;
                      dm.qryDescarte.ExecSQL();
                      AtualizaGrid();
                      grpDescarte.Enabled := False;
                      LimpaCampos();
                      SetOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
     MessageDlg('Após essa operação o produtos será retirado do Estoque!', mtInformation, [mbOK], 0);
end;

procedure TfrmDescarte.Incluir;
begin
   //Procedimento de inclusão de registro
   inherited;
   SetOperacao(opInsert);
   grpDescarte.Enabled        := True;
   pgCadastro.ActivePageIndex := 0;
   LimpaCampos();
   edtQtdeDescartada.Text     := '0';
   cmbStatus.ItemIndex        := 0;
   edtCod_Prod.SetFocus;
end;

procedure TfrmDescarte.KeyDown(var Key: Word; Shift: TShiftState);
begin
    inherited;
     ///
end;

function TfrmDescarte.VerificaCampos: boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtCod_Prod.Text <> '') and (edtCod_Forn.Text <> '') and (edtQtdeDescartada.Value <> 0) and
        (mmoObservacao.Text <> '') then
     begin
        if Length(edtCod_Prod.Text) = 13 then
        begin
           Result := True;
        end
        else
        begin
            MessageDlg('O campo EAN13 não possui 13 digítos!', mtError, [mbOK], 0);
            Result := false;
            Abort;
        end;
     end
     else
     begin
        Result := False;
        MessageDlg('Existem campos obrigatórios(*) sem preenchimento!', mtError, [mbOK], 0);
        Abort;
     end;
end;

function TfrmDescarte.VerificarComboStatus: string;
begin
    if cmbStatus.Text = 'AGUARDANDO' then
       Result := 'A'
    else
        if cmbStatus.Text = 'FINALIZADO' then
           Result := 'F'
end;

end.
