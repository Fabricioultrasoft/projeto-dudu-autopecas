unit uAviso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAviso = class(TForm)
    pnl3: TPanel;
    btn1: TBitBtn;
    pnl1: TPanel;
    mmoAviso: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAviso: TfrmAviso;

implementation

uses uMenu;

{$R *.dfm}

procedure TfrmAviso.btn1Click(Sender: TObject);
begin
    Self.Close
end;

procedure TfrmAviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     frmAviso := nil;
end;

procedure TfrmAviso.FormCreate(Sender: TObject);
begin
    Self.Caption := Application.Title;
    mmoAviso.Lines.Add(frmMenu.FMensagem.ToString);
end;

procedure TfrmAviso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then Self.Close;
end;

end.
