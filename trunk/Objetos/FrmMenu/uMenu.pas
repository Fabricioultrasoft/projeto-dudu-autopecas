unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, jpeg, Buttons, ImgList, ToolWin,
  uVendas_Produto, uLogin, ActnList, IOUtils, StdCtrls, Mask, JvExMask,
  JvToolEdit, JvCombobox, JvExStdCtrls, SqlExpr, ACBrBase, ACBrECF;

type
  TfrmMenu = class(TForm)
    mmMenu: TMainMenu;
    stbStatus: TStatusBar;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    imgMenu: TImage;
    Timer: TTimer;
    Cadastro1: TMenuItem;
    ToolBar1: TToolBar;
    btnCliente: TToolButton;
    ImageList: TImageList;
    btnFornecedor: TToolButton;
    btnProduto: TToolButton;
    btnEntrada: TToolButton;
    btnVenda: TToolButton;
    btnOrcamento: TToolButton;
    btnEstoque: TToolButton;
    btnAgenda: TToolButton;
    btnCaixa: TToolButton;
    btnFechar: TToolButton;
    Estoque1: TMenuItem;
    CadastrarProduto1: TMenuItem;
    EntradadeProduto1: TMenuItem;
    ConsultarEstoque1: TMenuItem;
    Segurana1: TMenuItem;
    CadastrarUsurio1: TMenuItem;
    EfetuarLogin1: TMenuItem;
    Venda1: TMenuItem;
    EfetuarVenda1: TMenuItem;
    Acessrios1: TMenuItem;
    CadastrarContatos1: TMenuItem;
    Fecham1: TMenuItem;
    ProdutosVendidos1: TMenuItem;
    actlst: TActionList;
    actFechar: TAction;
    actCliente: TAction;
    actFornecedor: TAction;
    actProduto: TAction;
    actEntrada: TAction;
    actVenda: TAction;
    actEstoque: TAction;
    actAgenda: TAction;
    actCaixa: TAction;
    actGrupo: TAction;
    actLogin: TAction;
    actUsuario: TAction;
    actProdutos_Vendidos: TAction;
    F2CLIENTE1: TMenuItem;
    F3FORNECEDOR1: TMenuItem;
    GRUPO1: TMenuItem;
    N1: TMenuItem;
    CONFIGURAO1: TMenuItem;
    actConfiguracao: TAction;
    Sobre1: TMenuItem;
    Informaes1: TMenuItem;
    UNIDADE1: TMenuItem;
    actUnidade: TAction;
    DESCARTE1: TMenuItem;
    actDescarte: TAction;
    procedure FormCreate(Sender: TObject);
    function DataPorExtenso: String;
    procedure TimerTimer(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFecharExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actFornecedorExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure actEntradaExecute(Sender: TObject);
    procedure actVendaExecute(Sender: TObject);
    procedure actOrcamentoExecute(Sender: TObject);
    procedure actEstoqueExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actCaixaExecute(Sender: TObject);
    procedure actGrupoExecute(Sender: TObject);
    procedure actProdutos_VendidosExecute(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    function GetBuildInfo:string;
    function FormataCaptionMenu: string;
    procedure Informaes1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure actConfiguracaoExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actDescarteExecute(Sender: TObject);
  private
    { Private declarations }
  public
     FRazao       : string;
     FRua         : string;
     FNumero      : string;
     FBairro      : string;
     FCidade      : string;
     FUF          : string;
     FCNPJ        : string;
     FInscricao   : string;
     FProprietario: string;
     FFone        : string;
     FMsgCabecalho: string;
     FMsgRodape   : string;
     FModelo      : string;
     FPorta       : string;
     FVelocidade  : string;
     FMensagem    : TStringBuilder;
     FCabSangria  : Boolean;
     FCabSuprimento  : Boolean;
     FCabFechamento : Boolean;
     FCodUser     : string;
     FUser        : string;
     FNomeUser    : string;
     FPrivilegio  : string;

     function VerificaConfig(): Boolean;
  end;

var
  frmMenu: TfrmMenu;
   Arq: TFile;

const
   // Intrução SQL para carregar os dados da Empresa
   SELECT_EMPRESA: string = 'SELECT RAZAO, RUA, BAIRRO, NUMERO, CIDADE, UF, CNPJ, INSCRICAO_ESTADUAL, PROPRIETARIO, FONE FROM EMPRESA';

   // Intrução SQL para carregar os dados gerais
   SELECT_GERAL : string = 'SELECT MODELO_IMPRESSORA, PORTA, VELOCIDADE, MSG_CABECALHO, MSG_RODAPE, CABECALHO_SANGRIA, CABECALHO_SUPRIMENTO, CABECALHO_FECHAMENTO FROM CONFIG';

implementation

uses UdmConexao, uCad_Usuario, uCad_Grupo, uCad_Cliente, uCad_Fornecedor,
  uCad_Produto, uProcura_Estoque, uEntrada_Produtos, uAgenda, uOrcamento, uPDV,
  uFechamento_Caixa, USobre, USplash, uSangria, uSuprimento, uCadUnidade,
  uConfig, uAviso, uProgresso, uImpressoraBase,
  uImpressoraEpson, uCadDescarte;

{$R *.dfm}

function TfrmMenu.FormataCaptionMenu: string;
var
   Str: TStringBuilder;
//frmMenu.Caption := Application.Title + '  -  Versão: [' + GetBuildInfo + ']  -  Última atualização: ['+DateToStr(Arq.GetLastWriteTime(Application.ExeName))+']...';
begin
     try
         Str := TStringBuilder.Create;
         Str.Append(Application.Title);
         Str.Append(' - Versão: [' + GetBuildInfo + ']');
         Str.Append(' - Última atualização: [' + DateToStr(Arq.GetLastWriteTime(Application.ExeName)) + ']');
         Str.Append(' - Servidor: [' + dmConexao.conn.Hostname + '] ...');

         Result := Str.ToString;
     finally
          FreeAndNil(Str);
     end;
end;

//Função Captura o Build do executável
function TfrmMenu.GetBuildInfo:string;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1, V2, V3, V4: Word;
    Prog,ultimo : string;
begin
    Prog := Application.Exename;
    VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
    with VerValue^ do
    begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    ultimo := Copy ('100' + IntToStr(v4), 4, 2);

    result := Copy ('100'+IntToStr (v1), 4, 2) + '.' +
              Copy ('100'+IntToStr (v2), 4, 2) + '.' +
              Copy ('100'+IntToStr (v3), 4, 2) + '.' +
              Copy ('100'+IntToStr (v4), 4, 2);
end;

procedure TfrmMenu.Informaes1Click(Sender: TObject);
begin
    try
      frmSobre := TfrmSobre.Create(self);
      frmSobre.ShowModal;
    finally
      FreeAndNil(frmCadAgenda);
    end;
end;

procedure TfrmMenu.actAgendaExecute(Sender: TObject);
begin
    try
      frmCadAgenda := TfrmCadAgenda.Create(self);
      frmCadAgenda.ShowModal;
    finally
      FreeAndNil(frmCadAgenda);
    end;
end;

procedure TfrmMenu.actCaixaExecute(Sender: TObject);
begin
    try
       frmFechamento_Caixa := TfrmFechamento_Caixa.Create(self);
       frmFechamento_Caixa.ShowModal;
     finally
       FreeAndNil(frmFechamento_Caixa);
     end;
end;

procedure TfrmMenu.actClienteExecute(Sender: TObject);
begin
    try
       frmCadCliente := TfrmCadCliente.Create(self);
       frmCadCliente.ShowModal;
     finally
       FreeAndNil(frmCadCliente);
     end;
end;

procedure TfrmMenu.actConfiguracaoExecute(Sender: TObject);
begin
    try
      frmConfig := TfrmConfig.Create(self);
      frmConfig.ShowModal;
    finally
      FreeAndNil(frmConfig);
    end;
end;

procedure TfrmMenu.actDescarteExecute(Sender: TObject);
begin
    try
      frmDescarte := TfrmDescarte.Create(self);
      frmDescarte.ShowModal;
    finally
      FreeAndNil(frmDescarte);
    end;
end;

procedure TfrmMenu.actEntradaExecute(Sender: TObject);
begin
    try
      frmEntrada_Produtos := TfrmEntrada_Produtos.Create(self);
      frmEntrada_Produtos.ShowModal;
    finally
      FreeAndNil(frmEntrada_Produtos);
    end;
end;

procedure TfrmMenu.actEstoqueExecute(Sender: TObject);
begin
    try
       frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
       frmProcura_Estoque.ShowModal;
     finally
       FreeAndNil(frmProcura_Estoque);
     end;
end;

procedure TfrmMenu.actFecharExecute(Sender: TObject);
begin
    dmConexao.Conexao.Close;
    Application.Terminate;
end;

procedure TfrmMenu.actFornecedorExecute(Sender: TObject);
begin
    try
     frmCadFornecedor := TfrmCadFornecedor.Create(self);
     frmCadFornecedor.ShowModal;
   finally
     FreeAndNil(frmCadFornecedor);
   end;
end;

procedure TfrmMenu.actGrupoExecute(Sender: TObject);
begin
    try
      frmCadGrupo := TfrmCadGrupo.Create(self);
      frmCadGrupo.ShowModal;
    finally
      FreeAndNil(frmCadGrupo);
    end;
end;

procedure TfrmMenu.actLoginExecute(Sender: TObject);
begin
    try
      frmLogin := TfrmLogin.Create(nil);
      frmLogin.ShowModal;
    finally
       FreeAndNil(frmLogin);
    end;
end;

procedure TfrmMenu.actOrcamentoExecute(Sender: TObject);
begin
    try
      frmOrcamento := TfrmOrcamento.Create(Self);
      frmOrcamento.ShowModal;
    finally
      FreeAndNil(frmOrcamento);
    end;
end;

procedure TfrmMenu.actProdutoExecute(Sender: TObject);
begin
    try
       frmCadProduto := TfrmCadProduto.Create(self);
       frmCadProduto.ShowModal;
     finally
       FreeAndNil(frmCadProduto);
     end;
end;

procedure TfrmMenu.actProdutos_VendidosExecute(Sender: TObject);
begin
    try
      frmVendas_Produto := TfrmVendas_Produto.Create(self);
      frmVendas_Produto.ShowModal;
    finally
      FreeAndNil(frmVendas_Produto);
    end;
end;

procedure TfrmMenu.actUnidadeExecute(Sender: TObject);
begin
    try
        frmCadUnidade := TfrmCadUnidade.Create(self);
        frmCadUnidade.ShowModal;
     finally
         FreeAndNil(frmCadUnidade);
     end;
end;

procedure TfrmMenu.actUsuarioExecute(Sender: TObject);
begin
     try
      frmCadUsuario := TfrmCadUsuario.Create(self);
      frmCadUsuario.ShowModal;
    finally
      FreeAndNil(frmCadUsuario);
    end;
end;

procedure TfrmMenu.actVendaExecute(Sender: TObject);
begin
    try
      frmPDV := TfrmPDV.Create(self);
      frmPDV.ShowModal;
    finally
      FreeAndNil(frmPDV);
    end;
end;

procedure TfrmMenu.btn1Click(Sender: TObject);
begin
    try
    frmProgresso := TfrmProgresso.Create(self);
    frmProgresso.ShowModal;
    finally
     FreeAndNil(frmProgresso);
    end;
end;

procedure TfrmMenu.btnSairClick(Sender: TObject);
begin
     Application.Terminate;
end;


procedure TfrmMenu.Button1Click(Sender: TObject);
var
   print: TImpressoraBase;
begin

end;

//Função retorna dia da semana por extenso
function Tfrmmenu.DataPorExtenso: String;
const
     Semana : Array [1..7] of String = ('Domingo', 'Segunda-Feira', 'Terça-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira', 'Sábado');
var
    DiaSem : Word;
begin
    DiaSem:=DayOfWeek(Now);
    Result := Semana[DiaSem] + ', ' + FormatDateTime('dd "de" mmmm "de" yyyy', Now);
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action  := caFree;
     frmMenu := nil;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
    try
      frmLogin := TfrmLogin.Create(nil);
      frmLogin.ShowModal;
    finally
       FreeAndNil(frmLogin);
    end;

    dmConexao.Conexao.Connected := True;
    frmMenu.Caption := FormataCaptionMenu;
    stbStatus.Panels[1].Text := frmMenu.FUser;
    stbStatus.Panels[3].Text := frmMenu.FPrivilegio;

    if FileExists(ExtractFilePath(Application.ExeName) + 'Imagens\ImgLogo.jpg') then
    begin
        imgMenu.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Imagens\ImgLogo.jpg');
    end;
end;

procedure TfrmMenu.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then
     begin
         Application.Terminate;
     end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
     if not VerificaConfig then
    begin
        try
            FMensagem := TStringBuilder.Create;

            FMensagem.Append(#10#13'*** SEJA BEM VINDO ao ' + Application.Title + ' ***'#10#13#10#13);
            FMensagem.Append(#10#13'Para iniciar suas atividades nesse sistema é necessário executar algumas configurações!'#10#13#10#13);
            FMensagem.Append(#10#13'1 - Acesse o Menu Acessórios e clique na opção Configuração.'#10#13#10#13);
            FMensagem.Append(#10#13'2 - Na aba "Informações da Empresa" preencha todos os dados solicitados.'#10#13#10#13);
            FMensagem.Append(#10#13'3 - Na aba "Geral" informe os dados da impressora não fiscal que será utilizada.'#10#13#10#13);
            FMensagem.Append(#10#13'Obrigado pela preferência !'#10#13#10#13);
            FMensagem.Append(#10#13'Dúvidas entre em contato com William'#10#13);
            FMensagem.Append(#10#13'Celular Vivo: (11)99845-2278'#10#13);
            FMensagem.Append(#10#13'E-mail: wllfl@ig.com.br'#10#13);
            FMensagem.Append(#10#13'Skype: willfl2'#10#13);

            frmMenu.Update;
            frmAviso := TfrmAviso.Create(nil);
            frmAviso.ShowModal;
        finally
            FreeAndNil(FMensagem);
        end;
    end;
end;

procedure TfrmMenu.TimerTimer(Sender: TObject);
begin
    //Preenche data por extenso e hora nos respectivos panels
    stbStatus.Panels[5].Text := DataPorExtenso;
    stbStatus.Panels[7].Text := FormatDateTime('HH:MM:SS', Time);
end;

function TfrmMenu.VerificaConfig: Boolean;
var
   qry1, qry2: TSQLQuery;
begin
    try
       qry1 := TSQLQuery.Create(nil);
       qry1.SQLConnection := dmConexao.Conexao;

       qry2 := TSQLQuery.Create(nil);
       qry2.SQLConnection := dmConexao.Conexao;

       qry1.Close;
       qry1.SQL.Clear;
       qry1.SQL.Add(SELECT_EMPRESA);
       qry1.Open;

       qry2.Close;
       qry2.SQL.Clear;
       qry2.SQL.Add(SELECT_GERAL);
       qry2.Open;

       if (qry1.IsEmpty) or (qry2.IsEmpty) then
          Result := False
       else
       begin
          FRazao        := qry1.Fields[0].AsString;
          FRua          := qry1.Fields[1].AsString;
          FNumero       := qry1.Fields[2].AsString;
          FBairro       := qry1.Fields[3].AsString;
          FCidade       := qry1.Fields[4].AsString;
          FUF           := qry1.Fields[5].AsString;
          FCNPJ         := qry1.Fields[6].AsString;
          FInscricao    := qry1.Fields[7].AsString;
          FProprietario := qry1.Fields[8].AsString;
          FFone         := qry1.Fields[9].AsString;

          FModelo       := qry2.Fields[0].AsString;
          FPorta        := qry2.Fields[1].AsString;
          FVelocidade   := qry2.Fields[2].AsString;
          FMsgCabecalho := qry2.Fields[3].AsString;
          FMsgRodape    := qry2.Fields[4].AsString;
          FCabSangria    := Boolean(qry2.Fields[5].AsInteger);
          FCabSuprimento := Boolean(qry2.Fields[6].AsInteger);
          FCabFechamento := Boolean(qry2.Fields[7].AsInteger);

          Result := True;
       end;
    except
         on E:Exception do
         MessageDlg('Erro ao carregar dados: ' + E.Message, mtError, [mbOK], 0);
    end;
end;

end.
