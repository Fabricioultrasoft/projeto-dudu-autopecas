unit uImpressoraBase;

interface

type
   TImpressoraBase = class
     private
          FColuna  : Integer;
          FRazao   : string;
          FRua     : string;
          FNumero  : integer;
          FBairro  : string;
          FCidade  : string;
          FUF      : string;
          FPorta   : PAnsiChar;

          procedure setcoluna(const Value: integer);
          procedure setRazao(const Value: string);
          procedure setBairro(const Value: string);
          procedure setCidade(const Value: string);
          procedure setNumero(const Value: integer);
          procedure setRua(const Value: string);
          procedure setUF(const Value: string);
          function getRazao():string;
          function getBairro: string;
          function getCidade: string;
          function getNumero: integer;
          function getRua: string;
          function getUF: string;
          function getColuna: integer;
          function getPorta: PAnsiChar;
          procedure setPorta(const Value: PAnsiChar);

     public
          iRetorno : Integer;

          procedure ConfigurarTaxaSerial(); virtual; abstract;
          function AbrirPorta: Boolean; virtual; abstract;
          procedure FecharPorta(); virtual; abstract;
          procedure ImprimeStr(); virtual; abstract;
          procedure ImprimeStrTag(); virtual; abstract;
          procedure ImprimeStrTX(); virtual; abstract;
          procedure AtivaGuilhotina();virtual; abstract;
          procedure StatusGaveta(); virtual; abstract;
          procedure StatusImpressora(); virtual; abstract;
          procedure ImprimeRodape(); virtual; abstract;
          function MontaCabecalho():PAnsiChar;virtual;
          class function InseriTraco(qtde: integer; EnterInicio, EnterFinal: Boolean): string; virtual;

          property Porta  : PAnsiChar  read getPorta  write setPorta;
          property Razao  : string  read getRazao  write setRazao;
          property Rua    : string  read getRua    write setRua;
          property Numero : integer read getNumero write setNumero;
          property Bairro : string  read getBairro write setBairro;
          property Cidade : string  read getCidade write setCidade;
          property UF     : string  read getUF     write setUF;
          property Coluna : integer read getColuna write setcoluna;
   end;

implementation

uses uMenu;

{ TImpressoraBase }

procedure TImpressoraBase.setBairro(const Value: string);
begin
    FBairro := Value;
end;

procedure TImpressoraBase.setCidade(const Value: string);
begin
    FCidade := Value;
end;

procedure TImpressoraBase.setcoluna(const Value: integer);
begin
    FColuna := Value;
end;

procedure TImpressoraBase.setNumero(const Value: integer);
begin
    FNumero := Value;
end;

procedure TImpressoraBase.setPorta(const Value: PAnsiChar);
begin
    FPorta := Value;
end;

function TImpressoraBase.getRazao: string;
begin
   Result := FRazao;
end;

procedure TImpressoraBase.setRua(const Value: string);
begin
    FRua := Value;
end;

procedure TImpressoraBase.setUF(const Value: string);
begin
    FUF := Value;
end;

function TImpressoraBase.MontaCabecalho: PAnsiChar;
var
   Texto : AnsiString;
begin
    Texto := Concat(Texto, '<ce><c>' + frmMenu.FMsgCabecalho + '</c></ce>');
    Texto := Concat(Texto, InseriTraco(48, True, True));
    Texto := Concat(Texto, '<ce><c>*** ' + frmMenu.FRazao + ' ***' + #10);
    Texto := Concat(Texto, 'CNPJ: ' + frmMenu.FCNPJ  + ' Inscrição Estadual: '+ frmMenu.FInscricao + #10);
    Texto := Concat(Texto, 'Rua: '+ frmMenu.FRua +', Número: '+ frmMenu.FNumero+ ' Bairro: ' + frmMenu.FBairro + #10);
    Texto := Concat(Texto, 'Cidade: ' + frmMenu.FCidade + '</c>');
    Texto := Concat(Texto, InseriTraco(48, True, true));

    Result := PAnsiChar(Texto);
end;

function TImpressoraBase.getBairro: string;
begin
    Result := FBairro;
end;

function TImpressoraBase.getCidade: string;
begin
    Result := FCidade;
end;

function TImpressoraBase.getColuna: integer;
begin
    Result := FColuna;
end;

function TImpressoraBase.getNumero: integer;
begin
    Result := FNumero;
end;

function TImpressoraBase.getPorta: PAnsiChar;
begin
   Result := FPorta;
end;

procedure TImpressoraBase.setRazao(const Value: string);
begin
    FRazao := value;
end;

function TImpressoraBase.getRua: string;
begin
    Result := FRua;
end;

function TImpressoraBase.getUF: string;
begin
    Result := FUF;
end;

class function TImpressoraBase.InseriTraco(qtde: integer; EnterInicio,
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

end.
