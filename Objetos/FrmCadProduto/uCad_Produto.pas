unit uCad_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
 uFormBase;

type
  TfrmCadProduto = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpProduto: TGroupBox;
    btnPesquisar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCodigo: TEdit;
    edtDesc: TEdit;
    mmAplicacao: TMemo;
    edtUnd: TEdit;
    edtEstoque_Min: TEdit;
    Label10: TLabel;
    edtGrupo: TEdit;
    btnProc_Grupo: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Incluir();                  override;
    procedure Editar();                   override;
    procedure Gravar(Parametro: string);  override;
    procedure Excluir();                  override;
    procedure CarregaCampos();
    function VerificaCampos: Boolean;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnProc_GrupoClick(Sender: TObject);
    procedure edtVal_VendaEnter(Sender: TObject);
    procedure mmAplicacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

uses uDm, uProcura_Fornecedor, uCad_Grupo, uProcura_Grupo, uProcura_Produto, uRelatorio,
  uCalcula_Perc;

{$R *.dfm}

procedure TfrmCadProduto.btnEditarClick(Sender: TObject);
begin
     Editar();
end;

procedure TfrmCadProduto.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmCadProduto.btnIncluirClick(Sender: TObject);
begin
    Incluir();
end;

procedure TfrmCadProduto.btnPesquisarClick(Sender: TObject);
begin
     //Carrega o form para procura de produtos
     try
       frmProcura_Produto := TfrmProcura_Produto.Create(self);
       frmProcura_Produto.ShowModal;
     finally
       FreeAndNil(frmProcura_Produto);

     end;
end;

procedure TfrmCadProduto.btnProc_GrupoClick(Sender: TObject);
begin
     //Carrega o form para procura de grupos
     try
       frmProcura_Grupo := TfrmProcura_Grupo.Create(self);
       frmProcura_Grupo.ShowModal;
     finally
       FreeAndNil(frmProcura_Grupo);
     end;
end;

procedure TfrmCadProduto.btnSairClick(Sender: TObject);
begin
    frmCadProduto.Close;
end;

procedure TfrmCadProduto.btnSalvarClick(Sender: TObject);
begin
    Gravar(Param);
end;

procedure TfrmCadProduto.CarregaCampos;
begin
      //
end;

procedure TfrmCadProduto.Editar;
begin
     //Procedimento de edição
     inherited;
     Param                      := 'U';
     grpProduto.Enabled         := True;
     pgCadastro.ActivePageIndex := 0;
     edtCodigo.SetFocus;
end;

procedure TfrmCadProduto.edtVal_VendaEnter(Sender: TObject);
begin
     //Carrega o formulário para calcular percentual

     //Verifica se está em processo de Inclusão ou Edição
     if (Param = 'I') or (Param = 'U') then
     begin
         try
           frmCalula_Perc := TfrmCalula_Perc.Create(self);
           frmCalula_Perc.ShowModal;
         finally
           FreeAndNil(frmCalula_Perc);
         end;
     end;
end;

procedure TfrmCadProduto.Excluir;
begin
     //Procedimento de exclusão do produto
     try
          if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
          begin
              dm.qryProduto.Close;
              dm.qryProduto.SQL.Clear;
              dm.qryProduto.SQL.Add('DELETE FROM PRODUTO WHERE COD_PROD = :codigo');
              dm.qryProduto.ParamByName('codigo').AsString := edtCodigo.Text;
              dm.qryProduto.ExecSQL();
              LimpaCampos();
          end;
     except
          on E:Exception do
          ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsProduto.Close;
    Action        := caFree;
    frmCadProduto := nil;
end;

procedure TfrmCadProduto.KeyDown(var Key: Word; Shift: TShiftState);
begin
    if not mmAplicacao.Focused then
       inherited;

    if Key = VK_F6 then
    begin
        try
          frmProcura_Produto := TfrmProcura_Produto.Create(self);
          frmProcura_Produto.ShowModal;
        finally
          FreeAndNil(frmProcura_Produto);
        end;
    end;

    if Key = VK_F7 then
    begin
        try
          frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
          frmProcura_Fornecedor.ShowModal;
        finally
          FreeAndNil(frmProcura_Fornecedor);
        end;
    end;

    if Key = VK_F8 then
    begin
         try
           frmProcura_Grupo := TfrmProcura_Grupo.Create(self);
           frmProcura_Grupo.ShowModal;
         finally
           FreeAndNil(frmProcura_Grupo);
         end;
    end;
end;

procedure TfrmCadProduto.mmAplicacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    key := 0;
end;

procedure TfrmCadProduto.Gravar(Parametro: string);
begin
     //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (VerificaCampos) then
         begin
             try
                  dm.qryProduto.Close;
                  dm.qryProduto.SQL.Clear;
                  dm.qryProduto.SQL.Add('INSERT INTO PRODUTO (COD_PROD, DESC_PROD, COD_GRUPO, ESTOQUE_MINIMO, UND, APLICACAO)'+
                  '                                    VALUES(:cod_prod, :desc, :cod_grupo, :estoque_m, :und, :aplicacao)');
                  dm.qryProduto.Params.ParamByName('cod_prod').AsString   := edtCodigo.Text;
                  dm.qryProduto.Params.ParamByName('desc').AsString       := edtDesc.Text;
                  dm.qryProduto.Params.ParamByName('cod_grupo').AsString  := edtGrupo.Text;
                  dm.qryProduto.Params.ParamByName('estoque_m').AsInteger := StrToInt(edtEstoque_Min.Text);
                  dm.qryProduto.Params.ParamByName('und').AsString        := edtUnd.Text;
                  dm.qryProduto.Params.ParamByName('aplicacao').AsString  := mmAplicacao.Lines.Text;
                  dm.qryProduto.ExecSQL();
                  LimpaCAmpos();
                  grpProduto.Enabled := False;
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
                  dm.qryProduto.Close;
                  dm.qryProduto.SQL.Clear;
                  dm.qryProduto.SQL.Add('UPDATE PRODUTO SET '+
                  'COD_PROD=:cod_prod, DESC_PROD=:desc,COD_GRUPO=:cod_grupo ,ESTOQUE_MINIMO=:estoque_m ,UND=:und, APLICACAO=:aplicacao '+
                  'WHERE COD_PROD=:cod_prod');
                  dm.qryProduto.Params.ParamByName('cod_prod').AsString   := edtCodigo.Text;
                  dm.qryProduto.Params.ParamByName('desc').AsString       := edtDesc.Text;
                  dm.qryProduto.Params.ParamByName('cod_grupo').AsString  := edtGrupo.Text;
                  dm.qryProduto.Params.ParamByName('estoque_m').AsInteger := StrToInt(edtEstoque_Min.Text);
                  dm.qryProduto.Params.ParamByName('und').AsString        := edtUnd.Text;
                  dm.qryProduto.Params.ParamByName('aplicacao').AsString  := mmAplicacao.Lines.Text;
                  dm.qryProduto.ExecSQL();
                  grpProduto.Enabled := False;
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadProduto.Incluir;
begin
     //Procedimento de Inclusão de um novo produto
     inherited;
     Param                      := 'I';
     grpProduto.Enabled         := True;
     pgCadastro.ActivePageIndex := 0;
     edtCodigo.SetFocus;
     LimpaCampos();
end;

function TfrmCadProduto.VerificaCampos: Boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtCodigo.Text <> '')  and (edtDesc.Text <> '') then
     begin
        Result := True;
     end
     else
     begin
        Result := False;
        Application.MessageBox('Existem campos de preenchimento obrigatório não preenchidos!', 'Erro', MB_OK)
     end;
end;

end.
