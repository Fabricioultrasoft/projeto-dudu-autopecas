unit uBackupRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAnimations, ComCtrls, JvToolEdit, StdCtrls, Mask, JvExMask,
  Buttons, ExtCtrls, IBServices, UConexao, StrUtils;

type
  TfrmBackupRestore = class(TForm)
    pgcBackupRestore: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    pnl3: TPanel;
    btnFechar: TBitBtn;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtDestino: TJvDirectoryEdit;
    edtOrigem: TJvFilenameEdit;
    animate: TAnimate;
    grp2: TGroupBox;
    ShellResources1: TShellResources;
    BalloonHint: TBalloonHint;
    btnExecutar: TBitBtn;
    lblStatus: TLabel;
    mmo1: TMemo;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ExecutarBackup(Origem, Destino: string);
    procedure EstadoControles(Param: string);
    function CortarString(Texto: string):string;
  public
    FDatabase: string;
    FHostname: string;
    FUsuario : string;
    FSenha   : string;
  end;

var
  frmBackupRestore: TfrmBackupRestore;
  conn: TConexao;

implementation

{$R *.dfm}

procedure TfrmBackupRestore.btnExecutarClick(Sender: TObject);
begin
    if pgcBackupRestore.ActivePageIndex = 0 then
    begin
         if (edtDestino.Text <> '') and (edtOrigem.Text <> '') then
            ExecutarBackup(edtOrigem.Text, edtDestino.Text)
         else
           ShowMessage('É necessário informar os caminhos para os arquivos!');
    end;
end;

procedure TfrmBackupRestore.ExecutarBackup(Origem, Destino: string);
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

procedure TfrmBackupRestore.FormCreate(Sender: TObject);
begin
    try
        conn := TConexao.Create(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini', 'Conexao');
        conn.LeINI;
        Self.FDatabase := conn.Banco;
        Self.FHostname := conn.Hostname;
        Self.FUsuario  := conn.Usuario;
        Self.FSenha    := conn.Senha;
        edtOrigem.Text := FDatabase;
    finally
        FreeAndNil(conn);
    end;
end;

function TfrmBackupRestore.CortarString(Texto: string): string;
var
   i, posBarra : Integer;
begin
    for i := Length(Texto) downto 0 do
    begin
        if Texto[i] = '\' then
        begin
            posBarra := i;
            Break;
        end;
    end;

    Result := Copy(Texto, posBarra +1, (Length(Texto) - posBarra) +1);
end;

procedure TfrmBackupRestore.EstadoControles(Param: string);
begin
    if Param = 'A' then
    begin
         lblStatus.Visible      := false;
         btnExecutar.Enabled    := true;
         btnFechar.Enabled      := True;
         Screen.Cursor          := crDefault;
         animate.Visible        := false;
         animate.Active         := false;
    end
    else
    begin
        if Param = 'D' then
        begin
             lblStatus.Visible      := true;
             btnExecutar.Enabled    := false;
             btnFechar.Enabled      := false;
             Screen.Cursor          := crHourGlass;
             animate.Visible        := True;
             animate.Active         := True;
        end;
    end;
end;

end.
