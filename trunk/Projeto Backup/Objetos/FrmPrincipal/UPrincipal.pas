unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExStdCtrls, JvEdit, Mask, JvExMask, JvToolEdit,
  IBServices, ImgList, JvgPage, JvExComCtrls, JvAnimate, ShellAnimations, UConexao,
  DB, SqlExpr, DBXFirebird;

type
  TfrmPrincipal = class(TForm)
    lblStatus: TLabel;
    ilimglist: TImageList;
    BalloonHint: TBalloonHint;
    ShellResources1: TShellResources;
    JvgPageControl1: TJvgPageControl;
    tsBackup: TTabSheet;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtDestino: TJvDirectoryEdit;
    btnExecutar: TButton;
    btnFechar: TButton;
    edtOrigem: TJvFilenameEdit;
    animate: TAnimate;
    tsRestore: TTabSheet;
    grp2: TGroupBox;
    lbl3: TLabel;
    edtOrigemfbk: TJvFilenameEdit;
    lbl4: TLabel;
    edtDestinoFDB: TJvDirectoryEdit;
    animateRestore: TAnimate;
    btnExecutarRestore: TButton;
    btn2: TButton;
    Conexao: TSQLConnection;
    procedure btnFecharClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure btnExecutarRestoreClick(Sender: TObject);
    procedure ExecutarBackup(Origem, Destino: string);
    procedure ExecutarRestore(Origem, Destino: string);
    procedure FormCreate(Sender: TObject);
  private
    procedure EstadoControles(Param: string);
  public
    FDatabase: string;
    FHostname: string;
    FUsuario : string;
    FSenha   : string;
  end;

var
  frmPrincipal: TfrmPrincipal;
  conn : TConexao;

implementation

uses UBackup;

{$R *.dfm}

procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
begin
     if edtDestino.Text <> '' then
        ExecutarBackup(edtOrigem.Text, edtDestino.Text)
     else
       ShowMessage('É necessário informar um destino para os arquivos!');
end;

procedure TfrmPrincipal.btnExecutarRestoreClick(Sender: TObject);
begin
    MessageDlg('Antes de iniciar a restauração feche o sistema em todas as estações da rede!', mtWarning, [mbok], 0);
    if edtOrigemfbk.Text <> '' then
        ExecutarRestore(edtOrigemfbk.Text, edtDestinoFDB.Text)
     else
       ShowMessage('É necessário informar o arquivo .fbk de origem!');
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.EstadoControles(Param: string);
begin
    if Param = 'A' then
    begin
         lblStatus.Visible      := false;
         btnExecutar.Enabled    := true;
         btnExecutarRestore.Enabled := true;
         Screen.Cursor          := crDefault;
         animate.Visible        := false;
         animate.Active         := false;
         animateRestore.Visible := false;
         animateRestore.Active  := false;
    end
    else
    begin
        if Param = 'D' then
        begin
             lblStatus.Visible      := true;
             btnExecutar.Enabled    := false;
             btnExecutarRestore.Enabled := false;
             Screen.Cursor          := crHourGlass;
             animate.Visible        := True;
             animate.Active         := True;
             animateRestore.Visible := true;
             animateRestore.Active  := true;
        end;
    end;
end;

procedure TfrmPrincipal.ExecutarBackup(Origem, Destino: string);
var
   FBackup: TIBBackupService;
   DiretorioDestino : string;
begin
    ShowMessage('Será criado uma pasta no destino com o nome "Backup" contendo 2 arquivos:'#10#13'1 - Backup arquivo da Base de dados (.FDB);'#10#13'2 - Backup de arquivo (.fbk);'#13#10);
    EstadoControles('D');

    FBackup := TIBBackupService.Create(self);
    with FBackup do
    begin
       Active := false;
       ServerName := Self.FHostname;
       Protocol := Local;
       LoginPrompt := False;
       Params.Clear;
       Params.Add('user_name=' + Self.FUsuario);
       Params.Add('password=' + Self.FSenha);

       try
           Active := True;
       except
          on E: Exception do
          begin
             EstadoControles('A');
             MessageDlg('Erro ao executar backup:'#13#10'Erro: ' + E.message, mtError, [mbok], 0);
             Exit;
          end;
       end;

       Origem  := trim(StringReplace(Origem, '"', '', [rfReplaceAll])) ;

       Try
           Verbose := True;
           Options := [NonTransportable];
           DatabaseName := Origem ;
           DiretorioDestino := Destino + '\Backup ' + FormatDateTime('dd-MM-YY', now);

           if not DirectoryExists(DiretorioDestino) then
              ForceDirectories(DiretorioDestino);

           BackupFile.Clear;
           BackupFile.Add(DiretorioDestino + '\Backup ' + FormatDateTime('dd-MM-YY', now) + '.fbk');
           ServiceStart;

           lblStatus.Caption := 'Iniciando Backup: arquivo fbk ...';
           while not Eof do
           begin
             Sleep(50);
             Refresh;
             lblStatus.Caption := GetNextLine;
             Application.ProcessMessages;
           end;

           lblStatus.Caption := 'Finalizando Backup: arquivo fbk ...';
           Application.ProcessMessages;
           Sleep(100);
           Refresh;

           Destino := DiretorioDestino + '\Backup ' + FormatDateTime('dd-MM-YY', now) + '.FDB' ;
           if FileExists(Destino) then
              DeleteFile(Destino);

           if CopyFile(PChar(Origem), PChar(Destino), true) then
           begin
                lblStatus.Caption := 'Backup do arquivo FDB executado com sucesso ...';
                Application.ProcessMessages;
                Sleep(100);
                Refresh;
                EstadoControles('A');
                MessageDlg('Backup executado com sucesso!'#13#10 +
                           'Foram criados 2 arquivos:'#13#10 +
                           '1 - Backup '+ FormatDateTime('dd-MM-YY', now) + '.fbk'#13#10 +
                           '2 - Backup '+ FormatDateTime('dd-MM-YY', now) + '.FDB', mtInformation, [mbOK], 0);
           end
           else
           begin
                lblStatus.Font.Color := clRed;
                lblStatus.Caption := 'Erro ao copiar arquivo FDB ...';
                Application.ProcessMessages;
                Sleep(100);
                Refresh;
                EstadoControles('A');
           end;

       except
           on E: Exception do
           begin
              EstadoControles('A');
              MessageDlg('Erro ao executar backup:'#13#10'Erro: ' + E.message, mtError, [mbok], 0);
              Exit;
           end;
       end;
    end;
end;

procedure TfrmPrincipal.ExecutarRestore(Origem, Destino: string);
var
  FRestore: TIBRestoreService;
begin
    FRestore := TIBRestoreService.Create(self);
    EstadoControles('D');
     try
         with FRestore do
         begin
             Active := false;
             LoginPrompt := False;
             Params.Clear;
             Params.Add('user_name=' + Self.FUsuario);
             Params.Add('password=' + Self.FSenha);

             try
               Active := True;
             except
               on E: Exception do
               begin
                 EstadoControles('A');
                 MessageDlg('Erro ao executar backup.' + #13 + 'Erro: ' + E.Message, mtError, [mbok], 0);
               end;
             end;

             Origem  := trim(StringReplace(Origem, '"', '', [rfReplaceAll])) ;
             Destino := trim(StringReplace(Destino, '"', '', [rfReplaceAll])) ;
             Verbose := True;
             Options := [Replace, UseAllSpace];
             databasename.add(Destino);
             BackupFile.Clear;
             backupfile.add(Origem);
             active := true;
             servicestart;

             lblStatus.Caption := 'Iniciando Restauração: arquivo fbk ...';
             while not Eof do
             begin
               Sleep(100);
               Refresh;
               lblStatus.Caption := GetNextLine;
               Application.ProcessMessages;
             end;

             if FileExists(Destino) and (conn.getStatusConexao(Conexao)) then
             begin
                EstadoControles('A');
                MessageDlg('Restauração executada com sucesso!', mtInformation, [mbok], 0);
             end;
         end;

     except
         on E: Exception do
         begin
           EstadoControles('A');
           MessageDlg('Erro ao executar backup.' + #13 + 'Erro: ' + E.Message, mtError, [mbok], 0);
         end;
     end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     try
        conn := TConexao.Create(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini', 'Conexao');
        conn.LeINI;
        Self.FDatabase := conn.Banco;
        Self.FHostname := conn.Hostname;
        Self.FUsuario  := conn.Usuario;
        Self.FSenha    := conn.Senha;
        edtDestinoFDB.Text := FDatabase;
        edtOrigem.Text := FDatabase;
     except
         on E: Exception do
         begin
           MessageDlg('Erro ao carregar parâmetros: ' + #13 + 'Erro: ' + E.Message, mtError, [mbok], 0);
         end;
     end;
end;

end.
