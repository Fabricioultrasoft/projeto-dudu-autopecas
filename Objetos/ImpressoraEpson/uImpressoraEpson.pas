unit uImpressoraEpson;

interface

uses
    uImpressoraBase, uInterfaceEpson, Windows, Dialogs, SysUtils;

type
   TImpressoraEpson = class(TImpressoraBase)
     public
        FCabecalho: string;

        procedure ConfigurarTaxaSerial(Taxa: integer); overload;
        function AbrirPorta():boolean overload;
        procedure FecharPorta(); overload;
        procedure ImprimeStr(Texto: pAnsiChar); overload;
        procedure ImprimeStrTag(Texto: pAnsiChar; Cabecalho: boolean); overload;
        procedure ImprimeStrTX(Texto: pAnsiChar; TipoLetra: Integer; Italico: Integer; Sublinhado: Integer; Expandido: Integer; Enfatizado: Integer) overload;
        procedure AtivaGuilhotina(TipoCorte: Integer); overload;
        procedure StatusGaveta(); overload;
        procedure StatusImpressora(); overload;
        function getCodigoStatus(): Integer;

        constructor Create(Porta: PAnsiChar); overload;
   end;

implementation

{ TImpressoraEpson }

function TImpressoraEpson.AbrirPorta: Boolean;
var
   re: Integer;
begin
     re := getCodigoStatus;

     // Verificar se já existe comunicação
     if re <> 24 then
     begin
         try
             // Abrir porta de comunicação
             iRetorno := IniciaPorta(Porta);

             if iRetorno = 0 then
                raise Exception.Create('Sem comunicação com a impressora, reinicie o sistema com a impressora ligada!')
             else
                Result := True;
         except
             on E:Exception do
             begin
                MessageDlg(E.Message, mtError, [mbOK], 0);
                Result := false;
             end;
         end;
     end
     else
        Result := True;
end;

procedure TImpressoraEpson.AtivaGuilhotina(TipoCorte: Integer);
begin
    try
        iRetorno := AcionaGuilhotina(TipoCorte);

        if iRetorno = 0 then
           raise Exception.Create('Erro ao acionar guilhotina!');
    except
         on E:Exception do
         MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
end;

procedure TImpressoraEpson.ConfigurarTaxaSerial(Taxa: Integer ) ;
begin
    try
        iRetorno := ConfiguraTaxaSerial(Taxa);

        if iRetorno = 0 then
           raise Exception.Create('Erro ao configurar taxa serial!');
    except
        on E:Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
end;

constructor TImpressoraEpson.Create(Porta: PAnsiChar);
begin
    Self.Porta := Porta;
end;

procedure TImpressoraEpson.FecharPorta ;
begin
    try
        iRetorno := FechaPorta();

        if iRetorno = 1 then
           raise Exception.Create('Erro ao fechar porta de comunicação!');
    except
        on E:Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
end;

function TImpressoraEpson.getCodigoStatus: Integer;
begin
    Result := Le_Status;
end;

// Imprime texto com quebra de linha, é possível escolher alguns tipos de formatações do texto
procedure TImpressoraEpson.ImprimeStrTX(Texto: pAnsiChar; TipoLetra: integer; Italico: integer; Sublinhado: integer; Expandido: integer; Enfatizado: integer);
begin
     iRetorno := FormataTX(Texto, TipoLetra, Italico, Sublinhado, Expandido, Enfatizado);
end;

procedure TImpressoraEpson.ImprimeStr(Texto: pAnsiChar) ;
begin
     iRetorno := ImprimeTexto(Texto);
end;

// Imprime um texto, quebra de linha tem que ser informada, aceita TAGS de formatação
procedure TImpressoraEpson.ImprimeStrTag(Texto: pAnsiChar; Cabecalho: boolean) ;
begin
     if Cabecalho then
        ImprimeTextoTag(Self.MontaCabecalho);

     ImprimeTextoTag(Texto);
end;

procedure TImpressoraEpson.StatusImpressora ;
begin
     iRetorno := Le_Status();

     case iRetorno of
        0: raise Exception.Create('Erro ao verificar status!');
        5: raise Exception.Create('Impressora com pouco papel!');
        9: raise Exception.Create('Tampa aberta!');
        //24: MessageDlg('Impressora "ONLINE"!', mtInformation, [mbOK], 0);
        32: raise Exception.Create('Impressora sem papel!');
     end;
end;

procedure TImpressoraEpson.StatusGaveta ;
begin
     iRetorno := Le_Status_Gaveta();

     case iRetorno of
        0: MessageDlg('Erro ao verificar status da gaveta!', mtError, [mbOK], 0);
        1: MessageDlg('Gaveta Aberta!', mtInformation, [mbOK], 0);
        9: MessageDlg('Gaveta Fechada!', mtInformation, [mbOK], 0);
     end;
end;

end.
