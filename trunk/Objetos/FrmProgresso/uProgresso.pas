unit uProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmProgresso = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgresso: TfrmProgresso;

implementation

uses uMenu, uPDV, uFechamento_Caixa;

{$R *.dfm}

procedure TfrmProgresso.FormActivate(Sender: TObject);
var
   i: Integer;
begin
    i := 1;
    while i <= 5 do
    begin
        lbl1.Caption := lbl1.Caption + '.';
        frmProgresso.Refresh;
        Sleep(500);
        Inc(i);
    end;

    if Assigned(frmPDV) then
    begin
        frmPDV.FVerificacaoImpressora := frmPDV.FImpressora.AbrirComunicacao;
        if frmPDV.FVerificacaoImpressora then
           frmPDV.FImpressora.ImprimeTextoTag(''+#10, false);
    end;


    if Assigned(frmFechamento_Caixa) then
    begin
       frmFechamento_Caixa.FVerificacaoImpressora := frmFechamento_Caixa.FImpressora.AbrirComunicacao;
       if frmFechamento_Caixa.FVerificacaoImpressora then
           frmFechamento_Caixa.FImpressora.ImprimeTextoTag(''+#10, false);
    end;

    frmProgresso.Close;
end;

procedure TfrmProgresso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
     frmProgresso := nil;
end;

end.
