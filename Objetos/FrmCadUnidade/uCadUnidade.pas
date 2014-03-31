unit uCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ToolWin, uFormBase, SqlExpr, ExtCtrls,
  Grids, DBGrids;

type
  TfrmCadUnidade = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpUnidade: TGroupBox;
    Label1: TLabel;
    lbl2: TLabel;
    Label15: TLabel;
    Label5: TLabel;
    edtDescricao: TEdit;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtSigla: TEdit;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    grp1: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    Label4: TLabel;
    edtpesq: TEdit;
    btnCancelar: TBitBtn;
    Label6: TLabel;
    lblStatusOperacao: TLabel;
    function VerificaDuplicidade(Descricao, Sigla:string): Boolean;
    function VerificaCampos():Boolean;
    procedure Incluir;                     override;
    procedure Gravar(Operacao: TOperacao);   override;
    procedure Editar;                      override;
    procedure Cancelar;                      override;
    procedure Excluir;                     override;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtpesqChange(Sender: TObject);
    procedure CarregaConsulta();
    procedure FormCreate(Sender: TObject);
    procedure CarregaCampos();
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure AtualizaGrid();
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUnidade: TfrmCadUnidade;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO UNIDADE (DESC_UND, SIGLA)VALUES(:desc, :sigla)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE UNIDADE SET DESC_UND=:desc, SIGLA=:sigla WHERE COD_UND=:codigo';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM UNIDADE WHERE COD_UND = :codigo';

  // Intrução SQL básica de consulta
  SELECT: string = 'SELECT COD_UND, DESC_UND, SIGLA FROM UNIDADE ';

  //Instrução WHERE para consulta
  WHERE: string = 'WHERE DESC_UND LIKE :desc OR SIGLA LIKE :sigla ';

  // Instrução SQL para ordenar as consultas
  ORDERBY: string = 'ORDER BY DESC_UND, SIGLA';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT DESC_UND, SIGLA FROM UNIDADE WHERE DESC_UND = :desc OR SIGLA = :sigla';

implementation

uses UdmConexao, uDm;


{$R *.dfm}

{ TfrmCadUnidade }

procedure TfrmCadUnidade.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsUnidade.Close;
    CarregaConsulta();
    dm.cdsUnidade.Open;
end;

procedure TfrmCadUnidade.btnCancelarClick(Sender: TObject);
begin
    Cancelar();
end;

procedure TfrmCadUnidade.btnEditarClick(Sender: TObject);
begin
    Editar();
end;

procedure TfrmCadUnidade.btnExcluirClick(Sender: TObject);
begin
     Excluir();
end;

procedure TfrmCadUnidade.btnIncluirClick(Sender: TObject);
begin
   Incluir();
end;

procedure TfrmCadUnidade.btnSairClick(Sender: TObject);
begin
     frmCadUnidade.Close;
end;

procedure TfrmCadUnidade.btnSalvarClick(Sender: TObject);
begin
    Gravar(FOperacao);
end;

procedure TfrmCadUnidade.Cancelar;
begin
  inherited;
  grpUnidade.Enabled := false;
end;

procedure TfrmCadUnidade.CarregaCampos;
begin
     //Carrega os valores do cds nos campos do formulário
      edtCodigo.Text    := dm.cdsUnidade.FieldByName('COD_UND').AsString;
      edtDescricao.Text := dm.cdsUnidade.FieldByName('DESC_UND').AsString;
      edtSigla.Text     := dm.cdsUnidade.FieldByName('SIGLA').AsString;
end;

procedure TfrmCadUnidade.CarregaConsulta;
begin
      //Carrega consulta básica
      dm.qryUnidade.Close;
      dm.qryUnidade.SQL.Clear;
      dm.qryUnidade.SQL.Add(SELECT);
      dm.qryUnidade.SQL.Add(ORDERBY);
      dm.qryUnidade.Open;
end;

procedure TfrmCadUnidade.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos;
end;

procedure TfrmCadUnidade.Editar;
begin
   //Procedimento de Edição de registro
    inherited;
    setOperacao(opUpdate);
    grpUnidade.Enabled           := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
end;

procedure TfrmCadUnidade.edtpesqChange(Sender: TObject);
begin
    //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
    if (edtpesq.Text <> '') then
    begin
          dm.qryUnidade.Close;
          dm.qryUnidade.SQL.Clear;
          dm.qryUnidade.SQL.Add(SELECT);
          dm.qryUnidade.SQL.Add(WHERE);
          dm.qryUnidade.SQL.Add(ORDERBY);
          dm.qryUnidade.ParamByName('desc').AsString := edtpesq.Text + '%';
          dm.qryUnidade.ParamByName('sigla').AsString := edtpesq.Text + '%';
          dm.qryUnidade.Open;
    end
    else
    begin
         CarregaConsulta();
    end;
    dm.cdsUnidade.Refresh;
end;

procedure TfrmCadUnidade.Excluir;
begin
    //Procedimento de Exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryUnidade.Close;
            dm.qryUnidade.SQL.Clear;
            dm.qryUnidade.SQL.Add(DELETE);
            dm.qryUnidade.ParamByName('codigo').AsString := edtCodigo.Text;
            dm.qryUnidade.ExecSQL();
            LimpaCampos();
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadUnidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsUnidade.Close;
    Action := caFree;
    frmCadUnidade := nil;
end;

procedure TfrmCadUnidade.FormCreate(Sender: TObject);
begin
    dm.cdsUnidade.Open;
end;

procedure TfrmCadUnidade.Gravar(Operacao: TOperacao);
begin
     //Procedimento de gravação
     if VerificaCampos then
     begin
         //Verifica se é operação de Inclusão
         if (Operacao = opInsert) and (VerificaDuplicidade(edtDescricao.Text, edtSigla.Text)) then
         begin
             try
                  dm.qryUnidade.Close;
                  dm.qryUnidade.SQL.Clear;
                  dm.qryUnidade.SQL.Add(INSERT);
                  dm.qryUnidade.Params.ParamByName('desc').AsString  := edtDescricao.Text;
                  dm.qryUnidade.Params.ParamByName('sigla').AsString := edtSigla.Text;
                  dm.qryUnidade.ExecSQL();
                  LimpaCampos();
                  AtualizaGrid();
                  grpUnidade.Enabled := False;
                  setOperacao(opNone);
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
                      dm.qryUnidade.Close;
                      dm.qryUnidade.SQL.Clear;
                      dm.qryUnidade.SQL.Add(EDICAO);
                      dm.qryUnidade.Params.ParamByName('codigo').AsString := edtCodigo.Text;
                      dm.qryUnidade.Params.ParamByName('desc').AsString   := edtDescricao.Text;
                      dm.qryUnidade.Params.ParamByName('sigla').AsString  := edtSigla.Text;
                      dm.qryUnidade.ExecSQL();
                      grpUnidade.Enabled := False;
                      LimpaCampos();
                      AtualizaGrid();
                      setOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
end;

procedure TfrmCadUnidade.Incluir;
begin
    //Procedimento de Inclusão de registro
    inherited;
    setOperacao(opInsert);
    grpUnidade.Enabled         := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
    LimpaCampos();
end;

function TfrmCadUnidade.VerificaCampos: Boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtDescricao.Text <> '') and (edtSigla.Text <> '') then
     begin
        Result := true;
     end
     else
     begin
        Result := False;
        MessageDlg('Existem campos obrigatórios(*) sem preenchimento!', mtError, [mbOK], 0);
        Abort;
     end;
end;

function TfrmCadUnidade.VerificaDuplicidade(Descricao, Sigla: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('desc').AsString := Descricao;
        qryVerif.ParamByName('sigla').AsString := Sigla;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Unidade ou Sigla já cadastrados!' , mtError, [mbOK], 0);
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
