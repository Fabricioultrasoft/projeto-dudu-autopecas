unit uPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, FMTBcd, DB, SqlExpr, DBXCommon, uFormBase,
  pcnConversao, uImpressora, jpeg, ComCtrls, ShellAPI;

type
   TStatusVenda = (svAberto, svFechado, svBloqueado);

type
  TfrmPDV = class(TFormBase)
    lblHora: TLabel;
    lblCaixa: TLabel;
    lblOperador: TLabel;
    lblData: TLabel;
    edtStatus: TEdit;
    edtProduto: TEdit;
    edtValor_Unitario: TEdit;
    edtSub_total: TEdit;
    edtTotal: TEdit;
    img1: TImage;
    edtConsulta: TEdit;
    img2: TImage;
    redtItem: TRichEdit;
    tmr1: TTimer;
    btnConsultarEstoque: TSpeedButton;
    btnIniciarVenda: TSpeedButton;
    btnFinalizarVenda: TSpeedButton;
    btnConsultarDevolucao: TSpeedButton;
    btnEstornoFinanceiro: TSpeedButton;
    btnCancelarVenda: TSpeedButton;
    btnCancelarItem: TSpeedButton;
    btnIncluirProduto: TSpeedButton;
    btnProcurarVenda: TSpeedButton;
    btnSuprimento: TSpeedButton;
    btnSangria: TSpeedButton;
    btn13: TSpeedButton;
    pnl1: TPanel;
    img3: TImage;
    lblTitulo: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblVersao: TLabel;
    lbl1: TLabel;
    lblVenda: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
    procedure LimpaCampos();override;
    procedure NewVenda();
    procedure AlteraVenda();
    procedure FinalizarVenda();
    procedure CancelarItem();
    procedure CancelarVenda();
    procedure AtualizaCDSVenda();
    procedure CarregarItem(const TextoDigitado: string);
    function GeraNVenda: string;
    function VerificaAberturaCaixa(): Boolean;
    procedure grddbgrdCellClick(Column: TColumn);
    procedure grddbgrdDblClick(Sender: TObject);
    procedure edtConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Valor, Subtotal: string; Limite: Integer): string;
    procedure FormShow(Sender: TObject);
    function HexToTColor(sColor : string) : TColor;
    procedure ImprimiCabecalho();
    procedure ImprimeCancelaVenda();
    procedure ImprimeItemVenda(Texto: string);
    procedure ImprimeFinalizacaoVenda();
    procedure ImprimeCancelaItem(Item, Descricao: string);
    procedure tmr1Timer(Sender: TObject);
    procedure btnConsultarEstoqueClick(Sender: TObject);
    procedure btnIniciarVendaClick(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnConsultarDevolucaoClick(Sender: TObject);
    procedure btnEstornoFinanceiroClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnIncluirProdutoClick(Sender: TObject);
    procedure btnProcurarVendaClick(Sender: TObject);
    procedure btnSangriaClick(Sender: TObject);
    procedure btnSuprimentoClick(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure lbl4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lbl4Click(Sender: TObject);
    procedure pnl1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    //procedure GeraNfe();
  private


  public
    sFNumeroVenda   : string;
    sFCodCliente    : string;
    sFStatus        : string;
    sFID_Funcionario: string;
    sFCod_cli       : string;
    dFDesconto      : Double;
    dFSub_total     : Double;
    dFTotal         : Double;
    dFDinheiro      : Double;
    dFCheque        : Double;
    dFCartao        : Double;
    dFTicket        : Double;
    dFValPago       : Double;
    dFTroco         : Double;
    dFValeTroca     : Double;
    bFResposta      : boolean;
    bFCancelaItem   : boolean;
    bFEstornaValor  : boolean;
    StatusPDV       : TStatusVenda;
    FImpressora     : TImpressora;
    FVerificacaoImpressora: boolean;
    sFCodigoDevolucao: string;

    procedure setStatusCaixa(Status: TStatusVenda);
  end;

var
  frmPDV: TfrmPDV;
  Trans : TDBXTransaction;
  Texto : AnsiString;

implementation

uses uProcura_Estoque, uOrcamento, uProcura_Cliente, uProcura_Produto,
  UdmConexao, uDm, uQtde, uForma_Pagamento, uCancela_Item, uProcura_Venda,
  uSenhaFiscal, uSuprimento, uSangria, uFechamento_Caixa, uMenu, uProgresso,
  uProcuraDevolucao, uEstornoFinanceiro;

{$R *.dfm}

procedure TfrmPDV.AlteraVenda;
begin
    //Procedimento para alterar uma venda já finalizada
    if (sFStatus = 'F') and (dm.cdsItem_Venda.RecordCount > 0) then
    begin
         setStatusCaixa(svAberto);
    end;
end;

procedure TfrmPDV.AtualizaCDSVenda;
begin
    try
         dm.cdsVenda.Close;
         dm.qryVenda.Close;
         dm.qryVenda.SQL.Clear;
         dm.qryVenda.SQL.Add('SELECT V.N_VENDA, V.DATA_VENDA, V.COD_CLI, V.VAL_TOTAL, V.DINHEIRO, V.CHEQUE, V.CARTAO, V.TICKET, ');
         dm.qryVenda.SQL.Add('V.COD_FUNC, V.STATUS, V.DESCONTO, V.SUB_TOTAL ');
         dm.qryVenda.SQL.Add('FROM VENDA V');
         dm.qryVenda.Open;
         dm.cdsVenda.Open;
    except
         on E:Exception do
             ShowMessage('Erro ao atualizar Vendas!'#13 + E.Message);
    end;
end;

procedure TfrmPDV.btn13Click(Sender: TObject);
begin
    Self.Close;
end;

procedure TfrmPDV.btnConsultarDevolucaoClick(Sender: TObject);
begin
     if (StatusPDV = svFechado) then
     begin
         try
            frmProcuraDevolucao := TfrmProcuraDevolucao.Create(self);
            frmProcuraDevolucao.ShowModal;
         finally
            FreeAndNil(frmProcuraDevolucao);
         end;
     end;
end;

procedure TfrmPDV.btnCancelarItemClick(Sender: TObject);
begin
    CancelarItem;
end;

procedure TfrmPDV.btnCancelarVendaClick(Sender: TObject);
begin
    CancelarVenda;
end;

procedure TfrmPDV.btnConsultarEstoqueClick(Sender: TObject);
begin
    try
        frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
        frmProcura_Estoque.ShowModal;
    finally
        FreeAndNil(frmProcura_Estoque);
    end;
end;

procedure TfrmPDV.btnEstornoFinanceiroClick(Sender: TObject);
begin
    if (StatusPDV = svFechado)  then
     begin
          try
              bFEstornaValor := True;
              frmSenhaFiscal := TfrmSenhaFiscal.Create(nil);
              frmSenhaFiscal.ShowModal;
          finally
               FreeAndNil(frmEstornoFinanceiro);
          end;
     end;
end;

procedure TfrmPDV.btnFinalizarVendaClick(Sender: TObject);
begin
    FinalizarVenda;
end;

procedure TfrmPDV.btnIncluirProdutoClick(Sender: TObject);
begin
    if (StatusPDV = svAberto) then
     begin
          try
              frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
              frmProcura_Estoque.ShowModal;
          finally
              FreeAndNil(frmProcura_Estoque);
          end;
     end;
end;

procedure TfrmPDV.btnIniciarVendaClick(Sender: TObject);
begin
    NewVenda;
end;

procedure TfrmPDV.btnProcurarVendaClick(Sender: TObject);
begin
    if (StatusPDV = svFechado) then
     begin
          try
              frmProcura_Venda := TfrmProcura_Venda.Create(nil);
              frmProcura_Venda.ShowModal;
          finally
              FreeAndNil(frmProcura_Venda);
          end;
     end;
end;

procedure TfrmPDV.btnSangriaClick(Sender: TObject);
begin
     if StatusPDV = svFechado then
     begin
         try
             frmSangria := TfrmSangria.Create(self);
             frmSangria.ShowModal;
         finally
             FreeAndNil(frmSangria);
         end;
     end
     else
        MessageDlg('É necessário que o caixa esteja livre!', mtWarning, [mbOK], 0);
end;

procedure TfrmPDV.btnSuprimentoClick(Sender: TObject);
begin
     if (StatusPDV = svFechado) or (StatusPDV = svBloqueado) then
     begin
         try
             frmSuprimento := TfrmSuprimento.Create(self);
             frmSuprimento.ShowModal;
         finally
             FreeAndNil(frmSuprimento);
         end;
     end
     else
        MessageDlg('É necessário que o caixa esteja livre!', mtWarning, [mbOK], 0);
end;

procedure TfrmPDV.CancelarItem;
begin
    //Procedimento para cancelar item
    if StatusPDV = svAberto then
    begin
        bFCancelaItem := True;
        frmSenhaFiscal := TfrmSenhaFiscal.Create(nil);
        frmSenhaFiscal.ShowModal;
    end;
end;

procedure TfrmPDV.CancelarVenda;
begin
     //Procedimento para cancelar venda
     if StatusPDV = svAberto then
     begin
          if Application.MessageBox('Deseja cancelar essa Venda?', 'Confirmação', MB_YESNO)= mrYes then
          begin
               if not dm.cdsItem_Venda.IsEmpty then
                  dm.cdsItem_Venda.EmptyDataSet;

               LimpaCampos;
               lblVenda.Visible := False;
               setStatusCaixa(svFechado);
               ImprimeCancelaVenda;

               if FVerificacaoImpressora then
               begin
                   Texto := '';
                   Texto := Concat(Texto, '<ce>VENDA CANCELADA</ce>'#10);
                   Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
                   FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
                   FImpressora.AcionaGuilhotina(0);
               end;
          end;
     end;
end;

procedure TfrmPDV.CarregarItem(const TextoDigitado: string);
var
  qtde, item: integer;
  codigo, descricao, valor, subtotal: string;

  procedure DecomporCodigo(const ATexto: string; var AQuantidade: integer; var ACodigo: String);
  var
    PosicaoQuant: Integer;
    CodigoProduto: String;
  begin
      CodigoProduto := Trim(ATexto);
      PosicaoQuant  := pos('*', CodigoProduto);

      if PosicaoQuant > 0 then
      begin
        ACodigo     := Copy(CodigoProduto, PosicaoQuant + 1, Length(CodigoProduto));
        AQuantidade := StrToIntDef(Copy(CodigoProduto, 0, PosicaoQuant - 1), 1);
      end
      else
      begin
        ACodigo     := CodigoProduto;
        aQuantidade := 1;
      end;
  end;
begin
     DecomporCodigo(TextoDigitado, qtde, codigo);

     //Procedimento para carregar os itens na ClientDataSet de itens de venda
     dm.qryItem_Venda.close;
     dm.qryItem_Venda.SQL.Clear;
     dm.qryItem_Venda.SQL.Add(SELECT_ITEM);
     dm.qryItem_Venda.Open;

     dm.cdsItem_Venda.Open;

     //Cria um índice para ordenar pelo campo ID_ITEM
     dm.cdsItem_Venda.IndexFieldNames := 'ID_ITEM';

     dm.cdsEstoque.Open;

     // Verifica se o produto existe no cadastro
     if dm.cdsEstoque.Locate('EAN13', codigo, [loCaseInsensitive, loPartialKey]) then
     begin
         item      := dm.cdsItem_Venda.RecordCount + 1;
         codigo    := dm.cdsEstoque.FieldByName('EAN13').AsString;
         descricao := Copy(dm.cdsEstoque.FieldByName('DESC_PROD').AsString, 1, 24);
         valor     := FormatFloat('##0.00', dm.cdsEstoque.FieldByName('VAL_VENDA').AsFloat);
         subtotal  := FormatFloat('##0.00', dm.cdsEstoque.FieldByName('VAL_VENDA').AsFloat * qtde);

         dm.cdsItem_Venda.Append;
         dm.cdsItem_Venda.FieldByName('ID_ITEM').AsInteger     := dm.cdsItem_Venda.RecordCount + 1;
         dm.cdsItem_Venda.FieldByName('N_VENDA').AsString      := frmPDV.sFNumeroVenda;
         dm.cdsItem_Venda.FieldByName('EAN13').AsString        := dm.cdsEstoque.FieldByName('EAN13').AsString;
         dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString    := dm.cdsEstoque.FieldByName('DESC_PROD').AsString;
         dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat      := dm.cdsEstoque.FieldByName('VAL_VENDA').AsFloat;
         dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat    := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat * qtde;
         dm.cdsItem_Venda.FieldByName('QTDE').AsInteger        := qtde;
         dm.cdsItem_Venda.Post;
         dm.cdsEstoque.Close;

         frmPDV.edtProduto.Text           := copy(dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString, 1, 28);
         frmPDV.edtValor_Unitario.Text    := FormatFloat('#.000', dm.cdsItem_Venda.FieldByName('QTDE').value) + ' x ' + FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat);
         frmPDV.edtSub_total.Text         := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat);
         frmPDV.edtTotal.Text             := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('S_TOTAL').Value);

         ImprimeItemVenda(FormataImpressaoItem(IntToStr(item), codigo, descricao, FormatFloat('##.000', qtde), valor, subtotal, 24));
         if FVerificacaoImpressora then
         begin
             Texto := '';
             Texto := Concat(Texto, '<c>' + FormataImpressaoItem(IntToStr(item), codigo, descricao, FormatFloat('##.000', qtde), valor, subtotal, 24) + '</c>'#10);
             FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
         end;
     end
     else
        MessageDlg('Produto não encontrado!', mtWarning, [mbOK], 0);
end;

procedure TfrmPDV.edtConsultaKeyPress(Sender: TObject; var Key: Char);
var
  TextoDigitado: string;

  function ContarCaracter(const ACaracter: Char; const ATexto: string): Integer;
  var
    Letra: Char;
  begin
    Result := 0;
    for Letra in ATexto do
    begin
      if Letra = ACaracter then
        Result := Result + 1;
    end;
  end;

begin
   if (StatusPDV <> svBloqueado) then
   begin
      try
          TextoDigitado := Trim(edtConsulta.Text);

          case Key of
            '*':
              begin
                // Não deixar digitar mais de um multiplicador
                if (ContarCaracter('*', TextoDigitado) >= 1) then
                  Key := #0;
              end;

            '.', ',':
              begin
                // Não deixar digitar mais de uma virgula
                if (ContarCaracter(',', TextoDigitado) >= 1) then
                  Key := #0
                else
                  Key := ',';
              end;

            #13:
              begin
                  if Trim(TextoDigitado) <> EmptyStr then
                  begin
                      edtConsulta.Enabled := False;
                      try
                        if StatusPDV <> svAberto then
                        begin
                           Self.NewVenda;
                        end;

                        Self.CarregarItem(TextoDigitado);
                        edtConsulta.Clear;
                      finally
                        edtConsulta.Enabled := True;
                        edtConsulta.SetFocus;
                      end;
                  end;
              end;
          end;
      except
          on E: exception do
          begin
              MessageDlg('Erro ao carregar item: ' + E.Message, mtWarning, [mbOK], 0);
          end;
      end;

      if not CharInSet(Key, ['0'..'9', '*', ',', #8]) then
        Key := #0;
   end
   else
      MessageDlg('Caixa está bloqueado!', mtError, [mbOK], 0);
end;

procedure TfrmPDV.FinalizarVenda;
var
  dValDesc: Double;
  qry: TSQLQuery;
begin
     //Procedimento para finalizar venda

     //Verifica se existe uma Venda em Aberto
     if (StatusPDV = svAberto) and (not dm.cdsItem_Venda.IsEmpty) then
     begin
         //Carrega o Form para informar a forma de pagamento
         try
           frmForma_Pagamento := TfrmForma_Pagamento.Create(Self);
           frmForma_Pagamento.ShowModal;
         finally
           FreeAndNil(frmForma_Pagamento);
         end;

         //Verifica se o form forma de pagamento foi finalizado com sucesso
         if not bFResposta then
            Abort;

         //Verifica se a venda já existe no banco de dados
         dm.cdsVenda.Open;
         if not (dm.cdsVenda.Locate('N_VENDA', sFNumeroVenda, [])) then
         begin

             //Verifica se foi informado algum valor para forma de pagamento
             if bFResposta then
             begin
                 try
                     Trans := dmConexao.Conexao.BeginTransaction;

                     //Inseri a venda na banco de dados
                     dm.qryVenda.Close;
                     dm.qryVenda.SQL.Clear;
                     dm.qryVenda.SQL.Add('INSERT INTO VENDA (N_VENDA, COD_CLI, DATA_VENDA, VAL_TOTAL, COD_FUNC, DESCONTO, SUB_TOTAL, DINHEIRO, CHEQUE, CARTAO, TICKET, N_DEVOLUCAO, VALOR_TROCA)'+
                                         'VALUES(:venda, :cli, :data, :total, :func, :desc, :subtotal, :dinheiro, :cheque, :cartao, :ticket, :dev, :troca)');
                     dm.qryVenda.ParamByName('venda').AsString    := sFNumeroVenda;
                     dm.qryVenda.ParamByName('cli').AsString      := sFCod_cli;
                     dm.qryVenda.ParamByName('data').AsDate       := Now;
                     dm.qryVenda.ParamByName('subtotal').AsFloat  := dFSub_total;
                     dm.qryVenda.ParamByName('total').AsFloat     := dFTotal;
                     dm.qryVenda.ParamByName('desc').AsFloat      := dFDesconto;
                     dm.qryVenda.ParamByName('func').AsString     := sFID_Funcionario;
                     dm.qryVenda.ParamByName('dinheiro').AsFloat  := dFDinheiro;
                     dm.qryVenda.ParamByName('cheque').AsFloat    := dFCheque;
                     dm.qryVenda.ParamByName('cartao').AsFloat    := dFCartao;
                     dm.qryVenda.ParamByName('ticket').AsFloat    := dFTicket;
                     dm.qryVenda.ParamByName('dev').AsString      := sFCodigoDevolucao;
                     dm.qryVenda.ParamByName('troca').AsFloat     := dFValeTroca;
                     dm.qryVenda.ExecSQL();

                     ImprimeFinalizacaoVenda;
                     if FVerificacaoImpressora then
                     begin
                         Texto := '';
                         Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
                         Texto := Concat(Texto, '<ad><b>SUBTOTAL R$ ' + FormatFloat('##0.00', dFSub_total) + '</b></ad>'#10);

                         if dFValeTroca > 0 then
                            Texto := Concat(Texto, '<ad><c>VALE TROCA R$ ' + FormatFloat('##.00', dFValeTroca) + '</c></ad>'#10);

                         if dFDesconto > 0 then
                            Texto := Concat(Texto, '<ad><c>DESCONTO(%) ' + FormatFloat('##.00', dFDesconto) + '</c></ad>'#10);

                         Texto := Concat(Texto, '<ad><b>TOTAL R$ ' + FormatFloat('##0.00', dFTotal) + '</b></ad>'#10);
                         Texto := Concat(Texto, '<c>Forma de Pagamento:</c>'#10);

                         if dFDinheiro > 0 then
                            Texto := Concat(Texto, '<c>DINHEIRO R$ ' + FormatFloat('##0.00', dFDinheiro) + '</c>'#10);

                         if dFCheque > 0 then
                            Texto := Concat(Texto, '<c>CHEQUE R$ ' + FormatFloat('##0.00', dFCheque) + '</c>'#10);

                         if dFCartao > 0 then
                            Texto := Concat(Texto, '<c>CARTÃO R$ ' + FormatFloat('##0.00', dFCartao) + '</c>'#10);

                         if dFTicket > 0 then
                            Texto := Concat(Texto, '<c>TICKET R$ ' + FormatFloat('##0.00', dFTicket) + '</c>'#10);

                          if dFValPago > 0 then
                             Texto := Concat(Texto, #10'<c>VALOR PAGO R$ ' + FormatFloat('##0.00', dFValPago) + '</c>'#10);

                         if dFTroco > 0 then
                             Texto := Concat(Texto, '<c>TROCO R$ ' + FormatFloat('##0.00', dFTroco) + '</c>'#10);


                         Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
                         Texto := Concat(Texto, '<ce><c>' + frmMenu.FMsgRodape + '</c></ce>'#10);
                         FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
                         FImpressora.AcionaGuilhotina(0);
                     end;

                     // Verifica se existe desconto, se existir divide pela quantidade itens na venda
                     if dFDesconto > 0 then
                     begin
                         dValDesc := 0;
                         dValDesc := (dFDesconto / dm.cdsItem_Venda.RecordCount);

                         dm.cdsItem_Venda.First;
                         while not dm.cdsItem_Venda.Eof do
                         begin
                             dm.cdsItem_Venda.Edit;
                             dm.cdsItem_Venda.FieldByName('DESCONTO').AsFloat := dValDesc;
                             dm.cdsItem_Venda.Post;
                             dm.cdsItem_Venda.Next;
                         end;
                     end;

                     //Inseri os itens no banco de dados, limpa o DataSet e finaliza transação caso não ocorra erros
                     if dm.cdsItem_Venda.ApplyUpdates(0) > 0 then raise Exception.Create('Falha ao gravar itens!');

                     // Atualiza a tabela de devolução se necessário
                     if sFCodigoDevolucao <> '' then
                     begin
                         dm.cdsDevolucao.Open;
                         if dm.cdsDevolucao.Locate('COD_DEVOLUCAO', sFCodigoDevolucao, [loCaseInsensitive, loPartialKey]) then
                         begin
                             dm.cdsDevolucao.Edit;
                             dm.cdsDevolucao.FieldByName('STATUS').AsString := 'F';
                             dm.cdsDevolucao.Post;
                             if dm.cdsDevolucao.ApplyUpdates(0) > 0 then raise Exception.Create('Falha ao atualizar tabela de devoluções!');
                         end;
                     end;

                     dm.cdsVenda.Close;
                     dm.cdsItem_Venda.EmptyDataSet;
                     LimpaCampos();
                     lblVenda.Caption := '';
                     lblVenda.Visible := False;
                     setStatusCaixa(svFechado);

                     //Finaliza a transação e descarrega o objeto
                     dmConexao.Conexao.CommitFreeAndNil(Trans);
                 except on E:Exception do
                      begin
                        raise Exception.Create('Erro ao gravar Venda:' + #13 +  E.message);
                        dmConexao.Conexao.RollbackFreeAndNil(Trans);
                      end;
                 end;
             end;
         end
         else
         begin
             try
                 Trans := dmConexao.Conexao.BeginTransaction;

                 //Atualiza venda no banco de dados
                 dm.qryVenda.Close;
                 dm.qryVenda.SQL.Clear;
                 dm.qryVenda.SQL.Add('UPDATE VENDA SET N_VENDA=:venda, COD_CLI=:cli, DATA_VENDA=:data, VAL_TOTAL=:total, COD_FUNC=:func, DESCONTO=:desc, SUB_TOTAL=:subtotal, '+
                                     'DINHEIRO=:dinheiro, CHEQUE=:cheque, CARTAO=:cartao, TICKET=:ticket WHERE N_VENDA=:venda');
                 dm.qryVenda.ParamByName('venda').AsString   := sFNumeroVenda;
                 dm.qryVenda.ParamByName('cli').AsString     := sFCod_cli;
                 dm.qryVenda.ParamByName('data').AsDate      := Now;
                 dm.qryVenda.ParamByName('subtotal').AsFloat := dFSub_total;
                 dm.qryVenda.ParamByName('total').AsFloat    := dFTotal;
                 dm.qryVenda.ParamByName('desc').AsFloat     := dFDesconto;
                 dm.qryVenda.ParamByName('func').AsString    := sFID_Funcionario;
                 dm.qryVenda.ParamByName('venda').AsString   := sFNumeroVenda;
                 dm.qryVenda.ParamByName('dinheiro').AsFloat := dFDinheiro;
                 dm.qryVenda.ParamByName('cheque').AsFloat   := dFCheque;
                 dm.qryVenda.ParamByName('cartao').AsFloat   := dFCartao;
                 dm.qryVenda.ParamByName('ticket').AsFloat   := dFTicket;
                 dm.qryVenda.ExecSQL();

                 dValDesc := 0;
                 dValDesc := (dFDesconto / dm.cdsItem_Venda.RecordCount);
                 dm.cdsItem_Venda.First;
                 while not dm.cdsItem_Venda.Eof do
                 begin
                     dm.cdsItem_Venda.Edit;
                     dm.cdsItem_Venda.FieldByName('DESCONTO').AsFloat := dValDesc;
                     dm.cdsItem_Venda.Post;
                     dm.cdsItem_Venda.Next;
                 end;

                 //Inseri os itens no banco de dados, limpa o DataSet e finaliza transação caso não ocorra erros
                 if dm.cdsItem_Venda.ApplyUpdates(0) > 0 then
                    raise Exception.Create('Falha ao gravar itens!');

                 dm.cdsItem_Venda.EmptyDataSet;
                 LimpaCampos();
                 setStatusCaixa(svFechado);

                 //Finaliza a transação e descarrega o objeto
                 dmConexao.Conexao.CommitFreeAndNil(Trans);
             except on E:Exception do
                  begin
                    raise Exception.Create('Erro ao gravar Venda:' + #13 +  E.message);
                  end;
             end;
         end;
         self.AtualizaCDSVenda;
         Self.StatusPDV := svFechado;
     end
     else
     begin
         ShowMessage('1 - Não existe Venda em aberto'#10#13'2 - Não existe itens nessa venda!');
     end;
end;

procedure TfrmPDV.FormActivate(Sender: TObject);
begin
    if not VerificaAberturaCaixa then
    begin
        try
           frmSuprimento := TfrmSuprimento.Create(self);
           frmSuprimento.ShowModal;
        finally
           FreeAndNil(frmSuprimento);
        end;
    end
    else
         setStatusCaixa(svFechado);

end;

function TfrmPDV.FormataImpressaoItem(Item, Codigo, Descricao, Qtde, Valor,
  Subtotal: string; Limite: Integer): string;
var
   retorno, desc, qt, v1, v2: string;
   i: Integer;
begin
     desc := Descricao;

     if Limite > Length(Descricao) then
     begin
         for i := 1 to (Limite - Length(Descricao)) do
             desc := desc + ' ';
     end;

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
     retorno := Concat(retorno, ' '+v1);
     retorno := Concat(retorno, ' '+v2);

     Result := retorno;
end;

procedure TfrmPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if StatusPDV = svAberto then
     begin
         MessageDlg('Existem uma venda em andamento, execute uma das sugestões abaixo!'#13'- Finalize a venda.'#13'- Cancele a venda.', mtWarning, [mbOK], 0);
         Abort;
     end
     else
     begin
        dm.cdsVenda.Close;
        dm.cdsItem_Venda.Close;
        FreeAndNil(FImpressora);
        Action := caFree;
        frmPDV := nil;
     end;
end;

procedure TfrmPDV.FormCreate(Sender: TObject);
begin
     setStatusCaixa(svBloqueado);
     FImpressora    := TImpressora.Create(miEpson, PAnsiChar('USB'));
     Self.Caption   := Application.Title + ' : PDV';
     redtItem.Color := HexToTColor('FFFFCC');
     lblData.Caption:= FormatDateTime('dd/mm/yyyy', Date);
     lblTitulo.Caption := Application.Title;
     lblVersao.Caption := 'Versão: ' + frmMenu.GetBuildInfo;
end;

procedure TfrmPDV.FormShow(Sender: TObject);
begin
    try
        frmProgresso := TfrmProgresso.Create(nil);
        frmProgresso.Show;
    finally
        FreeAndNil(frmProgresso);
    end;
end;

procedure TfrmPDV.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
     inherited;
     if Key = VK_F1 then btnConsultarEstoque.Click;
     if Key = VK_F2 then NewVenda;
     if key = VK_F3 then FinalizarVenda;
     if (Key = VK_F4) and (not dm.cdsItem_Venda.IsEmpty) and (StatusPDV = svAberto) then btnConsultarDevolucao.Click;
     if (Key = VK_F5) and (StatusPDV = svFechado) then btnEstornoFinanceiro.Click;
     if Key = VK_F6   then CancelarVenda;
     if (Key = VK_F8) and (StatusPDV = svAberto) then btnIncluirProduto.Click;
     if (Key = VK_F9) and (StatusPDV = svFechado) then btnProcurarVenda.Click;
     if Key = VK_F10    then btnSangria.Click;
     if Key = VK_F11    then btnSuprimento.Click;
     if Key = VK_DELETE then CancelarItem;
end;

procedure TfrmPDV.lbl4Click(Sender: TObject);
var
    buffer: String;
begin
      buffer := lbl4.Caption;
      ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmPDV.lbl4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    lbl4.Font.Style := lbl4.Font.Style + [fsUnderline];
end;

procedure TfrmPDV.LimpaCampos;
begin
    inherited;
    if not dm.cdsItem_Venda.IsEmpty then
       dm.cdsItem_Venda.EmptyDataSet;

    sFNumeroVenda    := '';
    sFCodCliente     := '';
    sFStatus         := '';
    sFID_Funcionario := '';
    sFCod_cli        := '';
    dFDesconto       := 0;
    dFSub_total      := 0;
    dFTotal          := 0;
    dFDinheiro       := 0;
    dFCheque         := 0;
    dFCartao         := 0;
    dFTicket         := 0;
    dFValPago        := 0;
    dFTroco          := 0;
    dFValeTroca      := 0;
    bFResposta       := false;
    sFCodigoDevolucao := '';

end;

{procedure TfrmPDV.GeraNfe;
var
  NumItem: integer;
begin
    //Verifica se um registro foi selecionado
    if dm.cdsVenda.RecordCount = 0 then
    begin
         ShowMessage('É necessário selecionar um Pedido!');
         Abort;
    end;

    if not dm.Busca_ItemPedido(lblVenda.Caption) then
    begin
        ShowMessage('Não existe itens nesse Pedido!');
        Abort;
    end;

    dm.ACBrNFe.NotasFiscais.Clear;

    //Repasse de informações para o componente ACBrNFe
    with dm.ACBrNFe.NotasFiscais.Add.NFe do
    begin
        Ide.cNF     := 000001;
        Ide.natOp   := 'VENDA';
        Ide.indPag  := ipVista;
        Ide.modelo  := 55;
        Ide.serie   := 1;
        Ide.nNF     := 000001;
        Ide.dEmi    := now;
        Ide.dSaiEnt := now;
        Ide.tpNF    := tnSaida;

        //Tipo de ambiente (0 - Produção, 1 - Homologação)
        if dmConexao.nAmbiente = 0 then
           Ide.tpAmb  := taProducao
        else
           Ide.tpAmb  := taHomologacao;

        Ide.verProc := '2.00';
        Ide.cUF     := dmConexao.nCod_UF;
        Ide.cMunFG  := dmConexao.nCod_municipio;
        Ide.finNFe  := fnNormal;

        //Dados do Emitente
        Emit.CNPJCPF           := dmConexao.sCNPJ;
        Emit.IE                := dmConexao.sI_E;
        Emit.IEST              := '';
        Emit.xNome             := dmConexao.sFantasia;
        Emit.xFant             := dmConexao.sFantasia;
        Emit.IM                := '';
        Emit.CNAE              := '';
        Emit.EnderEmit.xLgr    := dmConexao.sEndereco;
        Emit.EnderEmit.nro     := dmConexao.sNumero;
        Emit.EnderEmit.xCpl    := '';
        Emit.EnderEmit.xBairro := dmConexao.sBairro;
        Emit.EnderEmit.cMun    := dmConexao.nCod_municipio;
        Emit.EnderEmit.xMun    := dmConexao.sCidade;
        Emit.EnderEmit.UF      := dmConexao.sUF;
        Emit.EnderEmit.CEP     := StrToInt(dmConexao.sCEP);
        Emit.EnderEmit.fone    := dmConexao.sTelefone;
        Emit.EnderEmit.cPais   := dmConexao.nCod_pais;
        Emit.EnderEmit.xPais   := dmConexao.sPais;

        //Dados de Destinatário
        //Dest.CNPJCPF           :=
        //Dest.IE                :=
        //Dest.ISUF              :=
        //Dest.xNome             :=
        //Dest.EnderDest.xLgr    :=
        //Dest.EnderDest.nro     :=
        //Dest.EnderDest.xCpl    :=
        //Dest.EnderDest.xBairro :=
        //Dest.EnderDest.cMun    :=
        //Dest.EnderDest.xMun    :=
        //Dest.EnderDest.UF      :=
        //Dest.EnderDest.CEP     :=
        //Dest.EnderDest.cPais   :=
        //Dest.EnderDest.xPais   :=
        //Dest.EnderDest.fone    :=

        //Dados da Entrega
        //Entrega.xLgr           :=
        //Entrega.nro            :=
        //Entrega.xCpl           :=
        //Entrega.xBairro        :=
        //Entrega.cMun           :=
        //Entrega.xMun           :=
        //Entrega.UF             :=

        //Informações dos itens
        NumItem := 0;
        dm.cdsItem_Venda.First;
        while not dm.cdsItem_Venda.Eof do
        begin
             dm.Busca_Produto(dm.cdsItem_Venda.FieldByName('REF_PROD').AsString);
             Inc(NumItem);
             with Det.Add do
             begin
                 Prod.nItem   := NumItem;
                 Prod.cProd   := dm.cdsItem_Venda.FieldByName('REF_PROD').AsString;
                 Prod.cEAN    := dm.cdsProduto.FieldByName('EAN13').AsString;
                 Prod.xProd   := dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString;
                 Prod.NCM     := dm.cdsProduto.FieldByName('CODIGO_NCM').AsString;
                 Prod.EXTIPI  := '';

                 case dm.cdsItem_Venda.FieldByName('TIPOPROD').AsInteger of
                     0, 1, 2, 4: Prod.CFOP := '5405';
                 else
                     Prod.CFOP    := '5405';
                 end;

                 Prod.uCom     := dm.cdsProduto.FieldByName('UND').AsString;
                 Prod.qCom     := dm.cdsItem_Venda.FieldByName('QTDE').AsFloat;
                 Prod.vUnCom   := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat;

                 //Campos de Tributação
                 Prod.cEANTrib := '';
                 Prod.uTrib    := dm.cdsProduto.FieldByName('UND').AsString;
                 Prod.qTrib    := dm.cdsItem_Venda.FieldByName('QTDE').AsFloat;
                 Prod.vUnTrib  := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat;

                 Prod.vFrete    := 0;
                 Prod.vSeg      := 0;
                 Prod.vProd     := dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat;
                 Prod.vDesc     := 0;
                 Prod.IndTot    := itSomaTotalNFe;

                 with Imposto do
                 begin
                     with ICMS do
                     begin
                        CST         := cst41;
                        II.vBc      := 0;
                        II.vDespAdu := 0;
                        II.vII      := 0;
                        II.vIOF     := 0;
                     end;
                 end;
             end;
            dm.cdsItem_Venda.Next;
        end;

        Total.ICMSTot.vProd := dm.cdsVenda.FieldByName('VAL_TOTAL').AsFloat;
        Total.ICMSTot.vDesc := dm.cdsVenda.FieldByName('DESCONTO').AsFloat;
        Total.ICMSTot.vII   := 0;
        Total.ICMSTot.vDesc := 0;
        Total.ICMSTot.vNF   := dm.cdsVenda.FieldByName('VAL_TOTAL').AsFloat;
    end;

    dm.ACBrNFe.NotasFiscais.GerarNFe;
    dm.ACBrNFe.NotasFiscais.SaveToFile(dmConexao.sPath_Arquivo, false);
    ShowMessage('Arquivo xml gerado com sucesso! ' + dm.ACBrNFe.NotasFiscais.Items[0].NomeArq);
end;      }

function TfrmPDV.GeraNVenda: string;
var
   qryCodigo: TSQLQuery;
begin
    //Função para gerar número da Venda
    try
        try
            qryCodigo := TSQLQuery.Create(nil);
            qryCodigo.SQLConnection := dmConexao.Conexao;

            qryCodigo.Close;
            qryCodigo.SQL.Clear;
            qryCodigo.SQL.Add('SELECT CODIGO FROM sp_formata_numero(GEN_ID(gen_venda_id, 1), :dt)');
            qryCodigo.ParamByName('dt').AsString := FormatDateTime('mmyy', Now);
            qryCodigo.Open;

            Result := qryCodigo.Fields[0].AsString;
        except
            on E:Exception do
            ShowMessage('Erro gerar Código da Venda!'#13#10 + E.Message);
        end;
    finally
        FreeAndNil(qryCodigo);
    end;
end;

procedure TfrmPDV.grddbgrdCellClick(Column: TColumn);
begin
     //Carrega os valores no Form PDV
     edtProduto.Text        := dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString;
     edtValor_Unitario.Text := IntToStr(dm.cdsItem_Venda.FieldByName('QTDE').AsInteger) + ' x ' + FormatFloat('##0.00', dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat);
     edtSub_total.Text      := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat);
end;

procedure TfrmPDV.grddbgrdDblClick(Sender: TObject);
begin
    //Carrega o FormQtde para alterar a qtde do item
    if StatusPDV = svAberto then
    begin
        try
           frmQtde := TfrmQtde.Create(self);
           frmQtde.ShowModal;
        finally
           FreeAndNil(frmQtde);
        end;
    end;
end;

function TfrmPDV.HexToTColor(sColor: string): TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

procedure TfrmPDV.ImprimeCancelaItem(Item, Descricao: string);
begin
    redtItem.Paragraph.Alignment := taLeftJustify;
    redtItem.Lines.Add(#10'ITEM ' + Item + ' *' + Descricao + '* CANCELADO'#10);
end;

procedure TfrmPDV.ImprimeCancelaVenda;
begin
    redtItem.Paragraph.Alignment := taCenter;
    redtItem.Lines.Add('VENDA CANCELADA');
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
end;

procedure TfrmPDV.ImprimeFinalizacaoVenda;
begin
    redtItem.Paragraph.Alignment := taCenter;
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));

    redtItem.Paragraph.Alignment := taRightJustify;
    redtItem.SelAttributes.Style:=[fsBold];
    redtItem.Lines.Add('SUBTOTAL R$ ' + FormatFloat('##0.00', dFSub_total));

    if dFValeTroca > 0 then
       redtItem.Lines.Add('VALE TROCA R$ ' + FormatFloat('##.00', dFValeTroca));

    if dFDesconto > 0 then
       redtItem.Lines.Add('DESCONTO(%) ' + FormatFloat('##.00', dFDesconto));

    redtItem.Paragraph.Alignment := taRightJustify;
    redtItem.SelAttributes.Style:=[fsBold];
    redtItem.Lines.Add('TOTAL R$ ' + FormatFloat('##0.00', dFTotal));
    redtItem.SelAttributes.Style:=[];
    redtItem.Paragraph.Alignment := taLeftJustify;

    redtItem.Lines.Add('Forma de Pagamento:');

    if dFDinheiro > 0 then
       redtItem.Lines.Add('DINHEIRO R$ ' + FormatFloat('##0.00', dFDinheiro) + #10);

    if dFCheque > 0 then
       redtItem.Lines.Add('CHEQUE R$ ' + FormatFloat('##0.00', dFCheque));

    if dFCartao > 0 then
       redtItem.Lines.Add('CARTÃO R$ ' + FormatFloat('##0.00', dFCartao));

    if dFTicket > 0 then
       redtItem.Lines.Add('TICKET R$ ' + FormatFloat('##0.00', dFTicket));

    if dFValPago > 0 then
       redtItem.Lines.Add('VALOR PAGO R$ ' + FormatFloat('##0.00', dFValPago));

    if dFTroco > 0 then
       redtItem.Lines.Add('TROCO R$ ' + FormatFloat('##0.00', dFTroco));

    redtItem.Paragraph.Alignment := taCenter;
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
    redtItem.Lines.Add(frmMenu.FMsgRodape);
end;

procedure TfrmPDV.ImprimeItemVenda(Texto: string);
begin
     redtItem.Paragraph.Alignment := taCenter;
     redtItem.Lines.Add(Texto);
end;

procedure TfrmPDV.ImprimiCabecalho;
begin
    redtItem.Paragraph.Alignment := taCenter;
    redtItem.Lines.Add(frmMenu.FMsgCabecalho);
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
    redtItem.Lines.Add('*** ' + frmMenu.FRazao + ' ***');
    redtItem.Lines.Add('CNPJ: ' + frmMenu.FCNPJ  + ' Inscrição Estadual: '+ frmMenu.FInscricao);
    redtItem.Lines.Add('Rua: '+ frmMenu.FRua +', Número: '+ frmMenu.FNumero+ ' Bairro: ' + frmMenu.FBairro);
    redtItem.Lines.Add('Cidade: ' + frmMenu.FCidade);
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
    redtItem.Lines.Add('DATA: ' + FormatDateTime('dd/mm/yyyy', Date) + ' - HORA: ' +  FormatDateTime('hh:mm:ss', time) + '         VENDA NUMERO: ' + sFNumeroVenda);
    redtItem.Lines.Add(Format('%1s %5s %19s %14s %8s %8s', ['ITEM', 'CODIGO', 'DESCRICAO', 'QTDE', 'VALOR', 'TOTAL']));
    redtItem.Lines.Add(TImpressora.InseriTraco(66, false, false));
end;

procedure TfrmPDV.NewVenda;
var
   nVenda : string;
begin
     //Procedimento iniciar uma nova venda

     if StatusPDV = svFechado then
     begin
         LimpaCampos();
         sFNumeroVenda := GeraNVenda;
         sFCodCliente  := '001';
         setStatusCaixa(svAberto);
         lblVenda.Visible := True;
         lblVenda.Caption := 'Venda Número: ' + sFNumeroVenda;
         redtItem.Clear;
         ImprimiCabecalho;

         if FVerificacaoImpressora then
         begin
            nVenda := 'VENDA NUMERO: ' + sFNumeroVenda;
            Texto := '';
            Texto := Concat(Texto, '<c>' + Format('%s %s %28s', ['DATA: '+FormatDateTime('dd/mm/yyyy', Date), ' - HORA: '+FormatDateTime('hh:mm:ss', time), nVenda]) + '</c>'#10);
            Texto := Concat(Texto, '<c>ITEM    CODIGO           DESCRICAO          QTDE   VALOR   TOTAL</c>'#10);
            Texto := Concat(Texto, FImpressora.InseriTraco(48, False, true));
            FImpressora.ImprimeTextoTag(PAnsiChar(Texto), true);
         end;
     end
     else
        if StatusPDV = svAberto then
           MessageDlg('Existe uma venda em andamento!', mtWarning, [mbOK], 0)
        else
           MessageDlg('O caixa está bloqueado!', mtWarning, [mbOK], 0)
end;

procedure TfrmPDV.pnl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    lbl4.Font.Style := lbl4.Font.Style - [fsUnderline];
end;

procedure TfrmPDV.setStatusCaixa(Status: TStatusVenda);
begin
    if Status = svAberto then
    begin
       edtStatus.Font.Color:= clHighlight;
       edtStatus.Text := 'Venda Aberta';
    end
    else
       if Status = svFechado then
       begin
          edtStatus.Font.Color:= clGreen;
          edtStatus.Text := 'Caixa Livre';
       end
       else
       begin
          edtStatus.Font.Color:= clRed;
          edtStatus.Text := 'Bloqueado';
       end;

    StatusPDV := Status;
end;

procedure TfrmPDV.tmr1Timer(Sender: TObject);
begin
    lblHora.Caption:= FormatDateTime('hh:mm:ss', time);
end;

function TfrmPDV.VerificaAberturaCaixa: Boolean;
var
   qry: TSQLQuery;
begin
     try
         qry := TSQLQuery.Create(nil);
         qry.SQLConnection := dmConexao.Conexao;

         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add('SELECT VALOR_PAGAMENTO, TIPO_DOCUMENTO FROM CAIXA WHERE DATA_ENTRADA = :data AND TIPO_DOCUMENTO = :tipo');
         qry.ParamByName('data').AsDate  := Date;
         qry.ParamByName('tipo').AsString:= 'S';
         qry.Open;

         if qry.IsEmpty then
         begin
             MessageDlg('É necessário abrir o caixa para a data atual!'#13'Informe o suprimento inicial.', mtInformation, [mbOK], 0);
             setStatusCaixa(svBloqueado);
             Result := False;
         end
         else
             Result := True;


     except
         on E:Exception do
         MessageDlg('Erro ao verificar registros do caixa: ' + E.Message, mtWarning, [mbOK], 0);
     end;
end;

end.
