unit uAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase, uFuncao;

type
  TfrmCadAgenda = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    TabSheet1: TTabSheet;
    grp1: TGroupBox;
    grpAgenda: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    Label3: TLabel;
    edtpesq: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtNome: TEdit;
    edtFone: TEdit;
    edtCelular: TEdit;
    edtEmail: TEdit;
    btn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure Incluir();                 override;
    procedure Editar();                  override;
    procedure Gravar(Parametro: string); override;
    procedure Excluir();                 override;
    procedure AtualizaGrid();
    procedure CarregaConsulta();
    procedure CarregaCampos();
    procedure TabSheet1Show(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtpesqChange(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure dbgrdPesquisaTitleClick(Column: TColumn);
  private

  public
    { Public declarations }
  end;

var
  frmCadAgenda: TfrmCadAgenda;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmCadAgenda.AtualizaGrid;
begin
   //Atualiza os dados no ClientDataSet
   dm.cdsAgenda.Close;
   CarregaConsulta();
   dm.cdsAgenda.Open;
end;

procedure TfrmCadAgenda.btnEditarClick(Sender: TObject);
begin
     Editar();
end;

procedure TfrmCadAgenda.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmCadAgenda.btnIncluirClick(Sender: TObject);
begin
    Incluir();
end;

procedure TfrmCadAgenda.btnSairClick(Sender: TObject);
begin
     frmCadAgenda.Close;
end;

procedure TfrmCadAgenda.btnSalvarClick(Sender: TObject);
begin
    Gravar(Param);
end;

procedure TfrmCadAgenda.CarregaCampos;
begin
     //Carrega os valores do cds nos campos do formulário
     edtNome.Text    := dm.cdsAgenda.FieldByName('CONTATO').AsString;
     edtFone.Text    := dm.cdsAgenda.FieldByName('FONE').AsString;
     edtCelular.Text := dm.cdsAgenda.FieldByName('CELULAR').AsString;
     edtEmail.Text   := dm.cdsAgenda.FieldByName('EMAIL').AsString;
end;

procedure TfrmCadAgenda.CarregaConsulta;
begin
    //Carrega consulta básica
    dm.qryAgenda.Close;
    dm.qryAgenda.SQL.Clear;
    dm.qryAgenda.SQL.Add('SELECT ID, CONTATO, FONE, CELULAR, EMAIL FROM AGENDA');
    dm.qryAgenda.Open;
end;

procedure TfrmCadAgenda.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos();
end;

procedure TfrmCadAgenda.dbgrdPesquisaTitleClick(Column: TColumn);
begin
    //Ordena os registros de acordo com o título da coluna clicada
    dm.cdsAgenda.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadAgenda.Editar;
begin
    //Procedimento de Edição
    inherited;
    Param                      := 'U';
    pgCadastro.ActivePageIndex := 0;
    grpAgenda.Enabled          := True;
    edtNome.SetFocus;
end;

procedure TfrmCadAgenda.edtpesqChange(Sender: TObject);
begin
     //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
     if edtpesq.Text <> '' then
     begin
         dm.qryAgenda.Close;
         dm.qryAgenda.SQL.Clear;
         dm.qryAgenda.SQL.Add('SELECT ID, CONTATO, FONE, CELULAR, EMAIL FROM AGENDA');
         dm.qryAgenda.SQL.Add('WHERE CONTATO LIKE' + QuotedStr(edtpesq.Text + '%'));
         dm.qryAgenda.Open;
         dm.cdsAgenda.Refresh;
     end
     else
     begin
         CarregaConsulta();
     end;
     dm.cdsAgenda.Refresh;
end;

procedure TfrmCadAgenda.Excluir;
begin
    //Procedimento de Exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryAgenda.Close;
            dm.qryAgenda.SQL.Clear;
            dm.qryAgenda.SQL.Add('DELETE FROM AGENDA WHERE ID = :id');
            dm.qryAgenda.ParamByName('id').AsInteger := dm.cdsAgenda.FieldByName('ID').AsInteger;
            dm.qryAgenda.ExecSQL();
            LimpaCampos();
            AtualizaGrid();
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dm.cdsAgenda.Close;
     Action       := caFree;
     frmCadAgenda := nil;
end;

procedure TfrmCadAgenda.Gravar(Parametro: string);
begin
    //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (edtNome.Text <> '') then
         begin
             try
                  dm.qryAgenda.Close;
                  dm.qryAgenda.SQL.Clear;
                  dm.qryAgenda.SQL.Add('INSERT INTO AGENDA (CONTATO, FONE, CELULAR, EMAIL)'+
                  'VALUES(:nome, :fone, :celular, :email)');
                  dm.qryAgenda.Params.ParamByName('nome').AsString    := edtNome.Text;
                  dm.qryAgenda.Params.ParamByName('fone').AsString    := edtFone.Text;
                  dm.qryAgenda.Params.ParamByName('celular').AsString := edtCelular.Text;
                  dm.qryAgenda.Params.ParamByName('email').AsString   := edtEmail.Text;
                  dm.qryAgenda.ExecSQL();
                  LimpaCampos();
                  AtualizaGrid();
                  grpAgenda.Enabled := False;
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
                  dm.qryAgenda.Close;
                  dm.qryAgenda.SQL.Clear;
                  dm.qryAgenda.SQL.Add('UPDATE AGENDA SET '+
                  'CONTATO=:nome, FONE=:fone ,CELULAR=:celular, EMAIL=:email '+
                  'WHERE ID=:id');
                  dm.qryAgenda.Params.ParamByName('nome').AsString    := edtNome.Text;
                  dm.qryAgenda.Params.ParamByName('fone').AsString    := edtFone.Text;
                  dm.qryAgenda.Params.ParamByName('celular').AsString := edtCelular.Text;
                  dm.qryAgenda.Params.ParamByName('email').AsString   := edtEmail.Text;
                  dm.qryAgenda.Params.ParamByName('id').AsInteger     := dm.cdsAgenda.FieldByName('ID').AsInteger;
                  dm.qryAgenda.ExecSQL();
                  AtualizaGrid();
                  grpAgenda.Enabled := False;
                  LimpaCampos();
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadAgenda.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
    Param                      := 'I';
    pgCadastro.ActivePageIndex := 0;
    grpAgenda.Enabled          := True;
    LimpaCampos();
    edtNome.SetFocus;
end;

procedure TfrmCadAgenda.TabSheet1Show(Sender: TObject);
begin
    CarregaConsulta();
end;

end.
