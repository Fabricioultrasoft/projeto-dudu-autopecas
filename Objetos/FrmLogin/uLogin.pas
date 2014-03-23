unit ulogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, uFormBase, DBXCommon, DBXDBReaders;

type
  TfrmLogin = class(TFormBase)
    Panel1: TPanel;
    imgLogin: TImage;
    lblVersao: TLabel;
    lblReleaase: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblTitulo: TLabel;
    Label6: TLabel;
    lblHora: TLabel;
    lblData: TLabel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Progresso: TProgressBar;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    cmbPrivilegio: TComboBox;
    btnCancelar: TBitBtn;
    btnOK: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Autentica: Boolean;
    procedure CarregaProgresso();
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDm, uMenu;

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
   conexao: TDBXConnection;
   comand : TDBXCommand;
   reader : TDBXReader;
begin
     //Function de verificação se existe cadastro do usuário no banco de dados
     try
         Result := false;

         conexao      := TDBXConnectionFactory.GetConnectionFactory.GetConnection('FBCONN_DUDU', 'SYSDBA', 'masterkey');
         comand       := conexao.CreateCommand;
         comand.Text  := 'SELECT DESC_USUARIO, PRIVILEGIO, SENHA FROM USUARIO ' +
                         'WHERE DESC_USUARIO = ? AND PRIVILEGIO = ? AND SENHA = ?';
         comand.Prepare;
         comand.Parameters.Parameter[0].Value.SetWideString(edtUsuario.Text);
         comand.Parameters.Parameter[1].Value.SetWideString(cmbPrivilegio.Text);
         comand.Parameters.Parameter[2].Value.SetWideString(edtSenha.Text);
         reader       := comand.ExecuteQuery;

         if reader.Next then
            Result := true;
     finally
         FreeAndNil(conexao);
         FreeAndNil(comand);
         FreeAndNil(reader);
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
       Application.MessageBox('Erro na tentativa de logar no Sistema!', 'Erro', MB_OK);
       LimpaCampos;
    end
    else
    begin
       CarregaProgresso;
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
         Progresso.StepBy(10);
         frmLogin.Update;
         Sleep(300);
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
    if FileExists(ExtractFilePath(Application.ExeName) + 'Imagens\ImgLogo.jpg') then
    begin
      imgLogin.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Imagens\ImgLogo.jpg');
    end;

    //Carrega os itens(Privilegios) do combobox com o retorno da função da unit Udm
    cmbPrivilegio.Items.AddStrings(dm.CarregaPrivilegio);
end;


end.
