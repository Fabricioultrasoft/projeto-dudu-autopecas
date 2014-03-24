unit USobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, jpeg;

type
  TfrmSobre = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lblName: TLabel;
    Label2: TLabel;
    lblVersao: TLabel;
    Label3: TLabel;
    lblResponsavel: TLabel;
    Label4: TLabel;
    lblPlataforma: TLabel;
    lblRelatorio: TLabel;
    lblBancoDados: TLabel;
    lblINI: TLabel;
    lblSite: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblSiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

uses uMenu;

{$R *.dfm}

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
     lblName.Caption        := Application.Title;
     lblVersao.Caption      := frmMenu.GetBuildInfo;
     lblResponsavel.Caption := 'William F. Leite';
     lblINI.Caption         := 'Arquivo INI: ' + ExtractFilePath(Application.ExeName) + 'String_Conexao.ini';
     lblPlataforma.Caption  := 'Delphi XE';
     lblRelatorio.Caption   := 'RL Report';
     lblBancoDados.Caption  := 'Firebird 2.5.2';
end;

procedure TfrmSobre.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     lblSite.Font.Style := lblSite.Font.Style - [fsUnderline];
end;

procedure TfrmSobre.lblSiteClick(Sender: TObject);
var
    buffer: String;
begin
      buffer := lblSite.Caption;
      ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSobre.lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    lblSite.Font.Style := lblSite.Font.Style + [fsUnderline];
end;

end.
