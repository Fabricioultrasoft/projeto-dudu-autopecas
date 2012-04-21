unit uFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmCalula_Perc = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtValor: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function CalcularPorcentagem(Perc, Valor : Double): Double;
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

function TfrmCalula_Perc.CalcularPorcentagem(Perc, Valor: Double): Double;
var
   percentual, resultado: Double;
begin
     Result     := 0;
     percentual := ((Perc * Valor)/100);
     resultado  := Valor + percentual;
     Result     := resultado;
end;

procedure TfrmCalula_Perc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action         := caFree;
    frmCalula_Perc := nil;
end;

procedure TfrmCalula_Perc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmCalula_Perc.Close;
     
end;

procedure TfrmCalula_Perc.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (key = #13) and (edtValor.Text <> '') then
    begin
         frmCadProduto.edtVal_Venda.Text := FormatFloat('##0.00', CalcularPorcentagem(StrToFloat(edtValor.Text), StrToFloat(frmCadProduto.edtVal_Custo.Text)));
         frmCalula_Perc.Close;
    end;
end;

end.
