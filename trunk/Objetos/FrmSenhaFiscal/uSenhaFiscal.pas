unit uSenhaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmSenhaFiscal = class(TForm)
    Panel1: TPanel;
    edtSenha: TEdit;
    lbl1: TLabel;
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaFiscal: TfrmSenhaFiscal;

implementation

uses uDm, uCancela_Item;

{$R *.dfm}

procedure TfrmSenhaFiscal.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          if edtSenha.Text <> '' then
          begin
              dm.cdsUsuario.Close;
              dm.qryUsuario.Close;
              dm.qryUsuario.SQL.Clear;
              dm.qryUsuario.SQL.Add('SELECT * FROM USUARIO ');
              dm.qryUsuario.SQL.Add('WHERE SENHA = :senha AND PRIVILEGIO = :privilegio');
              dm.qryUsuario.ParamByName('senha').AsString      := Trim(edtSenha.Text);
              dm.qryUsuario.ParamByName('privilegio').AsString := 'ADMINISTRAÇÃO';
              dm.qryUsuario.Open;
              dm.cdsUsuario.Open;

              if dm.cdsUsuario.RecordCount > 0 then
              begin
                 try
                    frmSenhaFiscal.Close;
                    frmCancelaItem := TfrmCancelaItem.Create(nil);
                    frmCancelaItem.ShowModal;
                 finally
                    FreeAndNil(frmCancelaItem);
                 end;
              end
              else
              begin
                 MessageDlg('Senha não liberada!', mtWarning, [mbOK], 0);
                 edtSenha.Clear;
              end;
          end
          else
            MessageDlg('É necessário informar a senha do fiscal!', mtWarning, [mbOK], 0);
     end;
end;

procedure TfrmSenhaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  := caFree;
    frmSenhaFiscal := nil;
end;

procedure TfrmSenhaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then self.Close; 
end;

end.
