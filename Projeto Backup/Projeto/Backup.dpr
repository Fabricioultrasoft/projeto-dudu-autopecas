program Backup;

uses
  Forms,
  UPrincipal in '..\Objetos\FrmPrincipal\UPrincipal.pas' {frmPrincipal},
  UBackup in '..\Objetos\UBackup.pas',
  UConexao in '..\Objetos\Conexao\UConexao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Backup';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
