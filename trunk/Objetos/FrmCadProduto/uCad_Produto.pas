unit uCad_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
 uFormBase, SqlExpr, DBCtrls, ACBrBase, ACBrEnterTab, Mask, JvExMask,
  JvToolEdit, JvBaseEdits, ACBrBarCode;

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
    edtCodigo: TEdit;
    edtDesc: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    edtEAN13: TEdit;
    cmbUnd: TComboBox;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtDUN14: TEdit;
    Label7: TLabel;
    edtNcm: TEdit;
    Label8: TLabel;
    edtTipo: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtLocalEstoque: TEdit;
    edtSecao: TEdit;
    ACBrEnterTab1: TACBrEnterTab;
    edtEstoque: TJvCalcEdit;
    edtGrupo: TJvComboEdit;
    btnCancelar: TBitBtn;
    edtDescricaoGrupo: TEdit;
    BitBtn1: TBitBtn;
    ACBrBarCode: TACBrBarCode;
    Label18: TLabel;
    btnAdicionarGrupo: TBitBtn;
    lblStatusOperacao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Incluir();                  override;
    procedure Editar();                   override;
    procedure Cancelar();                   override;
    procedure Gravar(Operacao: TOperacao);  override;
    procedure Excluir();                  override;
    procedure CarregaCampos();
    function VerificaCampos: Boolean;
    function VerificaDuplicidade(EAN13: string): Boolean;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnProc_GrupoClick(Sender: TObject);
    procedure mmAplicacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edtGrupoButtonClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    function GerarCodigoBarra(): string;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtEAN13Change(Sender: TObject);
    procedure btnAdicionarGrupoClick(Sender: TObject);
    procedure edtGrupoExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CarregaDescGrupo(Codigo: string);
  end;

var
  frmCadProduto: TfrmCadProduto;

const
  // Instrução SQL para INSERT
  INSERT: string = 'INSERT INTO PRODUTO (DESC_PROD, COD_GRUPO, ESTOQUE_MINIMO, UND_VENDA, EAN13, DUN14, CODIGO_NCM, TIPO_PROD, LOCAL_ESTOQUE, SECAO)'+
                                 'VALUES(:desc, :cod_grupo, :estoque_m, :und, :ean13, :dun14, :ncm, :tipo, :local, :secao)';

  // Instrução SQL para EDIÇÃO, o nome UPDATE dá conflito com o método Update nativo da unit Controls
  EDICAO: string = 'UPDATE PRODUTO SET '+
                   'DESC_PROD=:desc,COD_GRUPO=:cod_grupo ,ESTOQUE_MINIMO=:estoque_m ,UND_VENDA=:und, EAN13=:ean13, DUN14=:dun14, CODIGO_NCM=:ncm, TIPO_PROD=:tipo, LOCAL_ESTOQUE=:local, SECAO=:secao '+
                   'WHERE COD_PROD=:cod_prod';

  // Instrução SQL para DELETE
  DELETE: string = 'DELETE FROM PRODUTO WHERE COD_PROD = :codigo';

  // Instrução SQL para verificação de Duplicidade
  SQLVERIF: string  = 'SELECT DESC_PROD FROM PRODUTO WHERE EAN13 = :ean13';

  // Instrução SQL para carregar a descrição do grupo
  SQLDESC_FORN : string = 'SELECT DESC_GRUPO FROM GRUPO WHERE COD_GRUPO = :cod';


implementation

uses uDm, uProcura_Fornecedor, uCad_Grupo, uProcura_Grupo, uProcura_Produto, uRelatorio,
  uCalcula_Perc, UdmConexao;

{$R *.dfm}

procedure TfrmCadProduto.BitBtn1Click(Sender: TObject);
begin
    edtEAN13.Text := GerarCodigoBarra;
end;

procedure TfrmCadProduto.btnAdicionarGrupoClick(Sender: TObject);
begin
    try
        frmCadGrupo := TfrmCadGrupo.Create(nil);
        frmCadGrupo.ShowModal;
    finally
        FreeAndNil(frmCadGrupo);
    end;
end;

procedure TfrmCadProduto.btnCancelarClick(Sender: TObject);
begin
    Cancelar();
end;

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
    Gravar(FOperacao);
end;

procedure TfrmCadProduto.Cancelar;
begin
  inherited;
  grpProduto.Enabled  := false;
end;

procedure TfrmCadProduto.CarregaCampos;
begin
      //
end;

procedure TfrmCadProduto.CarregaDescGrupo(Codigo: string);
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
                edtDescricaoGrupo.Text := qry.Fields[0].AsString
             else
             begin
                 MessageDlg('Grupo não encontrado!', mtError, [mbOK], 0);
                 edtGrupo.SetFocus;
             end;
         except
            on E:Exception do
            ShowMessage('Erro ao procurar grupo !'#13#10 + E.Message);
         end;
    end;
end;

procedure TfrmCadProduto.Editar;
begin
     //Procedimento de edição
     inherited;
     setOperacao(opUpdate);
     grpProduto.Enabled         := True;
     pgCadastro.ActivePageIndex := 0;
     edtDesc.SetFocus;
end;

procedure TfrmCadProduto.Excluir;
begin
     //Procedimento de exclusão do produto
     try
          if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
          begin
              dm.qryProduto.Close;
              dm.qryProduto.SQL.Clear;
              dm.qryProduto.SQL.Add(DELETE);
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

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
    cmbUnd.Items.AddStrings(dm.CarregaUnidadeMedida);
end;

procedure TfrmCadProduto.KeyDown(var Key: Word; Shift: TShiftState);
begin
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

function TfrmCadProduto.GerarCodigoBarra: string;
var
   fixo, sequencia, generator, digitos : string;
   qryCodigo: TSQLQuery;

    function EAN13(Codigo : String) : String;
    var nX    : Integer;
       nPeso  : Integer;
       nSoma  : Double;
       nMaior  : Double;
       nDigito : Integer;
    begin
        nPeso := 3;
        nSoma := 0;

        For nX := 12 DownTo 1 do
        begin
           nSoma := nSoma + StrToInt(Codigo[nX]) * nPeso;
           if nPeso = 3 then
               nPeso := 1
           else
               nPeso := 3;
        end;

        nMaior      := (( Trunc( nSoma / 10 ) + 1 ) * 10);
        nDigito  := Trunc(nMaior) - Trunc(nSoma);
        If nDigito = 10 Then
             nDigito := 0;

        Result := IntToStr(nDigito);
    end;
begin
     fixo := '111';
     sequencia := '001';

     try
        try
            qryCodigo := TSQLQuery.Create(nil);
            qryCodigo.SQLConnection := dmConexao.Conexao;

            qryCodigo.Close;
            qryCodigo.SQL.Clear;
            qryCodigo.SQL.Add('SELECT GEN_ID(gen_produto_id, 0)+1 FROM rdb$database');
            qryCodigo.Open;

            generator := FormatFloat('000000', qryCodigo.Fields[0].Value);
            digitos   := fixo+generator+sequencia;
            Result    := digitos + EAN13(fixo+generator+sequencia);
        except
            on E:Exception do
            ShowMessage('Erro gerar Código de Barra!'#13#10 + E.Message);
        end;
    finally
        FreeAndNil(qryCodigo);
    end;

end;

procedure TfrmCadProduto.Gravar(Operacao: TOperacao);
begin
     //Verifica se os campos obrigatórios foram preenchidos
     if (self.VerificaCampos()) then
     begin
         //Verifica se é operação de Inclusão e existe duplicidade de registros no banco
         if (Operacao = opInsert) and (self.VerificaDuplicidade(edtEAN13.Text)) then
         begin
               try
                    dm.qryProduto.Close;
                    dm.qryProduto.SQL.Clear;
                    dm.qryProduto.SQL.Add(INSERT);
                    dm.qryProduto.Params.ParamByName('desc').AsString       := edtDesc.Text;
                    dm.qryProduto.Params.ParamByName('cod_grupo').AsString  := edtGrupo.Text;
                    dm.qryProduto.Params.ParamByName('estoque_m').Value     := edtEstoque.Value;
                    dm.qryProduto.Params.ParamByName('und').AsString        := cmbUnd.Text;
                    dm.qryProduto.Params.ParamByName('ean13').AsString      := edtEAN13.Text;
                    dm.qryProduto.Params.ParamByName('dun14').AsString      := edtDUN14.Text;
                    dm.qryProduto.Params.ParamByName('ncm').AsString        := edtNcm.Text;
                    dm.qryProduto.Params.ParamByName('tipo').AsString       := edtTipo.Text;
                    dm.qryProduto.Params.ParamByName('local').AsString      := edtLocalEstoque.Text;
                    dm.qryProduto.Params.ParamByName('secao').AsString      := edtSecao.Text;
                    dm.qryProduto.ExecSQL();
                    LimpaCAmpos();
                    grpProduto.Enabled := False;
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
                      dm.qryProduto.Close;
                      dm.qryProduto.SQL.Clear;
                      dm.qryProduto.SQL.Add(EDICAO);
                      dm.qryProduto.Params.ParamByName('desc').AsString       := edtDesc.Text;
                      dm.qryProduto.Params.ParamByName('cod_grupo').AsString  := edtGrupo.Text;
                      dm.qryProduto.Params.ParamByName('estoque_m').Value     := edtEstoque.Value;
                      dm.qryProduto.Params.ParamByName('und').AsString        := cmbUnd.Text;
                      dm.qryProduto.Params.ParamByName('ean13').AsString      := edtEAN13.Text;
                      dm.qryProduto.Params.ParamByName('dun14').AsString      := edtDUN14.Text;
                      dm.qryProduto.Params.ParamByName('ncm').AsString        := edtNcm.Text;
                      dm.qryProduto.Params.ParamByName('tipo').AsString       := edtTipo.Text;
                      dm.qryProduto.Params.ParamByName('cod_prod').AsString   := edtCodigo.Text;
                      dm.qryProduto.Params.ParamByName('local').AsString      := edtLocalEstoque.Text;
                      dm.qryProduto.Params.ParamByName('secao').AsString      := edtSecao.Text;
                      dm.qryProduto.ExecSQL();
                      LimpaCAmpos();
                      grpProduto.Enabled := False;
                      setOperacao(opNone);
                  except
                      on E:Exception do
                      ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
                  end;
              end;
         end;
     end;
end;

procedure TfrmCadProduto.Incluir;
begin
     //Procedimento de Inclusão de um novo produto
     inherited;
     setOperacao(opInsert);
     grpProduto.Enabled         := True;
     pgCadastro.ActivePageIndex := 0;
     LimpaCampos();
     edtDesc.SetFocus;
end;

procedure TfrmCadProduto.edtEAN13Change(Sender: TObject);
begin
    if Length(edtEAN13.Text) = 13 then
       ACBrBarCode.Text:= edtEAN13.Text;
end;

procedure TfrmCadProduto.edtGrupoButtonClick(Sender: TObject);
begin
     //Carrega o form para procura de grupos
     try
       frmProcura_Grupo := TfrmProcura_Grupo.Create(self);
       frmProcura_Grupo.ShowModal;
     finally
       FreeAndNil(frmProcura_Grupo);
     end;
end;

procedure TfrmCadProduto.edtGrupoExit(Sender: TObject);
begin
    CarregaDescGrupo(edtGrupo.Text);
end;

function TfrmCadProduto.VerificaCampos: Boolean;
begin
     //Verifica se existem campos obrigatórios sem preenchimento
     if (edtEAN13.Text <> '') and (edtDesc.Text <> '') and (edtEstoque.Value <> 0) and (edtGrupo.Text <> '') and (cmbUnd.Text <> '') then
     begin
        if Length(edtEAN13.Text) = 13 then
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

function TfrmCadProduto.VerificaDuplicidade(EAN13: string): Boolean;
var
   qryVerif: TSQLQuery;
begin
    try
        qryVerif := TSQLQuery.Create(nil);
        qryVerif.SQLConnection := dmConexao.Conexao;

        qryVerif.Close;
        qryVerif.SQL.Clear;
        qryVerif.SQL.Add(SQLVERIF);
        qryVerif.ParamByName('ean13').AsString := EAN13;
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Código de barra já cadastrado com essa descrição: ' + qryVerif.Fields[0].AsString , mtError, [mbOK], 0);
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
