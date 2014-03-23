unit uCad_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  DBCtrls, Mask, DB, uFormBase, SqlExpr, ACBrBase, ACBrEnterTab;

type
  TfrmCadUsuario = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpCadastro: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtConfirma: TEdit;
    edtLogin: TEdit;
    cmbPrivilegio: TComboBox;
    edtSenha: TEdit;
    tsPesquisa: TTabSheet;
    grdUsuario: TDBGrid;
    pnlPesquisa: TPanel;
    Label2: TLabel;
    edtPesquisa: TEdit;
    lbl1: TLabel;
    edtID: TEdit;
    Label6: TLabel;
    edtNome: TEdit;
    edtChapa: TEdit;
    Label7: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure Incluir();                 override;
    procedure Editar();                  override;
    procedure Cancelar();                  override;
    procedure Gravar(Operacao: TOperacao); override;
    procedure Excluir();                 override;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure CarregaCampos();
    procedure CarregaConsulta();
    function VerificaCampos: Boolean;
    function VerificaSenha: Boolean;
    function VerificaDuplicidade(Usuario, Senha: string): Boolean;
    procedure grdUsuarioCellClick(Column: TColumn);
    procedure AtualizaGrid();
    procedure tsPesquisaShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses uDm, UdmConexao;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO USUARIO (DESC_USUARIO, PRIVILEGIO, SENHA, NOME, CHAPA)VALUES(:login, :privilegio, :senha, :nome, :chapa)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE USUARIO SET DESC_USUARIO=:login, PRIVILEGIO=:privilegio, SENHA=:senha, NOME=:nome, CHAPA=:chapa WHERE COD_USER=:codigo';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM USUARIO WHERE COD_USER = :codigo';

  // Instrução SQL para SELECT geral
  SELECT: string = 'SELECT COD_USER, DESC_USUARIO, PRIVILEGIO, SENHA, DATA_CADASTRO, NOME, CHAPA FROM USUARIO';

  // Instrução SQL para WHERE de pesquisa
  WHERE: string = 'WHERE DESC_USUARIO LIKE :user OR NOME LIKE :nome';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT DESC_USUARIO, SENHA FROM USUARIO WHERE DESC_USUARIO = :usuario OR SENHA = :senha';


{$R *.dfm}

procedure TfrmCadUsuario.AtualizaGrid;
begin
    //Atualiza dados do ClientDataSet
    dm.cdsUsuario.Close;
    CarregaConsulta();
    dm.cdsUsuario.Open;
end;

procedure TfrmCadUsuario.btnCancelarClick(Sender: TObject);
begin
    Cancelar();
end;

procedure TfrmCadUsuario.btnEditarClick(Sender: TObject);
begin
    Editar();
end;

procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
     Excluir();
end;

procedure TfrmCadUsuario.btnIncluirClick(Sender: TObject);
begin
     Incluir();
end;

procedure TfrmCadUsuario.btnSairClick(Sender: TObject);
begin
    frmCadUsuario.Close;
end;

procedure TfrmCadUsuario.btnSalvarClick(Sender: TObject);
begin
   Gravar(FOperacao);
end;

procedure TfrmCadUsuario.Cancelar;
begin
  inherited;
  grpCadastro.Enabled := false;
end;

procedure TfrmCadUsuario.CarregaCampos;
begin
    //Carrega os valores do cds nos campos do formulário
    edtID.Text              := dm.cdsUsuario.FieldByName('COD_USER').AsString;
    edtLogin.Text           := dm.cdsUsuario.FieldByName('DESC_USUARIO').AsString;
    cmbPrivilegio.ItemIndex := cmbPrivilegio.Items.IndexOf(dm.cdsUsuario.FieldByName('PRIVILEGIO').AsString);
    edtSenha.Text           := dm.cdsUsuario.FieldByName('SENHA').AsString;
    edtConfirma.Text        := dm.cdsUsuario.FieldByName('SENHA').AsString;
    edtNome.Text            := dm.cdsUsuario.FieldByName('NOME').AsString;
    edtChapa.Text           := dm.cdsUsuario.FieldByName('CHAPA').AsString;
end;

procedure TfrmCadUsuario.CarregaConsulta;
begin
     //Carrega consulta básica
     dm.qryUsuario.Close;
     dm.qryUsuario.SQL.Clear;
     dm.qryUsuario.SQL.Add(SELECT);
     dm.qryUsuario.Open;
end;

procedure TfrmCadUsuario.Editar;
begin
     //Procedimento de Edição de registros
     inherited;
     setOperacao(opUpdate);
     grpCadastro.Enabled        := True;
     pgCadastro.ActivePageIndex := 0;
     edtNome.SetFocus;
end;

procedure TfrmCadUsuario.edtPesquisaChange(Sender: TObject);
begin
     //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
     if (edtPesquisa.Text <> '') then
     begin
         dm.qryUsuario.Close;
         dm.qryUsuario.SQL.Clear;
         dm.qryUsuario.SQL.Add(SELECT);
         dm.qryUsuario.SQL.Add(WHERE);
         dm.qryUsuario.ParamByName('user').AsString := edtPesquisa.Text + '%';
         dm.qryUsuario.ParamByName('nome').AsString := edtPesquisa.Text + '%';
         dm.qryUsuario.Open;
     end
     else
     begin
         CarregaConsulta;
     end;
     dm.cdsUsuario.Refresh;
end;

procedure TfrmCadUsuario.Excluir;
begin
     //Procedimento de exclusão de registro
     try
          if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
          begin
              dm.qryUsuario.Close;
              dm.qryUsuario.SQL.Clear;
              dm.qryUsuario.SQL.Add(DELETE);
              dm.qryUsuario.ParamByName('codigo').AsString := dm.cdsUsuario.FieldByName('COD_USER').AsString;
              dm.qryUsuario.ExecSQL();
              LimpaCampos();
              AtualizaGrid();
          end;
     except
          on E:Exception do
          ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsUsuario.Close;
    Action        := caFree;
    frmCadUsuario := nil;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
    //Carrega os itens(Privilegios) do combobox com o retorno da função da unit Udm
    cmbPrivilegio.Items.AddStrings(dm.CarregaPrivilegio);
end;

procedure TfrmCadUsuario.Gravar(Operacao: TOperacao);
begin
     //Procedimento de gravação

     if (VerificaCampos) and (VerificaSenha) then
     begin
         //Verifica se é operação de Inclusão
         if (Operacao = opInsert) then
         begin
             if (VerificaDuplicidade(edtLogin.Text, edtSenha.Text)) then
             begin
                 try
                      dm.qryUsuario.Close;
                      dm.qryUsuario.SQL.Clear;
                      dm.qryUsuario.SQL.Add(INSERT);
                      dm.qryUsuario.Params.ParamByName('login').AsString      := edtLogin.Text;
                      dm.qryUsuario.Params.ParamByName('privilegio').AsString := cmbPrivilegio.Text;
                      dm.qryUsuario.Params.ParamByName('senha').AsString      := edtSenha.Text;
                      dm.qryUsuario.Params.ParamByName('nome').AsString       := edtNome.Text;
                      dm.qryUsuario.Params.ParamByName('chapa').AsString      := edtChapa.Text;
                      dm.qryUsuario.ExecSQL();
                      LimpaCAmpos();
                      grpCadastro.Enabled := False;
                      setOperacao(opNone);
                 except
                      on E:Exception do
                      ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
                 end;
             end;
         end
         else
         begin
              //Verifica se é operação de Update
              if (Operacao = opUpdate) then
              begin
                  try
                      dm.qryUsuario.Close;
                      dm.qryUsuario.SQL.Clear;
                      dm.qryUsuario.SQL.Add(EDICAO);
                      dm.qryUsuario.Params.ParamByName('codigo').AsString     := dm.cdsUsuario.FieldByName('COD_USER').AsString;
                      dm.qryUsuario.Params.ParamByName('login').AsString      := edtLogin.Text;
                      dm.qryUsuario.Params.ParamByName('privilegio').AsString := cmbPrivilegio.Text;
                      dm.qryUsuario.Params.ParamByName('senha').AsString      := edtSenha.Text;
                      dm.qryUsuario.Params.ParamByName('nome').AsString       := edtNome.Text;
                      dm.qryUsuario.Params.ParamByName('chapa').AsString      := edtChapa.Text;
                      dm.qryUsuario.ExecSQL();
                      LimpaCAmpos();
                      grpCadastro.Enabled := False;
                      setOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
end;

procedure TfrmCadUsuario.grdUsuarioCellClick(Column: TColumn);
begin
     CarregaCampos();
end;

procedure TfrmCadUsuario.Incluir;
begin
    //Procedimento de inclusão de um novo registro
    inherited;
     setOperacao(opInsert);
     grpCadastro.Enabled        := True;
     pgCadastro.ActivePageIndex := 0;
     edtNome.SetFocus;
     LimpaCampos();
end;

procedure TfrmCadUsuario.tsPesquisaShow(Sender: TObject);
begin
    AtualizaGrid();
end;

function TfrmCadUsuario.VerificaCampos: Boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtNome.Text <> '') and (edtLogin.Text <> '') and (cmbPrivilegio.Text <> '') and
        (edtSenha.Text <> '') and (edtConfirma.Text <> '') then
     begin
        if (Length(edtSenha.Text) >= 6) and (Length(edtConfirma.Text) >= 6) then
        begin
           Result := True;
        end
        else
        begin
            MessageDlg('O campo Senha e Confirmação não possui o mínimo de 6 digítos!', mtError, [mbOK], 0);
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

function TfrmCadUsuario.VerificaDuplicidade(Usuario, Senha: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('usuario').AsString := Usuario;
        qryVerif.ParamByName('senha').AsString := Senha;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Usuário ou Senha já cadastrado!' , mtError, [mbOK], 0);
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

function TfrmCadUsuario.VerificaSenha: Boolean;
begin
    //Verifica se o texto do edtSenha é igual ao texto do edtConfirma
    if (Trim(edtSenha.Text) = Trim(edtConfirma.Text)) then
        Result := True
    else
    begin
        Result := False;
        Application.MessageBox('Senha não confere, digite novamente!', 'Erro', MB_OK);
    end;
end;

end.
