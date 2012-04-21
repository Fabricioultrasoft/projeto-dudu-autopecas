unit uCad_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase;

type
  TfrmCadFornecedor = class(TFormBaseCad)
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
    grpFornecedor: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    Label13: TLabel;
    edtCodigo: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    edtFone: TEdit;
    edtNome: TEdit;
    edtFoneR: TEdit;
    edtRepresentante: TEdit;
    pnl: TPanel;
    Label3: TLabel;
    edtpesq: TEdit;
    btnPesquisar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
    procedure Incluir();                  override;
    procedure Editar();                   override;
    procedure Excluir();                  override;
    procedure Gravar(Parametro: string);  override;
    procedure AtualizaGrid();
    procedure CarregaCampos();
    procedure CarregaConsulta();
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure edtpesqChange(Sender: TObject);
    procedure btnRelatClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedor: TfrmCadFornecedor;

implementation

uses uDm, uRelatorio, uProcura_Fornecedor;

{$R *.dfm}

procedure TfrmCadFornecedor.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsFornecedor.Close;
    CarregaConsulta();
    dm.cdsFornecedor.Open;
end;

procedure TfrmCadFornecedor.btnEditarClick(Sender: TObject);
begin
    Editar();
end;

procedure TfrmCadFornecedor.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmCadFornecedor.btnIncluirClick(Sender: TObject);
begin
   Incluir();
end;

procedure TfrmCadFornecedor.btnPesquisarClick(Sender: TObject);
begin
    //Carrega o form para procura de fornecedor
    try
      frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
      frmProcura_Fornecedor.ShowModal;
    finally
      FreeAndNil(frmProcura_Fornecedor);
    end;
end;

procedure TfrmCadFornecedor.btnRelatClick(Sender: TObject);
begin
    //Gera o relatório de fornecedores
    try
       frmRelatorio := TfrmRelatorio.Create(self);
       frmRelatorio.GeraReport('Report_Fornecedor', 'RTFonecedor.rav');
    finally
      FreeAndNil(frmRelatorio);
    end;
end;

procedure TfrmCadFornecedor.btnSairClick(Sender: TObject);
begin
   frmCadFornecedor.Close;
end;

procedure TfrmCadFornecedor.btnSalvarClick(Sender: TObject);
begin
    Gravar(Param);
end;

procedure TfrmCadFornecedor.CarregaCampos;
begin
      //Carrega os valores do cds nos campos do formulário
      edtCodigo.Text        := dm.cdsFornecedor.FieldByName('COD_FORN').AsString;
      edtNome.Text          := dm.cdsFornecedor.FieldByName('DESC_FORN').AsString;
      edtFone.Text          := dm.cdsFornecedor.FieldByName('FONE').AsString;
      edtRepresentante.Text := dm.cdsFornecedor.FieldByName('REPRESENTANTE').AsString;
      edtFoneR.Text         := dm.cdsFornecedor.FieldByName('FONE_REPRES').AsString;
end;

procedure TfrmCadFornecedor.CarregaConsulta;
begin
    //Carrega consulta básica
    dm.qryFornecedor.Close;
    dm.qryFornecedor.SQL.Clear;
    dm.qryFornecedor.SQL.Add('SELECT COD_FORN, DESC_FORN, FONE, REPRESENTANTE, FONE_REPRES FROM FORNECEDOR');
    dm.qryFornecedor.Open;
end;

procedure TfrmCadFornecedor.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos();
end;

procedure TfrmCadFornecedor.Editar;
begin
    //Procedimento de Edição
    inherited;
    Param                      := 'U';
    grpFornecedor.Enabled      := True;
    pgCadastro.ActivePageIndex := 0;
    edtNome.SetFocus;
end;

procedure TfrmCadFornecedor.edtpesqChange(Sender: TObject);
begin
     //Verifica se existe texto no edit, caso seja verdadeira executa pesquisa a partir do texto do edtpesq
    if edtpesq.Text <> '' then
    begin
        dm.qryFornecedor.Close;
        dm.qryFornecedor.SQL.Clear;
        dm.qryFornecedor.SQL.Add('SELECT COD_FORN, DESC_FORN, FONE, REPRESENTANTE, FONE_REPRES FROM FORNECEDOR');
        dm.qryFornecedor.SQL.Add('WHERE DESC_FORN LIKE '+ QuotedStr(edtpesq.Text + '%'));
        dm.qryFornecedor.Open
    end
    else
    begin
        CarregaConsulta;
    end;
    dm.cdsFornecedor.Refresh;
end;

procedure TfrmCadFornecedor.Excluir;
begin
      //Procedimento de Exclusão de registro
     try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryFornecedor.Close;
            dm.qryFornecedor.SQL.Clear;
            dm.qryFornecedor.SQL.Add('DELETE FROM FORNECEDOR WHERE COD_FORN = :codigo');
            dm.qryFornecedor.ParamByName('codigo').AsString := dm.cdsFornecedor.FieldByName('COD_FORN').AsString;
            dm.qryFornecedor.ExecSQL();
            LimpaCampos();
            AtualizaGrid();
        end;
     except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm.cdsFornecedor.Close;
     Action           := caFree;
     frmCadFornecedor := nil;
end;

procedure TfrmCadFornecedor.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
    inherited;

    if key = VK_F6 then
    begin
        try
          frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
          frmProcura_Fornecedor.ShowModal;
        finally
          FreeAndNil(frmProcura_Fornecedor);
        end;
    end;

    if key = VK_F5 then
    begin
        btnRelat.Click;
    end;
end;

procedure TfrmCadFornecedor.Gravar(Parametro: string);
begin
     //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (edtNome.Text <> '') then
         begin
             try
                  dm.qryFornecedor.Close;
                  dm.qryFornecedor.SQL.Clear;
                  dm.qryFornecedor.SQL.Add('INSERT INTO FORNECEDOR (DESC_FORN, FONE, REPRESENTANTE, FONE_REPRES)'+
                  'VALUES(:nome, :fone, :representante, :fone_r)');
                  dm.qryFornecedor.Params.ParamByName('nome').AsString          := edtNome.Text;
                  dm.qryFornecedor.Params.ParamByName('fone').AsString          := edtFone.Text;
                  dm.qryFornecedor.Params.ParamByName('representante').AsString := edtRepresentante.Text;
                  dm.qryFornecedor.Params.ParamByName('fone_r').AsString        := edtFoneR.Text;
                  dm.qryFornecedor.ExecSQL();
                  LimpaCampos();
                  AtualizaGrid();
                  grpFornecedor.Enabled := False;
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
                  dm.qryFornecedor.Close;
                  dm.qryFornecedor.SQL.Clear;
                  dm.qryFornecedor.SQL.Add('UPDATE FORNECEDOR SET '+
                  'DESC_FORN=:nome, FONE=:fone ,REPRESENTANTE=:representante ,FONE_REPRES=:fone_r WHERE COD_FORN=:codigo');
                  dm.qryFornecedor.Params.ParamByName('nome').AsString          := edtNome.Text;
                  dm.qryFornecedor.Params.ParamByName('fone').AsString          := edtFone.Text;
                  dm.qryFornecedor.Params.ParamByName('representante').AsString := edtRepresentante.Text;
                  dm.qryFornecedor.Params.ParamByName('fone_r').AsString        := edtFoneR.Text;
                  dm.qryFornecedor.Params.ParamByName('codigo').AsString        := edtCodigo.Text;
                  dm.qryFornecedor.ExecSQL();
                  grpFornecedor.Enabled := False;
                  LimpaCampos();
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadFornecedor.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
    Param                      := 'I';
    grpFornecedor.Enabled      := True;
    pgCadastro.ActivePageIndex := 0;
    LimpaCampos();
    edtNome.SetFocus;
end;

procedure TfrmCadFornecedor.TabSheet1Show(Sender: TObject);
begin
    AtualizaGrid();
end;

end.
