unit uCad_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  DBCtrls, Mask, DB, uFormBase;

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
    procedure FormCreate(Sender: TObject);
    procedure Incluir();                 override;
    procedure Editar();                  override;
    procedure Gravar(Parametro: string); override;
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
    procedure grdUsuarioCellClick(Column: TColumn);
    procedure AtualizaGrid();
    procedure tsPesquisaShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmCadUsuario.AtualizaGrid;
begin
    //Atualiza dados do ClientDataSet
    dm.cdsUsuario.Close;
    CarregaConsulta();
    dm.cdsUsuario.Open;
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
   Gravar(Param);
end;

procedure TfrmCadUsuario.CarregaCampos;
begin
    //Carrega os valores do cds nos campos do formulário
    edtID.Text              := dm.cdsUsuario.FieldByName('COD_USER').AsString;
    edtLogin.Text           := dm.cdsUsuario.FieldByName('DESC_USUARIO').AsString;
    cmbPrivilegio.ItemIndex := cmbPrivilegio.Items.IndexOf(dm.cdsUsuario.FieldByName('PRIVILEGIO').AsString);
    edtSenha.Text           := dm.cdsUsuario.FieldByName('SENHA').AsString;
end;

procedure TfrmCadUsuario.CarregaConsulta;
begin
     //Carrega consulta básica
     dm.qryUsuario.Close;
     dm.qryUsuario.SQL.Clear;
     dm.qryUsuario.SQL.Add('SELECT COD_USER, DESC_USUARIO, PRIVILEGIO, SENHA, DATA_CADASTRO FROM USUARIO');
     dm.qryUsuario.Open;
end;

procedure TfrmCadUsuario.Editar;
begin
     //Procedimento de Edição de registros
     inherited;
     Param                      := 'U';
     grpCadastro.Enabled        := True;
     pgCadastro.ActivePageIndex := 0;
     edtLogin.SetFocus;
end;

procedure TfrmCadUsuario.edtPesquisaChange(Sender: TObject);
begin
     //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
     if (edtPesquisa.Text <> '') then
     begin
         dm.qryUsuario.Close;
         dm.qryUsuario.SQL.Clear;
         dm.qryUsuario.SQL.Add('SELECT COD_USER, DESC_USUARIO, PRIVILEGIO, SENHA, DATA_CADASTRO FROM USUARIO WHERE DESC_USUARIO LIKE'+ QuotedStr(edtPesquisa.Text + '%'));
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
              dm.qryUsuario.SQL.Add('DELETE FROM USUARIO WHERE COD_USER = :codigo');
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

procedure TfrmCadUsuario.Gravar(Parametro: string);
begin
     //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (VerificaCampos) and (VerificaSenha) then
         begin
             try
                  dm.qryUsuario.Close;
                  dm.qryUsuario.SQL.Clear;
                  dm.qryUsuario.SQL.Add('INSERT INTO USUARIO (DESC_USUARIO, PRIVILEGIO, SENHA)VALUES(:login, :privilegio, :senha)');
                  dm.qryUsuario.Params.ParamByName('login').AsString      := edtLogin.Text;
                  dm.qryUsuario.Params.ParamByName('privilegio').AsString := cmbPrivilegio.Text;
                  dm.qryUsuario.Params.ParamByName('senha').AsString      := edtSenha.Text;
                  dm.qryUsuario.ExecSQL();
                  LimpaCAmpos();
                  grpCadastro.Enabled := False;
             except
                  on E:Exception do
                  ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
             end;
         end;
     end
     else
     begin
          //Verifica se é operação de Update
          if (Parametro = 'U') then
          begin
              try
                  dm.qryUsuario.Close;
                  dm.qryUsuario.SQL.Clear;
                  dm.qryUsuario.SQL.Add('UPDATE USUARIO SET DESC_USUARIO=:login, PRIVILEGIO=:privilegio, SENHA=:senha WHERE COD_USER=:codigo');
                  dm.qryUsuario.Params.ParamByName('codigo').AsString     := dm.cdsUsuario.FieldByName('COD_USER').AsString;
                  dm.qryUsuario.Params.ParamByName('login').AsString      := edtLogin.Text;
                  dm.qryUsuario.Params.ParamByName('privilegio').AsString := cmbPrivilegio.Text;
                  dm.qryUsuario.Params.ParamByName('senha').AsString      := edtSenha.Text;
                  dm.qryUsuario.ExecSQL();
                  grpCadastro.Enabled := False;
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadUsuario.grdUsuarioCellClick(Column: TColumn);
begin
     CarregaCampos();
end;

procedure TfrmCadUsuario.Incluir;
begin
    //Procedimento de inclusão de um novo registro
    inherited;
     Param                      := 'I';
     grpCadastro.Enabled        := True;
     pgCadastro.ActivePageIndex := 0;
     edtLogin.SetFocus;
     LimpaCampos();
end;

procedure TfrmCadUsuario.tsPesquisaShow(Sender: TObject);
begin
    AtualizaGrid();
end;

function TfrmCadUsuario.VerificaCampos: Boolean;
begin
     //Verifica o preenchimento de campos obrigatórios
     if (edtLogin.Text <> '') and (edtSenha.Text <> '') then
        Result := True
     else
     begin
        Result := False;
        Application.MessageBox('Existe campos não preenchidos!', 'Erro', MB_OK);
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
