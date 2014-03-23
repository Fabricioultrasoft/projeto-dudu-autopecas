unit uCad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase, SqlExpr;

type
  TfrmCadCliente = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnRelat: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    TabSheet1: TTabSheet;
    grp1: TGroupBox;
    grpCliente: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    Label3: TLabel;
    edtpesq: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtCNPJ: TEdit;
    edtINSC_EST: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtFone: TEdit;
    edtCEP: TEdit;
    edtRua: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    cmbUF: TComboBox;
    Label13: TLabel;
    edtCodigo: TEdit;
    Label5: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnCancelar: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Incluir();                override;
    procedure Editar();                 override;
    procedure Cancelar();                 override;
    procedure Gravar(Operacao: TOperacao);override;
    procedure Excluir();                override;
    procedure CarregaCampos();
    procedure AtualizaGrid();
    procedure CarregaConsulta();
    function  VerificaCampos: Boolean;
    function VerificaDuplicidade(CNPJ_CPF: string): Boolean;
    procedure FormCreate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtpesqChange(Sender: TObject);
    procedure dbgrdPesquisaTitleClick(Column: TColumn);
    procedure DoClose(var Action: TCloseAction);override;
    procedure btnRelatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO CLIENTE (NOME_RAZAO, CNPJ_CPF, INSC_EST, RUA, NUMERO, BAIRRO, CIDADE, UF, CEP, FONE)'+
                   'VALUES(:nome, :cnpj, :insc, :rua, :numero, :bairro, :cidade, :uf, :cep, :fone)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE CLIENTE SET '+
                   'NOME_RAZAO=:nome, CNPJ_CPF=:cnpj ,INSC_EST=:insc ,RUA=:rua ,NUMERO=:numero ,BAIRRO=:bairro , CIDADE=:cidade , UF=:uf , CEP=:cep ,FONE=:fone '+
                   'WHERE COD_CLI=:codigo';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM CLIENTE WHERE COD_CLI = :codigo';

  // Instrução SQL para SELECT geral
  SELECT: string = 'SELECT COD_CLI, NOME_RAZAO, CNPJ_CPF, INSC_EST, FONE, CEP, RUA, NUMERO, BAIRRO, CIDADE, UF FROM CLIENTE';

  // Instrução SQL para WHERE de pesquisa
  WHERE: string = 'WHERE NOME_RAZAO LIKE :nome';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT NOME_RAZAO FROM CLIENTE WHERE CNPJ_CPF = :cnpj_cpf';

implementation

uses uDm, UConexao, UdmConexao, uRelatorio;

{$R *.dfm}

procedure TfrmCadCliente.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsCliente.Close;
    CarregaConsulta();
    dm.cdsCliente.Open;
end;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
   inherited;
   Cancelar();
end;

procedure TfrmCadCliente.btnEditarClick(Sender: TObject);
begin
     Editar();
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
     Excluir();
end;

procedure TfrmCadCliente.btnIncluirClick(Sender: TObject);
begin
    Incluir();
end;

procedure TfrmCadCliente.btnRelatClick(Sender: TObject);
begin
    if not dm.cdsCliente.IsEmpty then
    begin
        try
          frmRelatorio := TfrmRelatorio.Create(nil);
          frmRelatorio.rlCliente.Preview();
        finally
          FreeAndNil(frmRelatorio);
        end;
    end
    else
       MessageDlg('Não existem registros!', mtWarning, [mbOK], 0);
end;

procedure TfrmCadCliente.btnSairClick(Sender: TObject);
begin
    self.Close;
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
    Gravar(FOperacao);
end;

procedure TfrmCadCliente.Cancelar;
begin
  inherited;
  grpCliente.Enabled := false;
end;

procedure TfrmCadCliente.CarregaCampos;
begin
      //Carrega os valores do cds nos campos do formulário
      edtCodigo.Text    := dm.cdsCliente.FieldByName('COD_CLI').AsString;
      edtNome.Text      := dm.cdsCliente.FieldByName('NOME_RAZAO').AsString;
      edtCNPJ.Text      := dm.cdsCliente.FieldByName('CNPJ_CPF').AsString;
      edtINSC_EST.Text  := dm.cdsCliente.FieldByName('INSC_EST').AsString;
      edtFone.Text      := dm.cdsCliente.FieldByName('FONE').AsString;
      edtCEP.Text       := dm.cdsCliente.FieldByName('CEP').AsString;
      edtRua.Text       := dm.cdsCliente.FieldByName('RUA').AsString;
      edtNumero.Text    := dm.cdsCliente.FieldByName('NUMERO').AsString;
      edtBairro.Text    := dm.cdsCliente.FieldByName('BAIRRO').AsString;
      edtCidade.Text    := dm.cdsCliente.FieldByName('CIDADE').AsString;
      cmbUF.ItemIndex   := cmbUF.Items.IndexOf(dm.cdsCliente.FieldByName('UF').AsString);
end;

procedure TfrmCadCliente.CarregaConsulta;
begin
      // Carrega consulta básica
      dm.qryCliente.Close;
      dm.qryCliente.SQL.Clear;
      dm.qryCliente.SQL.Add(SELECT);
      dm.qryCliente.Open;
end;

procedure TfrmCadCliente.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos();
end;

procedure TfrmCadCliente.dbgrdPesquisaTitleClick(Column: TColumn);
begin
    //Ordena os registros de acordo com o título da coluna clicada
    dm.cdsCliente.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadCliente.Editar;
begin
    //Procedimento de Edição
    inherited;
    SetOperacao(opUpdate);
    grpCliente.Enabled         := True;
    pgCadastro.ActivePageIndex := 0;
    edtNome.SetFocus;
end;

procedure TfrmCadCliente.edtpesqChange(Sender: TObject);
begin
    //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
    if (edtpesq.Text <> '') then
    begin
          dm.qryCliente.Close;
          dm.qryCliente.SQL.Clear;
          dm.qryCliente.SQL.Add(SELECT);
          dm.qryCliente.SQL.Add(WHERE);
          dm.qryCliente.ParamByName('nome').AsString := edtpesq.Text + '%';
          dm.qryCliente.Open;
    end
    else
    begin
         CarregaConsulta();
    end;
    dm.cdsCliente.Refresh;
end;

procedure TfrmCadCliente.Excluir;
begin
     //Procedimento de Exclusão de registro
     try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryCliente.Close;
            dm.qryCliente.SQL.Clear;
            dm.qryCliente.SQL.Add(DELETE);
            dm.qryCliente.ParamByName('codigo').AsString := dm.cdsCliente.FieldByName('COD_CLI').AsString;
            dm.qryCliente.ExecSQL();
            LimpaCampos();
            AtualizaGrid();
        end;
     except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadCliente.doClose(var Action: TCloseAction);
begin
    inherited;
    dm.cdsCliente.Close;
    Action        := caFree;
    frmCadCliente := nil;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
    //Carrega os itens(Estados) do combobox com o conteúdo do arquivo UF.txt
    cmbUF.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'UF.txt');
end;


procedure TfrmCadCliente.Gravar(Operacao: TOperacao);
begin
     //Procedimento de gravação

     //Verifica se os campos obrigatórios foram preenchidos
     if (self.VerificaCampos()) then
     begin
         //Verifica se é operação de Inclusão
         if (Operacao = opInsert) and (VerificaDuplicidade(edtCNPJ.Text)) then
         begin
             try
                  dm.qryCliente.Close;
                  dm.qryCliente.SQL.Clear;
                  dm.qryCliente.SQL.Add(INSERT);
                  dm.qryCliente.Params.ParamByName('nome').AsString    := edtNome.Text;
                  dm.qryCliente.Params.ParamByName('cnpj').AsString    := edtCNPJ.Text;
                  dm.qryCliente.Params.ParamByName('insc').AsString    := edtINSC_EST.Text;
                  dm.qryCliente.Params.ParamByName('rua').AsString     := edtRua.Text;
                  dm.qryCliente.Params.ParamByName('numero').AsString  := edtNumero.Text;
                  dm.qryCliente.Params.ParamByName('bairro').AsString  := edtBairro.Text;
                  dm.qryCliente.Params.ParamByName('cidade').AsString  := edtCidade.Text;
                  dm.qryCliente.Params.ParamByName('uf').AsString      := cmbUF.Text;
                  dm.qryCliente.Params.ParamByName('cep').AsString     := edtCEP.Text;
                  dm.qryCliente.Params.ParamByName('fone').AsString    := edtFone.Text;
                  dm.qryCliente.ExecSQL();
                  LimpaCampos();
                  grpCliente.Enabled := False;
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
                      dm.qryCliente.Close;
                      dm.qryCliente.SQL.Clear;
                      dm.qryCliente.SQL.Add(EDICAO);
                      dm.qryCliente.Params.ParamByName('nome').AsString   := edtNome.Text;
                      dm.qryCliente.Params.ParamByName('cnpj').AsString   :=edtCNPJ.Text;
                      dm.qryCliente.Params.ParamByName('insc').AsString   := edtINSC_EST.Text;
                      dm.qryCliente.Params.ParamByName('rua').AsString    := edtRua.Text;
                      dm.qryCliente.Params.ParamByName('numero').AsString := edtNumero.Text;
                      dm.qryCliente.Params.ParamByName('bairro').AsString := edtBairro.Text;
                      dm.qryCliente.Params.ParamByName('cidade').AsString := edtCidade.Text;
                      dm.qryCliente.Params.ParamByName('uf').AsString     := cmbUF.Text;
                      dm.qryCliente.Params.ParamByName('cep').AsString    := edtCEP.Text;
                      dm.qryCliente.Params.ParamByName('fone').AsString   := edtFone.Text;
                      dm.qryCliente.Params.ParamByName('codigo').AsString := edtCodigo.Text;
                      dm.qryCliente.ExecSQL();
                      grpCliente.Enabled := False;
                      LimpaCampos();
                      SetOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
end;

function TfrmCadCliente.VerificaDuplicidade(CNPJ_CPF: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('cnpj_cpf').AsString := CNPJ_CPF;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('CNPJ ou CPF já cadastrado com esse nome: ' + qryVerif.Fields[0].AsString , mtError, [mbOK], 0);
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

function TfrmCadCliente.VerificaCampos: Boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtNome.Text <> '') and (edtCNPJ.Text <> '') then
     begin
        if Length(edtCNPJ.Text) >= 9 then
        begin
           Result := True;
        end
        else
        begin
            MessageDlg('O campo CNPJ/CPF não possui o mínimo de 9 digítos!', mtError, [mbOK], 0);
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

procedure TfrmCadCliente.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
    SetOperacao(opInsert);
    grpCliente.Enabled         := True;
    pgCadastro.ActivePageIndex := 0;
    LimpaCampos();
    edtNumero.Text             := '0';
    edtNome.SetFocus;
end;

procedure TfrmCadCliente.TabSheet1Show(Sender: TObject);
begin
     AtualizaGrid();
end;

end.
