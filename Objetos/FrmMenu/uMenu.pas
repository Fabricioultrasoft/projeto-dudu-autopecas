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
    actACL: TAction;
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
    actLogin: TAction;
    LOGIN1: TMenuItem;
    btnConfiguracao: TToolButton;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actRelacaoVendas: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    actBackupRestore: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    actGerarEtiqueta: TAction;
    N16: TMenuItem;
    GERARETIQUETAEAN131: TMenuItem;
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
    procedure actEstoqueExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure actCaixaExecute(Sender: TObject);
    procedure actGrupoExecute(Sender: TObject);
    procedure actProdutos_VendidosExecute(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actACLExecute(Sender: TObject);
    function GetBuildInfo:string;
    function FormataCaptionMenu: string;
    procedure Informaes1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure actConfiguracaoExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure actDescarteExecute(Sender: TObject);
    function VerificaAcesso(nameForm: string; mensagem: boolean = True): Boolean;
    procedure actLoginExecute(Sender: TObject);
    procedure actRelacaoVendasExecute(Sender: TObject);
    procedure actBackupRestoreExecute(Sender: TObject);
    procedure LembreteBackup();
    procedure actGerarEtiquetaExecute(Sender: TObject);
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
   // Intru��o SQL para carregar os dados da Empresa
   SELECT_EMPRESA: string = 'SELECT RAZAO, RUA, NUMERO, BAIRRO, CIDADE, UF, CNPJ, INSCRICAO_ESTADUAL, PROPRIETARIO, FONE FROM EMPRESA';

   // Intru��o SQL para carregar os dados gerais
   SELECT_GERAL : string = 'SELECT MODELO_IMPRESSORA, PORTA, VELOCIDADE, MSG_CABECALHO, MSG_RODAPE, CABECALHO_SANGRIA, CABECALHO_SUPRIMENTO, CABECALHO_FECHAMENTO FROM CONFIG';

   // Instru��o SQL para verificar privil�gio de acesso ao formul�rio
   SELECT_ACESSO : string = 'SELECT ID FROM ACL WHERE JANELA = :form';

implementation

uses UdmConexao, uCad_Usuario, uCad_Grupo, uCad_Cliente, uCad_Fornecedor,
  uCad_Produto, uProcura_Estoque, uEntrada_Produtos, uAgenda, uPDV,
  uFechamento_Caixa, USobre, USplash, uSangria, uSuprimento, uCadUnidade,
  uConfig, uAviso, uProgresso, uImpressoraBase,
  uImpressoraEpson, uCadDescarte, uACL, uRelatorio, uConsultaVendas,
  uBackupRestore, uGerarEtiqueta;

{$R *.dfm}

function TfrmMenu.FormataCaptionMenu: string;
var
   Str: TStringBuilder;
//frmMenu.Caption := Application.Title + '  -  Vers�o: [' + GetBuildInfo + ']  -  �ltima atualiza��o: ['+DateToStr(Arq.GetLastWriteTime(Application.ExeName))+']...';
begin
     try
         Str := TStringBuilder.Create;
         Str.Append(Application.Title);
         Str.Append(' - Vers�o: [' + GetBuildInfo + ']');
         Str.Append(' - �ltima atualiza��o: [' + DateToStr(Arq.GetLastWriteTime(Application.ExeName)) + ']');
         Str.Append(' - Servidor: [' + dmConexao.conn.Hostname + '] ...');

         Result := Str.ToString;
     finally
          FreeAndNil(Str);
     end;
end;

//Fun��o Captura o Build do execut�vel
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
    if Self.VerificaAcesso('frmSobre') then
    begin
      try
        frmSobre := TfrmSobre.Create(self);
        frmSobre.ShowModal;
      finally
        FreeAndNil(frmCadAgenda);
      end;
    end;
end;

procedure TfrmMenu.LembreteBackup;
begin
     if Self.VerificaAcesso('frmBackupRestore', false) then
     begin
         if Application.MessageBox('Deseja realizar o backup antes de sair?', 'Confirma��o', MB_YESNO)= mrYes then
         begin
             try
                frmBackupRestore := TfrmBackupRestore.Create(nil);
                frmBackupRestore.ShowModal;
             finally
                 FreeAndNil(frmBackupRestore);
             end;
         end;
     end;
end;

procedure TfrmMenu.actAgendaExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadAgenda') then
    begin
        try
          frmCadAgenda := TfrmCadAgenda.Create(self);
          frmCadAgenda.ShowModal;
        finally
          FreeAndNil(frmCadAgenda);
        end;
    end;
end;

procedure TfrmMenu.actBackupRestoreExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmBackupRestore') then
    begin
        try
           frmBackupRestore := TfrmBackupRestore.Create(self);
           frmBackupRestore.ShowModal;
        finally
           FreeAndNil(frmBackupRestore);
        end;
    end;
end;

procedure TfrmMenu.actCaixaExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmFechamento_Caixa') then
    begin
        try
           frmFechamento_Caixa := TfrmFechamento_Caixa.Create(self);
           frmFechamento_Caixa.ShowModal;
         finally
           FreeAndNil(frmFechamento_Caixa);
         end;
    end;
end;

procedure TfrmMenu.actClienteExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadCliente') then
    begin
        try
           frmCadCliente := TfrmCadCliente.Create(self);
           frmCadCliente.ShowModal;
        finally
           FreeAndNil(frmCadCliente);
        end;
    end;
end;

procedure TfrmMenu.actConfiguracaoExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmConfig') then
    begin
      try
        frmConfig := TfrmConfig.Create(self);
        frmConfig.ShowModal;
      finally
        FreeAndNil(frmConfig);
      end;
    end;
end;

procedure TfrmMenu.actDescarteExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmDescarte') then
    begin
        try
          frmDescarte := TfrmDescarte.Create(self);
          frmDescarte.ShowModal;
        finally
          FreeAndNil(frmDescarte);
        end;
    end;
end;

procedure TfrmMenu.actEntradaExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmEntrada_Produtos') then
    begin
        try
          frmEntrada_Produtos := TfrmEntrada_Produtos.Create(self);
          frmEntrada_Produtos.ShowModal;
        finally
          FreeAndNil(frmEntrada_Produtos);
        end;
    end;
end;

procedure TfrmMenu.actEstoqueExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmProcura_Estoque') then
    begin
        try
           frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
           frmProcura_Estoque.ShowModal;
         finally
           FreeAndNil(frmProcura_Estoque);
         end;
    end;
end;

procedure TfrmMenu.actFecharExecute(Sender: TObject);
begin
    Self.LembreteBackup;
    dmConexao.Conexao.Close;
    Application.Terminate;
end;

procedure TfrmMenu.actFornecedorExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadFornecedor') then
    begin
        try
         frmCadFornecedor := TfrmCadFornecedor.Create(self);
         frmCadFornecedor.ShowModal;
        finally
         FreeAndNil(frmCadFornecedor);
        end;
    end;
end;

procedure TfrmMenu.actGerarEtiquetaExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmGerarEtiqueta') then
    begin
        try
          frmGerarEtiqueta := TfrmGerarEtiqueta.Create(self);
          frmGerarEtiqueta.ShowModal;
        finally
          FreeAndNil(frmGerarEtiqueta);
        end;
    end;
end;

procedure TfrmMenu.actGrupoExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadGrupo') then
    begin
        try
          frmCadGrupo := TfrmCadGrupo.Create(self);
          frmCadGrupo.ShowModal;
        finally
          FreeAndNil(frmCadGrupo);
        end;
    end;
end;

procedure TfrmMenu.actLoginExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmLogin') then
    begin
        try
          frmLogin := TfrmLogin.Create(nil);
          frmLogin.ShowModal;
        finally
           FreeAndNil(frmLogin);
        end;
    end;
end;

procedure TfrmMenu.actACLExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmControleAcesso') then
    begin
        try
          frmControleAcesso := TfrmControleAcesso.Create(nil);
          frmControleAcesso.ShowModal;
        finally
           FreeAndNil(frmControleAcesso);
        end;
    end;
end;

procedure TfrmMenu.actProdutoExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadProduto') then
    begin
        try
           frmCadProduto := TfrmCadProduto.Create(self);
           frmCadProduto.ShowModal;
         finally
           FreeAndNil(frmCadProduto);
         end;
    end;
end;

procedure TfrmMenu.actProdutos_VendidosExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmVendas_Produto') then
    begin
        try
          frmVendas_Produto := TfrmVendas_Produto.Create(self);
          frmVendas_Produto.ShowModal;
        finally
          FreeAndNil(frmVendas_Produto);
        end;
    end;
end;

procedure TfrmMenu.actRelacaoVendasExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmConsultaVendas') then
    begin
        try
          frmConsultaVendas := TfrmConsultaVendas.Create(self);
          frmConsultaVendas.ShowModal;
        finally
          FreeAndNil(frmConsultaVendas);
        end;
    end;
end;

procedure TfrmMenu.actUnidadeExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadUnidade') then
    begin
        try
            frmCadUnidade := TfrmCadUnidade.Create(self);
            frmCadUnidade.ShowModal;
         finally
             FreeAndNil(frmCadUnidade);
         end;
    end;
end;

procedure TfrmMenu.actUsuarioExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmCadUsuario') then
    begin
         try
          frmCadUsuario := TfrmCadUsuario.Create(self);
          frmCadUsuario.ShowModal;
        finally
          FreeAndNil(frmCadUsuario);
        end;
    end;
end;

procedure TfrmMenu.actVendaExecute(Sender: TObject);
begin
    if Self.VerificaAcesso('frmPDV') then
    begin
        try
          frmPDV := TfrmPDV.Create(self);
          frmPDV.ShowModal;
        finally
          FreeAndNil(frmPDV);
        end;
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

//Fun��o retorna dia da semana por extenso
function Tfrmmenu.DataPorExtenso: String;
const
     Semana : Array [1..7] of String = ('Domingo', 'Segunda-Feira', 'Ter�a-Feira','Quarta-Feira','Quinta-Feira','Sexta-Feira', 'S�bado');
var
    DiaSem : Word;
begin
    DiaSem:=DayOfWeek(Now);
    Result := Semana[DiaSem] + ', ' + FormatDateTime('dd "de" mmmm "de" yyyy', Now);
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Self.LembreteBackup;
     Action  := caFree;
     frmMenu := nil;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var
  s: string;
begin
    try
      frmLogin := TfrmLogin.Create(nil);
      frmLogin.ShowModal;
    finally
       FreeAndNil(frmLogin);
    end;

    dmConexao.Conexao.Connected := True;
    frmMenu.Caption := FormataCaptionMenu;
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
            FMensagem.Append(#10#13'Para iniciar suas atividades nesse sistema � necess�rio executar algumas configura��es!'#10#13#10#13);
            FMensagem.Append(#10#13'1 - Acesse o Menu Acess�rios e clique na op��o Configura��o.'#10#13#10#13);
            FMensagem.Append(#10#13'2 - Na aba "Informa��es da Empresa" preencha todos os dados solicitados.'#10#13#10#13);
            FMensagem.Append(#10#13'3 - Na aba "Geral" informe os dados da impressora n�o fiscal que ser� utilizada e op��es de configura��es.'#10#13#10#13);
            FMensagem.Append(#10#13'Obrigado pela prefer�ncia !'#10#13#10#13);
            FMensagem.Append(#10#13'D�vidas entre em contato com William'#10#13);
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

function TfrmMenu.VerificaAcesso(nameForm: string; mensagem: boolean = True): Boolean;
var
  qry: TSQLQuery;
begin
     try
         qry := TSQLQuery.Create(nil);
         qry.SQLConnection := dmConexao.Conexao;

         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(SELECT_ACESSO);

         if FPrivilegio = 'ADMINISTRA��O' then
            qry.SQL.Add(' AND ADMINISTRADOR = :valor')
         else
            qry.SQL.Add(' AND FUNCIONARIO = :valor');

         qry.ParamByName('form').AsString := nameForm;
         qry.ParamByName('valor').AsInteger := 1;
         qry.Open;

         if qry.IsEmpty then
         begin
            if mensagem then
               MessageDlg('Usu�rio n�o possui permiss�o de acesso!', mtWarning, [mbOK], 0);

            Result := false;
         end
         else
             Result := TRUE;

     except
         on E:Exception do
         MessageDlg('Erro ao carregar dados: ' + E.Message, mtError, [mbOK], 0);
     end;
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
