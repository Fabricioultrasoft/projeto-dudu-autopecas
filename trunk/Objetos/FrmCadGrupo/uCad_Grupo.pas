unit uCad_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids, uFormBase;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure Incluir;                     override;
    procedure Gravar(Parametro: string);   override;
    procedure Editar;                      override;
    procedure Excluir;                     override;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupo: TfrmCadGrupo;

implementation

uses uDm;

{$R *.dfm}

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
    Gravar(Param);
end;

procedure TfrmCadGrupo.Editar;
begin
    //Procedimento de Edição de registro
    inherited;
    Param                      := 'U';
    grpGrupo.Enabled           := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
end;

procedure TfrmCadGrupo.Excluir;
begin
    //Procedimento de Exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryGrupo.Close;
            dm.qryGrupo.SQL.Clear;
            dm.qryGrupo.SQL.Add('DELETE FROM GRUPO WHERE COD_GRUPO = :codigo');
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

procedure TfrmCadGrupo.Gravar(Parametro: string);
begin
     //Procedimento de gravação

     //Verifica se é operação de Inclusão
     if (Parametro = 'I') then
     begin
         if (edtDescricao.Text <> '') then
         begin
             try
                  dm.qryGrupo.Close;
                  dm.qryGrupo.SQL.Clear;
                  dm.qryGrupo.SQL.Add('INSERT INTO GRUPO (DESC_GRUPO)VALUES(:grupo)');
                  dm.qryGrupo.Params.ParamByName('grupo').AsString := edtDescricao.Text;
                  dm.qryGrupo.ExecSQL();
                  LimpaCampos();
                  grpGrupo.Enabled := False;
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
                  dm.qryGrupo.Close;
                  dm.qryGrupo.SQL.Clear;
                  dm.qryGrupo.SQL.Add('UPDATE GRUPO SET DESC_GRUPO=:grupo WHERE COD_GRUPO=:codigo');
                  dm.qryGrupo.Params.ParamByName('codigo').AsString := edtCodigo.Text;
                  dm.qryGrupo.Params.ParamByName('grupo').AsString := edtDescricao.Text;
                  dm.qryGrupo.ExecSQL();
                  grpGrupo.Enabled := False;
                  LimpaCampos();
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmCadGrupo.Incluir;
begin
    //Procedimento de Inclusão de registro
    inherited;
    Param                      := 'I';
    grpGrupo.Enabled           := True;
    pgCadastro.ActivePageIndex := 0;
    edtDescricao.SetFocus;
    LimpaCampos();
end;


end.
