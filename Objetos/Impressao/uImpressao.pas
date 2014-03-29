unit uImpressao;

interface

uses
   ComCtrls, Classes, SysUtils, Graphics, uImpressora;

type
   TImpressao = class
      private
          FCabSuprimento    : boolean;
          FCabSangria       : boolean;
          FCabFechamento    : boolean;
          FRichEdit         : TRichEdit;
          FEmpresa          : string;
          FCNPJ             : string;
          FInscricao        : string;
          FRua              : string;
          FNumero           : string;
          FBairro           : string;
          FCidade           : string;
          FMensagemCabecalho: string;
          FMensagemRodape   : string;
          FImpressora       : TImpressora;
          FStatusImpressora : Boolean;
          Texto            : AnsiString;
          function getStatusImpressora: Boolean;
          procedure setStatusImpressora(const Value: Boolean);

      protected
          function InseriTraco(qtde: integer; EnterInicio,EnterFinal: Boolean): string; virtual;
          function FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Und, Valor, Subtotal: string; Limite: Integer): string; virtual;

      public
          procedure ImprimirCabecalho(Venda: string); virtual;
          procedure ImprimirSuprimento(Valor, Responsavel, Observacao: string); virtual;
          procedure ImprimirSangria(Valor, Responsavel, Tipo, Observacao: string); virtual;
          procedure ImprimirItem(Item, Codigo, Descricao, Qtde, Und, ValUnit, ValTotal: string; LimiteDesc: Integer); virtual;
          procedure ImprimirCancelamentoVenda(); virtual;
          procedure ImprimirCancelamentoItem(Item, Descricao: string); virtual;
          procedure ImprimirMsgRodape(); virtual;
          procedure ImprimirMsgCabecalho(); virtual;
          procedure ImprimirFinalizacao(Total, SubTotal, Desconto, ValeTroca, Dinheiro, Cheque, Cartao, Ticket, ValorPago, Troco: Double); virtual;
          property StatusImpressora: Boolean read getStatusImpressora write setStatusImpressora;

          constructor Create(CabSuprimento, CabSangria, CabFechamento: Boolean; var RichEdit: TRichEdit;
                             Empresa, CNPJ, Inscricao, Rua, Numero, Bairro, Cidade, MensagemCabecalho, MensagemRodape: string; Impressora: TImpressora); overload;
          constructor Create(CabSuprimento, CabSangria, CabFechamento: Boolean; var RichEdit: TRichEdit;
                             MensagemCabecalho, MensagemRodape: string); overload;
          constructor Create(CabSuprimento, CabSangria, CabFechamento: Boolean; var RichEdit: TRichEdit;
                             Empresa, CNPJ, Inscricao, Rua, Numero, Bairro, Cidade: string); overload;
   end;

implementation

{ TImpressao }

constructor TImpressao.Create(CabSuprimento, CabSangria,
  CabFechamento: Boolean; var RichEdit: TRichEdit; Empresa, CNPJ, Inscricao, Rua, Numero, Bairro, Cidade, MensagemCabecalho, MensagemRodape: string; Impressora: TImpressora);
begin
    FCabSuprimento    := CabSuprimento;
    FCabSangria       := CabSangria;
    FCabFechamento    := CabFechamento;
    FRichEdit         := RichEdit;
    FEmpresa          := Empresa;
    FCNPJ             := CNPJ;
    FInscricao        := Inscricao;
    FRua              := Rua;
    FNumero           := Numero;
    FCidade           := Cidade;
    FBairro           := Bairro;
    FMensagemCabecalho:= MensagemCabecalho;
    FMensagemRodape   := MensagemRodape;
    FImpressora       := Impressora;
end;

constructor TImpressao.Create(CabSuprimento, CabSangria,
  CabFechamento: Boolean; var RichEdit: TRichEdit; MensagemCabecalho,
  MensagemRodape: string);
begin
    FCabSuprimento    := CabSuprimento;
    FCabSangria       := CabSangria;
    FCabFechamento    := CabFechamento;
    FRichEdit         := RichEdit;
    FMensagemCabecalho:= MensagemCabecalho;
    FMensagemRodape   := MensagemRodape;
end;

constructor TImpressao.Create(CabSuprimento, CabSangria,
  CabFechamento: Boolean; var RichEdit: TRichEdit; Empresa, CNPJ, Inscricao,
  Rua, Numero, Bairro, Cidade: string);
begin
    FCabSuprimento    := CabSuprimento;
    FCabSangria       := CabSangria;
    FCabFechamento    := CabFechamento;
    FRichEdit         := RichEdit;
    FEmpresa          := Empresa;
    FCNPJ             := CNPJ;
    FInscricao        := Inscricao;
    FRua              := Rua;
    FNumero           := Numero;
    FCidade           := Cidade;
    FBairro           := Bairro;
end;

procedure TImpressao.ImprimirCabecalho(Venda: string);
begin
    FRichEdit.Clear;
    ImprimirMsgCabecalho;
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(InseriTraco(66, false, false));
    FRichEdit.Lines.Add('*** ' + FEmpresa + ' ***');
    FRichEdit.Lines.Add('CNPJ: ' + FCNPJ  + ' Inscrição Estadual: '+ FInscricao);
    FRichEdit.Lines.Add('Rua: '+ FRua +', Número: '+ FNumero+ ' Bairro: ' + FBairro);
    FRichEdit.Lines.Add('Cidade: ' + FCidade);
    FRichEdit.Lines.Add(InseriTraco(66, false, false));
    FRichEdit.Lines.Add('DATA: ' + FormatDateTime('dd/mm/yyyy', Date) + ' - HORA: ' +  FormatDateTime('hh:mm:ss', time) + '         VENDA NUMERO: ' + Venda);
    FRichEdit.Lines.Add(Format('%1s %5s %19s %14s %3s %7s %6s', ['ITEM', 'CODIGO', 'DESCRICAO', 'QTDE', 'UND', 'VALOR', 'TOTAL']));
    FRichEdit.Lines.Add(InseriTraco(66, false, false));

    if getStatusImpressora then
    begin
        Texto := '';
        Texto := Concat(Texto, '<c>' + Format('%s %s %28s', ['DATA: '+FormatDateTime('dd/mm/yyyy', Date), ' - HORA: '+FormatDateTime('hh:mm:ss', time), Venda]) + '</c>'#10);
        Texto := Concat(Texto, '<c>ITEM    CODIGO          DESCRICAO        QTDE  UND  VALOR  TOTAL</c>'#10);
        Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
        FImpressora.ImprimeTextoTag(PAnsiChar(Texto), true);
    end;
end;

procedure TImpressao.ImprimirCancelamentoItem(Item, Descricao: string);
begin
    FRichEdit.Paragraph.Alignment := taLeftJustify;
    FRichEdit.Lines.Add(#10'ITEM ' + Item + ' *' + Descricao + '* CANCELADO'#10);

    if getStatusImpressora then
    begin
        Texto := '';
        Texto := Concat(Texto, #10+'<c>ITEM ' + Item + ' *' + Descricao + '* CANCELADO</c>'#10);
        FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
    end;
end;

procedure TImpressao.ImprimirCancelamentoVenda;
begin
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add('VENDA CANCELADA');
    FRichEdit.Lines.Add(InseriTraco(66, false, false));

    if getStatusImpressora then
    begin
       Texto := '';
       Texto := Concat(Texto, '<ce>VENDA CANCELADA</ce>'#10);
       Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
       FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
       FImpressora.AcionaGuilhotina(0);
    end;
end;

procedure TImpressao.ImprimirFinalizacao(Total, SubTotal, Desconto, ValeTroca, Dinheiro, Cheque, Cartao, Ticket, ValorPago, Troco: Double);
begin
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(InseriTraco(66, false, false));

    FRichEdit.Paragraph.Alignment := taRightJustify;
    FRichEdit.SelAttributes.Style:=[fsBold];
    FRichEdit.Lines.Add('SUBTOTAL R$ ' + FormatFloat('##0.00', SubTotal));

    if ValeTroca > 0 then
       FRichEdit.Lines.Add('VALE TROCA R$ ' + FormatFloat('##.00', ValeTroca));

    if Desconto > 0 then
       FRichEdit.Lines.Add('DESCONTO(%) ' + FormatFloat('##.00', Desconto));

    FRichEdit.Paragraph.Alignment := taRightJustify;
    FRichEdit.SelAttributes.Style:=[fsBold];
    FRichEdit.Lines.Add('TOTAL R$ ' + FormatFloat('##0.00', Total));
    FRichEdit.SelAttributes.Style:=[];
    FRichEdit.Paragraph.Alignment := taLeftJustify;

    FRichEdit.Lines.Add('Forma de Pagamento:');

    if Dinheiro > 0 then
       FRichEdit.Lines.Add('DINHEIRO R$ ' + FormatFloat('##0.00', Dinheiro));

    if Cheque > 0 then
       FRichEdit.Lines.Add('CHEQUE R$ ' + FormatFloat('##0.00', Cheque));

    if Cartao > 0 then
       FRichEdit.Lines.Add('CARTÃO R$ ' + FormatFloat('##0.00', Cartao));

    if Ticket > 0 then
       FRichEdit.Lines.Add('TICKET R$ ' + FormatFloat('##0.00', Ticket));

    if ValorPago > 0 then
       FRichEdit.Lines.Add(#10 + 'VALOR PAGO R$ ' + FormatFloat('##0.00', ValorPago));

    if Troco > 0 then
       FRichEdit.Lines.Add('TROCO R$ ' + FormatFloat('##0.00', Troco));

    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(InseriTraco(66, false, false));
    ImprimirMsgRodape();

    if getStatusImpressora then
    begin
         Texto := '';
         Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
         Texto := Concat(Texto, '<ad><b>SUBTOTAL R$ ' + FormatFloat('##0.00', SubTotal) + '</b></ad>'#10);

         if ValeTroca > 0 then
            Texto := Concat(Texto, '<ad><c>VALE TROCA R$ ' + FormatFloat('##.00', ValeTroca) + '</c></ad>'#10);

         if Desconto > 0 then
            Texto := Concat(Texto, '<ad><c>DESCONTO(%) ' + FormatFloat('##.00', Desconto) + '</c></ad>'#10);

         Texto := Concat(Texto, '<ad><b>TOTAL R$ ' + FormatFloat('##0.00', Total) + '</b></ad>'#10);
         Texto := Concat(Texto, '<c>Forma de Pagamento:</c>'#10);

         if Dinheiro > 0 then
            Texto := Concat(Texto, '<c>DINHEIRO R$ ' + FormatFloat('##0.00', Dinheiro) + '</c>'#10);

         if Cheque > 0 then
            Texto := Concat(Texto, '<c>CHEQUE R$ ' + FormatFloat('##0.00', Cheque) + '</c>'#10);

         if Cartao > 0 then
            Texto := Concat(Texto, '<c>CARTÃO R$ ' + FormatFloat('##0.00', Cartao) + '</c>'#10);

         if Ticket > 0 then
            Texto := Concat(Texto, '<c>TICKET R$ ' + FormatFloat('##0.00', Ticket) + '</c>'#10);

         if ValorPago > 0 then
             Texto := Concat(Texto, #10'<c>VALOR PAGO R$ ' + FormatFloat('##0.00', ValorPago) + '</c>'#10);

         if Troco > 0 then
             Texto := Concat(Texto, '<c>TROCO R$ ' + FormatFloat('##0.00', Troco) + '</c>'#10);


         Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
         Texto := Concat(Texto, '<ce><c>' + FMensagemRodape + '</c></ce>'#10);
         FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
         FImpressora.AcionaGuilhotina(0);
    end;
end;

procedure TImpressao.ImprimirItem(Item, Codigo, Descricao, Qtde, Und,
  ValUnit, ValTotal: string; LimiteDesc: Integer);
begin
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Und, ValUNit, ValTotal, LimiteDesc));

    if getStatusImpressora then
    begin
       Texto := '';
       Texto := Concat(Texto, '<c>' + FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Und, ValUnit, ValTotal, LimiteDesc) + '</c>'#10);
       FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
    end;
end;

procedure TImpressao.ImprimirMsgCabecalho();
begin
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(FMensagemCabecalho);
end;

procedure TImpressao.ImprimirMsgRodape();
begin
    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(FMensagemRodape);
end;

procedure TImpressao.ImprimirSangria(Valor, Responsavel, Tipo,
  Observacao: string);
begin
    FRichEdit.Clear;

    if FCabSangria then
       ImprimirMsgCabecalho();

    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(InseriTraco(66, false, false));
    FRichEdit.SelAttributes.Style:=[fsBold];
    FRichEdit.Lines.Add('RELATÓRIO GERENCIAL');
    FRichEdit.SelAttributes.Style:=[];
    FRichEdit.Lines.Add('SANGRIA'+#10);
    FRichEdit.Paragraph.Alignment := taLeftJustify;
    FRichEdit.Lines.Add('Responsável: '+ Responsavel);
    FRichEdit.Lines.Add('Valor: ' + Valor);
    FRichEdit.Lines.Add('Tipo: ' + Tipo);
    FRichEdit.Lines.Add('Data: ' + FormatDateTime('dd/mm/yyyy', Date));
    FRichEdit.Lines.Add('Hora: ' + FormatDateTime('hh:mm:ss', time));
    FRichEdit.Lines.Add('Motivo: ' + #10 + UpperCase(Observacao));
    FRichEdit.Lines.Add(InseriTraco(66, false, false));

    if getStatusImpressora then
    begin
        Texto := '';
        Texto := Concat(Texto,  FImpressora.InseriTraco(48, false, true));
        Texto := Concat(Texto, '<ce><b>RELATÓRIO GERENCIAL</b></ce>'#10);
        Texto := Concat(Texto, '<ce>SANGRIA</ce>'#10#10);
        Texto := Concat(Texto, 'Responsável: ' + Responsavel + #10);
        Texto := Concat(Texto, 'Valor: ' + Valor + #10);
        Texto := Concat(Texto, 'Tipo: ' + Tipo + #10);
        Texto := Concat(Texto, 'Data: ' + FormatDateTime('dd/mm/yyyy', Date) + #10);
        Texto := Concat(Texto, 'Hora: ' + FormatDateTime('hh:mm:ss', time) + #10);
        Texto := Concat(Texto, 'Motivo: ' + #10 + UpperCase(Observacao) + #10);
        Texto := Concat(Texto, FImpressora.InseriTraco(48, True, true));
        FImpressora.ImprimeTextoTag(PAnsiChar(texto), false);
        FImpressora.AcionaGuilhotina(0);
    end;
end;

procedure TImpressao.ImprimirSuprimento(Valor, Responsavel,
  Observacao: string);
begin
    FRichEdit.Clear;

    if FCabSangria then
       ImprimirMsgCabecalho();

    FRichEdit.Paragraph.Alignment := taCenter;
    FRichEdit.Lines.Add(InseriTraco(66, false, false));
    FRichEdit.SelAttributes.Style:=[fsBold];
    FRichEdit.Lines.Add('RELATÓRIO GERENCIAL');
    FRichEdit.SelAttributes.Style:=[];
    FRichEdit.Lines.Add('SUPRIMENTO'+#10);
    FRichEdit.Paragraph.Alignment := taLeftJustify;
    FRichEdit.Lines.Add('Responsável: '+ Responsavel);
    FRichEdit.Lines.Add('Valor: ' + Valor);
    FRichEdit.Lines.Add('Data: ' + FormatDateTime('dd/mm/yyyy', Date));
    FRichEdit.Lines.Add('Hora: ' + FormatDateTime('hh:mm:ss', time));
    FRichEdit.Lines.Add('Motivo: ' + #10 + UpperCase(Observacao));
    FRichEdit.Lines.Add(InseriTraco(66, false, false));

    if getStatusImpressora then
    begin
       Texto := '';
       Texto := Concat(Texto,  FImpressora.InseriTraco(48, false, true));
       Texto := Concat(Texto, '<ce><b>RELATÓRIO GERENCIAL</b></ce>'#10);
       Texto := Concat(Texto, '<ce>SUPRIMENTO</ce>'#10#10);
       Texto := Concat(Texto, 'Responsável: ' + Responsavel + #10);
       Texto := Concat(Texto, 'Valor: ' + Valor + #10);
       Texto := Concat(Texto, 'Data: ' + FormatDateTime('dd/mm/yyyy', Date) + #10);
       Texto := Concat(Texto, 'Hora: ' + FormatDateTime('hh:mm:ss', time) + #10);
       Texto := Concat(Texto, 'Motivo: ' + #10 + UpperCase(Observacao) + #10);
       Texto := Concat(Texto, FImpressora.InseriTraco(48, True, true));
       FImpressora.ImprimeTextoTag(PAnsiChar(texto), false);
       FImpressora.AcionaGuilhotina(0);
    end;
end;

function TImpressao.InseriTraco(qtde: integer; EnterInicio,
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

procedure TImpressao.setStatusImpressora(const Value: Boolean);
begin
    FStatusImpressora := Value;
end;

function TImpressao.FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Und, Valor,
  Subtotal: string; Limite: Integer): string;
var
   retorno, desc, qt, v1,  v2: string;
   i: Integer;
begin
     desc := Descricao;

     if Limite > Length(Descricao) then
     begin
         for i := 1 to (Limite - Length(Descricao)) do
             desc := desc + ' ';
     end
     else
        desc := Copy(desc, 1, Limite);

     qt := Qtde;
     for i := 1 to (7 - Length(Qtde)) do
         qt := ' ' + qt;

     v1 := Valor;
     for i := 1 to (7 - Length(Valor)) do
         v1 := ' ' + v1;

     v2 := Subtotal;
     for i := 1 to (7 - Length(Subtotal)) do
         v2 := ' ' + v2;

     retorno := Item;
     retorno := Concat(retorno, ' '+Codigo);
     retorno := Concat(retorno, ' '+desc);
     retorno := Concat(retorno, ' '+qt);
     retorno := Concat(retorno, ' '+Und);
     retorno := Concat(retorno, ' '+v1);
     retorno := Concat(retorno, ' '+v2);

     Result := retorno;
end;

function TImpressao.getStatusImpressora: Boolean;
begin
     Result := FStatusImpressora;
end;

end.

