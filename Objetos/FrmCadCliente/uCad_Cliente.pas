unit uCad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase;

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
    procedure btnSairClick(Sender: TObject);
    procedure Incluir();                override;
    procedure Editar();                 override;
    procedure Gravar(Parametro: string);override;
    procedure Excluir();                override;
    procedure CarregaCampos();
    procedure AtualizaGrid();
    procedure CarregaConsulta();
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmCadCliente.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsCliente.Close;
    CarregaConsulta();
    dm.cdsCliente.Open;
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

procedure TfrmCadCliente.btnSairClick(Sender: TObject);
begin
    frmCadCliente.Close;
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
    Gravar(Param);
end;

procedure TfrmCadCliente.CarregaCampos;
begin
      //Carrega os valores do cds nos campos do formulário
      edtCodigo.Text    := dm.cdsCliente.FieldByName('COD_CLI').AsString;
      edtNome.Text      := dm.cdsCliente.FieldByName('NOME_RAZAO').AsString;
      edtCNPJ.Text      := dm.cdsCliente.FieldByName('CNPJ').AsString;
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
       //Carrega consulta básica
      dm.qryCliente.Close;
      dm.qryCliente.SQL.Clear;
      dm.qryCliente.SQL.Add('SELECT COD_CLI, NOME_RAZAO, CNPJ, INSC_EST, FONE, CEP, RUA, NUMERO, BAIRRO, CIDADE, UF');
      dm.qryCliente.SQL.Add('FROM CLIENTE');
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
    Param                      := 'U';
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
          dm.qryCliente.SQL.Add('SELECT COD_CLI, NOME_RAZAO, CNPJ, INSC_EST, FONE, CEP, RUA, NUMERO, BAIRRO, CIDADE, UF');
          dm.qryCliente.SQL.Add('FROM CLIENTE WHERE NOME_RAZAO LIKE'+ QuotedStr(edtpesq.Text + '%'));
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
            dm.qryCliente.SQL.Add('DELETE FROM CLIENTE WHERE COD_CLI = :codigo');
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


procedure TfrmCadCliente.Gravar(Parametro: string);
begin
     //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (edtNome.Text <> '') then
         begin
             try
                  dm.qryCliente.Close;
                  dm.qryCliente.SQL.Clear;
                  dm.qryCliente.SQL.Add('INSERT INTO CLIENTE (NOME_RAZAO, CNPJ, INSC_EST, RUA, NUMERO, BAIRRO, CIDADE, UF, CEP, FONE)'+
                  'VALUES(:nome, :cnpj, :insc, :rua, :numero, :bairro, :cidade, :uf, :cep, :fone)');
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
                  dm.qryCliente.Close;
                  dm.qryCliente.SQL.Clear;
                  dm.qryCliente.SQL.Add('UPDATE CLIENTE SET '+
                  'NOME_RAZAO=:nome, CNPJ=:cnpj ,INSC_EST=:insc ,RUA=:rua ,NUMERO=:numero ,BAIRRO=:bairro , CIDADE=:cidade , UF=:uf , CEP=:cep ,FONE=:fone '+
                  'WHERE COD_CLI=:codigo');
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
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadCliente.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
    Param                      := 'I';
    grpCliente.Enabled         := True;
    pgCadastro.ActivePageIndex := 0;
    LimpaCampos();
    edtNumero                  := 0;
    edtNome.SetFocus;
end;

procedure TfrmCadCliente.TabSheet1Show(Sender: TObject);
begin
     AtualizaGrid();
end;

end.
