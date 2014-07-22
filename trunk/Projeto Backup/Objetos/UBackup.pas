unit UBackup;

interface

uses
    Windows, Dialogs, ComCtrls, StdCtrls, IBServices, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

Type
   TBackup = class
   private
     FOrigem: string;
     FDestino: string;
     FBackup: TIBBackupService;

     procedure SetDestino(const Value: string);
     procedure SetOrigem(const Value: string);
     procedure AtivaControles(Param: string);

   public
     procedure ExecutarBackup(var lblStatus: TLabel);
     property Origem:  string  read FOrigem  write SetOrigem;
     property Destino: string  read FDestino write SetDestino;

     constructor Create(Origem, Destino: string; var form: TForm);
     destructor Destroi;
   end;

implementation

uses UPrincipal;

{ TBackup }

procedure TBackup.AtivaControles(Param: string);
begin

end;

constructor TBackup.Create(Origem, Destino: string; var form: TForm);
begin
    SetOrigem(Origem);
    SetDestino(Destino);
    FBackup := TIBBackupService.Create(nil);
end;

destructor TBackup.Destroi;
begin
    Self.FBackup.Free;
    Self.FBackup := nil;
end;

procedure TBackup.ExecutarBackup(var lblStatus: TLabel);
begin

end;

procedure TBackup.SetDestino(const Value: string);
begin
    FDestino := Value;
end;

procedure TBackup.SetOrigem(const Value: string);
begin
    FOrigem := Value;
end;

end.
