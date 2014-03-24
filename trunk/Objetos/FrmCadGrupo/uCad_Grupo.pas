unit uCad_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, uFormBase, SqlExpr;

type
  TfrmCadGrupo = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    grpGrupo: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    lbl2: TLabel;
    edtCodigo: TEdit;
    Label15: TLabel;
    Label5: TLabel;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure Incluir;                     override;
    procedure Gravar(Operacao: TOperacao);   override;
    procedure Editar;                      override;
    procedure Cancelar();                      override;
    procedure Excluir;                     override;
    function VerificaDuplicidade(Descricao:string): Boolean;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupo: TfrmCadGrupo;

const
  // Instru��o SQL para INSERT
  INSERT: string = 'INSERT INTO GRUPO (DESC_GRUPO)VALUES(:grupo)';

  // Instru��o SQL para EDI��O, o nome UPDATE d� conflito com o m�todo Update nativo da unit Controls
  EDICAO: string = 'UPDATE GRUPO SET DESC_GRUPO=:grupo WHERE COD_GRUPO=:codigo';

  // Instru��o SQL para DELETE
  DELETE: string = 'DELETE FROM GRUPO WHERE COD_GRUPO = :codigo';

  // Instru��o SQL para verifica��o de Duplicidade
  SQLVERIF: string  = 'SELECT DESC_GRUPO FROM GRUPO WHERE DESC_GRUPO = :desc';


implementation

uses uDm, UdmConexao;

{$R *.dfm}

procedure TfrmCadGrupo.btnCancelarClick(Sender: TObject);
begin
    Cancelar();
end;

procedure TfrmCadGrupo.btnEditarClick(Sender: TObject);
begin
    Editar();
end;

procedure TfrmCadGrupo.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmCadGrupo.btnIncluirClick(Sender: TObject);
begin
     Incluir();
end;

procedure TfrmCadGrupo.btnSairClick(Sender: TObject);
begin
    frmCadGrupo.Close;
end;

procedure TfrmCadGrupo.btnSalvarClick(Sender: TObject);
begin
    Gravar(FOperacao);
end;

procedure TfrmCadGrupo.Cancelar;
begin
  inherited;
   grpGrupo.Enabled := false;
end;

procedure TfrmCadGrupo.Editar;
begin
    //Procedimento de Edi��o de registro
    inherited;
    setOperacao(opUpdate);
    grpGrupo.Enabled           := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
end;

procedure TfrmCadGrupo.Excluir;
begin
    //Procedimento de Exclus�o de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirma��o', MB_YESNO)= mrYes then
        begin
            dm.qryGrupo.Close;
            dm.qryGrupo.SQL.Clear;
            dm.qryGrupo.SQL.Add(DELETE);
            dm.qryGrupo.ParamByName('codigo').AsString := edtCodigo.Text;
            dm.qryGrupo.ExecSQL();
            LimpaCampos();
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmCadGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    dm.cdsAgenda.Close;
    Action      := caFree;
    frmCadGrupo := nil;
end;

procedure TfrmCadGrupo.Gravar(Operacao: TOperacao);
begin
     //Procedimento de grava��o

     //Verifica se � opera��o de Inclus�o
     if (Operacao = opInsert) then
     begin
         if (edtDescricao.Text <> '') and (VerificaDuplicidade(edtDescricao.Text)) then
         begin
             try
                  dm.qryGrupo.Close;
                  dm.qryGrupo.SQL.Clear;
                  dm.qryGrupo.SQL.Add(INSERT);
                  dm.qryGrupo.Params.ParamByName('grupo').AsString := edtDescricao.Text;
                  dm.qryGrupo.ExecSQL();
                  LimpaCampos();
                  grpGrupo.Enabled := False;
                  setOperacao(opNone);
             except
                  on E:Exception do
                  ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
             end;
         end
         else
         begin
             MessageDlg('Existem campos obrigat�rios(*) sem preenchimento!', mtError, [mbOK], 0);
             Abort;
         end;
     end
     else
     begin
          //Verifica se � opera��o de Update
          if (Operacao = opUpdate) then
          begin
              try
                  dm.qryGrupo.Close;
                  dm.qryGrupo.SQL.Clear;
                  dm.qryGrupo.SQL.Add(EDICAO);
                  dm.qryGrupo.Params.ParamByName('codigo').AsString := edtCodigo.Text;
                  dm.qryGrupo.Params.ParamByName('grupo').AsString := edtDescricao.Text;
                  dm.qryGrupo.ExecSQL();
                  grpGrupo.Enabled := False;
                  LimpaCampos();
                  setOperacao(opNone);
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
end;

procedure TfrmCadGrupo.Incluir;
begin
    //Procedimento de Inclus�o de registro
    inherited;
    setOperacao(opInsert);
    grpGrupo.Enabled           := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
    LimpaCampos();
end;


function TfrmCadGrupo.VerificaDuplicidade(Descricao: string): Boolean;
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
        qryVerif.Open;

        if not qryVerif.IsEmpty then
        begin
            MessageDlg('Grupo j� cadastrado com essa descri��o: ' + qryVerif.Fields[0].AsString , mtError, [mbOK], 0);
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