unit ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, uFormBase, DBXCommon, DBXDBReaders,
  jpeg, SqlExpr, JvExStdCtrls, JvButton, JvCtrls, ImgList;

type
  TfrmLogin = class(TFormBase)
    pnl1: TPanel;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblHora: TLabel;
    lblData: TLabel;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    cmbPrivilegio: TComboBox;
    pnl2: TPanel;
    imgLogin: TImage;
    lblVersao: TLabel;
    lblReleaase: TLabel;
    lbl8: TLabel;
    lblTitulo: TLabel;
    Progresso: TProgressBar;
    img1: TImageList;
    btnOK: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Autentica: Boolean;
    procedure CarregaProgresso();
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure JvImgBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDm, uMenu, UdmConexao;

{$R *.dfm}

function GetBuildInfo:string;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1, V2, V3, V4: Word;
    Prog,ultimo : string;
begin
    Prog := Application.Exename;
    VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    with VerValue^ do
    begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    ultimo := Copy ('100' + IntToStr(v4), 4, 2);

    result := Copy ('100'+IntToStr (v1), 4, 2) + '.' +
              Copy ('100'+IntToStr (v2), 4, 2) + '.' +
              Copy ('100'+IntToStr (v3), 4, 2) + '.' +
              Copy ('100'+IntToStr (v4), 4, 2);
end;

function TfrmLogin.Autentica: Boolean;
var
   qry: TSQLQuery;
   sql : string;
begin
     //Function de verificação se existe cadastro do usuário no banco de dados
     try
         Result := false;
         qry := TSQLQuery.Create(nil);
         qry.SQLConnection := dmConexao.Conexao;

         SQL  := 'SELECT COD_USER,  DESC_USUARIO, NOME, PRIVILEGIO FROM USUARIO ' +
                         'WHERE DESC_USUARIO = :user AND PRIVILEGIO = :privilegio AND SENHA = :senha';

         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(SQL);
         qry.ParamByName('user').AsString        := edtUsuario.Text;
         qry.ParamByName('privilegio').AsString := cmbPrivilegio.Text;
         qry.ParamByName('senha').AsString      := edtSenha.Text;
         qry.Open;

         if not qry.IsEmpty then
         begin
            frmMenu.FCodUser    := qry.Fields[0].AsString;
            frmMenu.FUser       := qry.Fields[1].AsString;
            frmMenu.FNomeUser   := qry.Fields[2].AsString;
            frmMenu.FPrivilegio := qry.Fields[3].AsString;
            Result := True;
         end
         else
            MessageDlg('Dados incorretos, digite novamente!', mtError, [mbOK], 0);

     except
         on E:Exception do
         MessageDlg('Erro ao valida dados no banco de dados, ' + E.Message, mtError, [mbOK], 0);
     end;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
    //Verifica se é primeiro login ou troca de usuário
    if frmMenu.Visible then
       Close
    else
      Application.Terminate;
end;

procedure TfrmLogin.btnOKClick(Sender: TObject);
begin
    //Chama a function de autenticação
    if not Autentica then
    begin
       LimpaCampos;
       edtUsuario.SetFocus;
    end
    else
    begin
       CarregaProgresso;
       frmMenu.stbStatus.Panels[1].Text := frmMenu.FUser;
       frmMenu.stbStatus.Panels[3].Text := frmMenu.FPrivilegio;
       frmLogin.Close;
    end;
end;

procedure TfrmLogin.CarregaProgresso;
begin
     //Carrega a barra de progresso
     Progresso.Position := 0;
     Progresso.Max      := 100;
     Progresso.Visible  := true;
     while Progresso.Position < 100 do
     begin
         Progresso.StepBy(20);
         frmLogin.Update;
         Sleep(100);
     end;
     Progresso.Visible  := false;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       btnOK.Click;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
    frmLogin := nil;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
    frmLogin.Caption := 'Login :- '+ Application.Title;
    lblTitulo.Caption:= Application.Title;
    lblHora.Caption := FormatDateTime('hh:mm', Time);
    lblData.Caption := FormatDateTime('dd/mm/yyyy', Now);
    lblReleaase.Caption := GetBuildInfo;

    //Verifica se existe imagem de logo para form
    if FileExists(ExtractFilePath(Application.ExeName) + 'Imagens\Logo.jpg') then
    begin
      imgLogin.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Imagens\Logo.jpg');
    end;

    //Carrega os itens(Privilegios) do combobox com o retorno da função da unit Udm
    cmbPrivilegio.Items.AddStrings(dm.CarregaPrivilegio);
end;


procedure TfrmLogin.JvImgBtn1Click(Sender: TObject);
begin
    //Chama a function de autenticação
    if not Autentica then
    begin
       LimpaCampos;
       edtUsuario.SetFocus;
    end
    else
    begin
       CarregaProgresso;
       frmMenu.stbStatus.Panels[1].Text := frmMenu.FUser;
       frmMenu.stbStatus.Panels[3].Text := frmMenu.FPrivilegio;
       frmLogin.Close;
    end;
end;

procedure TfrmLogin.JvImgBtn2Click(Sender: TObject);
begin
    //Verifica se é primeiro login ou troca de usuário
    if frmMenu.Visible then
       Close
    else
      Application.Terminate;
end;

end.
