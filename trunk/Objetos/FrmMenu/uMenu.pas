unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, jpeg, Buttons, ImgList, ToolWin,
  uVendas_Produto, uLogin, ActnList, IOUtils;

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
    Oramento1: TMenuItem;
    MontarOramento1: TMenuItem;
    Fecham1: TMenuItem;
    ProdutosVendidos1: TMenuItem;
    actlst: TActionList;
    actFechar: TAction;
    actCliente: TAction;
    actFornecedor: TAction;
    actProduto: TAction;
    actEntrada: TAction;
    actVenda: TAction;
    actOrcamento: TAction;
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
  private
    { Private declarations }
  public

  end;

var
  frmMenu: TfrmMenu;
   Arq: TFile;

implementation

uses UdmConexao, uCad_Usuario, uCad_Grupo, uCad_Cliente, uCad_Fornecedor,
  uCad_Produto, uProcura_Estoque, uEntrada_Produtos, uAgenda, uOrcamento, uPDV,
  uFechamento_Caixa;

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
         Str.Append(' - Servidor: [' + dmConexao.Host + '] ...');

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

procedure TfrmMenu.btnSairClick(Sender: TObject);
begin
     Application.Terminate;
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
    {try
      frmLogin := TfrmLogin.Create(nil);
      frmLogin.ShowModal;
    finally
       FreeAndNil(frmLogin);
    end;}
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

procedure TfrmMenu.TimerTimer(Sender: TObject);
begin
    //Preenche data por extenso e hora nos respectivos panels
    stbStatus.Panels[5].Text := DataPorExtenso;
    stbStatus.Panels[7].Text := FormatDateTime('HH:MM:SS', Time);
end;

end.
