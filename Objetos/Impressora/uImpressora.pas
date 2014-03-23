unit uImpressora;

interface

uses
   uImpressoraBase, uImpressoraEpson;

type
   TModeloImpressora = (miEpson, miBematech, miDaruma, miSwega, miUrano);

type
   TImpressora = class
   private
        FImpressora: TImpressoraBase;
        FModelo: TModeloImpressora;
   public
        function AbrirComunicacao: Boolean;
        procedure FecharComunicacao;
        procedure VerificaStatusImpressora;
        procedure VerificaStatusGaveta;
        procedure setTaxaSerial(Taxa: Integer);
        procedure AcionaGuilhotina(TipoCorte: Integer);
        procedure ImprimeTextoTag(Texto: pAnsiChar; Cabecalho:boolean);
        procedure ImprimeTextoStyle(Texto: pAnsiChar; TipoLetra: Integer; Italico: Integer; Sublinhado: Integer; Expandido: Integer; Enfatizado: Integer);
        procedure ImprimeTexto(Texto: pAnsiChar);
        class function InseriTraco(qtde: integer; EnterInicio, EnterFinal: Boolean): string; virtual;

        constructor Create(Modelo: TModeloImpressora; Porta: PAnsiChar); reintroduce;
   end;

implementation

{ TImpressora }

class function TImpressora.InseriTraco(qtde: integer; EnterInicio,
  EnterFinal: Boolean): string;
var
  i: Integer;
  str: string;
begin
     if EnterInicio then
        str := #10;

     for i := 1 to qtde do
     begin
         str := str + '-';
     end;

     if EnterFinal then
        str := str + #10;

     Result := str;
end;

function TImpressora.AbrirComunicacao: Boolean;
begin
    Result := (FImpressora as TImpressoraEpson).AbrirPorta();
end;

procedure TImpressora.AcionaGuilhotina(TipoCorte: Integer);
begin
    (FImpressora as TImpressoraEpson).AtivaGuilhotina(TipoCorte);
end;

constructor TImpressora.Create(Modelo: TModeloImpressora; Porta: PAnsiChar);
begin
    FModelo := Modelo;

    case FModelo of
       miEpson: FImpressora := TImpressoraEpson.Create(Porta);
    end;
end;

procedure TImpressora.FecharComunicacao;
begin
    (FImpressora as TImpressoraEpson).FecharPorta;
end;

procedure TImpressora.ImprimeTexto(Texto: pAnsiChar);
begin
    (FImpressora as TImpressoraEpson).ImprimeStr(Texto);
end;

procedure TImpressora.ImprimeTextoStyle(Texto: pAnsiChar; TipoLetra, Italico,
  Sublinhado, Expandido, Enfatizado: Integer);
begin
    (FImpressora as TImpressoraEpson).ImprimeStrTX(Texto, TipoLetra, Italico, Sublinhado, Expandido, Enfatizado);
end;

procedure TImpressora.ImprimeTextoTag(Texto: pAnsiChar; Cabecalho:boolean);
begin
    (FImpressora as TImpressoraEpson).ImprimeStrTag(Texto, Cabecalho);
end;

procedure TImpressora.setTaxaSerial(Taxa: Integer);
begin
    (FImpressora as TImpressoraEpson).ConfigurarTaxaSerial(Taxa);
end;

procedure TImpressora.VerificaStatusGaveta;
begin
    (FImpressora as TImpressoraEpson).StatusGaveta;
end;

procedure TImpressora.VerificaStatusImpressora;
begin
    (FImpressora as TImpressoraEpson).StatusImpressora;
end;

end.
