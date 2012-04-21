unit uFuncao;

interface

uses
   Classes, Windows, Forms, SysUtils, Dialogs;

type
   TOperation = (toInsert, toUpdate, toNone);

type
   TFuncoes = class
   public
       class function CalcularPorcentagem(Perc, Valor: Double): Double;
       class function CalculaValorProd(qtde: Integer; Valor: Double): Double;
   end;

implementation

{ TFuncao }

class function TFuncoes.CalcularPorcentagem(Perc, Valor: Double): Double;
var
   percentual, resultado: Double;
begin
     Result     := 0;
     try
         percentual := ((Perc * Valor)/100);
         resultado  := Valor + percentual;
         Result     := resultado;
     except
         on E:Exception do
         ShowMessage('Erro ao executar cálculo!'#13#10 + E.Message);
     end;
end;

class function TFuncoes.CalculaValorProd(qtde: Integer; Valor: Double): Double;
begin
    Result := 0;

    try
        Result := Valor * qtde;
    except
        on E:Exception do
        ShowMessage('Erro ao executar cálculo!'#13#10 + E.Message);
    end;
end;

end.
