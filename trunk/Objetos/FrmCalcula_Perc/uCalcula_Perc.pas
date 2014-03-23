unit uCalcula_Perc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uFuncao, uEntrada_Produtos;

type
  TfrmCalula_Perc = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtValor: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalula_Perc: TfrmCalula_Perc;

implementation

uses uDm, uPDV, uCad_Produto;

{$R *.dfm}

procedure TfrmCalula_Perc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmCalula_Perc.Close;
end;

end.
