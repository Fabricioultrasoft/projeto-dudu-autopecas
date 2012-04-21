unit UdmConexao;

interface

uses
  SysUtils, Classes, IniFiles, Forms, Dialogs, DB, WideStrings, DBXFirebird,
  SqlExpr, RLHTMLFilter, RLXLSFilter, RLFilters, RLPDFFilter, RpRenderText,
  RpRenderRTF, RpRenderHTML, RpDefine, RpRender, RpRenderPDF, Graphics, TypInfo,
  Windows, Messages, Variants, Controls, StdCtrls, Buttons, ExtCtrls, UFormBase,
  Grids, DBGrids, ComCtrls;

type
  TdmConexao = class(TDataModule)
    Conexao: TSQLConnection;
    PDF: TRvRenderPDF;
    HTML: TRvRenderHTML;
    RTF: TRvRenderRTF;
    TEXT: TRvRenderText;
    procedure GravaConfig();
    procedure LeConfig();
    procedure LeConexao();
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    //Variáveis de conexão
    Host, Database, Password, User, VendorLib, LibraryC, GetDriver, Driver, Connection : string;
    Porta : Integer;

    //Variáveis de configuração do NFe
    nForma_Emissao, nCod_municipio, nPorta, nAmbiente, nCod_pais, nCod_UF : integer;

    bSalvar_Arquivo : Boolean;

    sLogomarca, sPath_Arquivo, sPath_Certificado, sSenha, sSerie, sRazao, sFantasia,
    sCNPJ, sEndereco, sNumero, sBairro, sCidade, sUF, sCEP, sTelefone, sI_E, sUF_WS, sHost,
    sSenha_WS, sUsuario, sPais : string;
  end;

var
  dmConexao: TdmConexao;


implementation

{$R *.dfm}

procedure TdmConexao.GravaConfig;
var
   ArqIni: TIniFile;
begin
     try
          ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');

          //Aba Geral
          ArqIni.WriteString ('GERAL', 'LOGOMARCA'     , sLogomarca);
          ArqIni.WriteBool   ('GERAL', 'SALVAR_ARQUIVO', bSalvar_Arquivo);
          ArqIni.WriteString ('GERAL', 'PATH_ARQUIVO'  , sPath_Arquivo);

         //Aba Emitente
         ArqIni.WriteString ('EMITENTE', 'RAZAO_SOCIAL' , sRazao);
         ArqIni.WriteString ('EMITENTE', 'NOME_FANTASIA', sFantasia);
         ArqIni.WriteString ('EMITENTE', 'CNPJ'         , sCNPJ);
         ArqIni.WriteString ('EMITENTE', 'ENDERECO'     , sEndereco);
         ArqIni.WriteString ('EMITENTE', 'NUMERO'       , sNumero);
         ArqIni.WriteString ('EMITENTE', 'BAIRRO'       , sBairro);
         ArqIni.WriteString ('EMITENTE', 'CIDADE'       , sCidade);
         ArqIni.WriteInteger('EMITENTE', 'COD_MUNICIPIO', nCod_municipio);
         ArqIni.WriteString ('EMITENTE', 'UF'           , sUF);
         ArqIni.WriteInteger('EMITENTE', 'COD_UF'       , nCod_UF);
         ArqIni.WriteString ('EMITENTE', 'CEP'          , sCEP);
         ArqIni.WriteInteger('EMITENTE', 'COD_PAIS'     , nCod_pais);
         ArqIni.WriteString ('EMITENTE', 'PAIS'         , sPais);
         ArqIni.WriteString ('EMITENTE', 'TELEFONE'     , sTelefone);
         ArqIni.WriteString ('EMITENTE', 'I_E'          , sI_E);

         //Aba WebService
         ArqIni.WriteString ('WEBSERVICE', 'UF'      , sUF_WS);
         ArqIni.WriteInteger('WEBSERVICE', 'AMBIENTE', nAmbiente);
     finally
         FreeAndNil(ArqIni);
     end;
end;

procedure TdmConexao.LeConexao();
var
    ArqIni : TIniFile;
begin
     ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\String_Conexao.ini');
     try
        //Carrega valores para conexão com banco de dados
        Host        := ArqIni.ReadString('Conexao', 'Hostname', '');
        Porta       := ArqIni.ReadInteger('Conexao', 'Porta', 0);
        Database    := ArqIni.ReadString('Conexao', 'Database', '');
        Password    := ArqIni.ReadString('Conexao', 'Password', '');
        User        := ArqIni.ReadString('Conexao', 'user_name', '');
        VendorLib   := ArqIni.ReadString('Conexao', 'VendorLib', '');
        LibraryC    := ArqIni.ReadString('Conexao', 'LibraryName', '');
        GetDriver   := ArqIni.ReadString('Conexao', 'GetDriveFunc', '');
        Driver      := ArqIni.ReadString('Conexao', 'drivername', '');
        Connection  := ArqIni.ReadString('Conexao', 'ConnectionName', '');
     finally
        ArqIni.Free;
     end;
end;

procedure TdmConexao.ConexaoBeforeConnect(Sender: TObject);
begin
     //Le o arquivo INI e carrega os valores nas respectivas variáveis
     LeConexao();

     try
        //Passa os parâmetros para o objeto Conexão
        Conexao.Connected := false;
        Conexao.Params.Clear;
        Conexao.ConnectionName := Connection;
        Conexao.ParamsLoaded := True;
        Conexao.DriverName := Driver;
        Conexao.GetDriverFunc := GetDriver;
        Conexao.LibraryName := LibraryC;
        Conexao.VendorLib := VendorLib;
        Conexao.Params.Add('drivername='+ Driver);
        Conexao.Params.Add('hostname='+ Host);
        Conexao.Params.Add('user_name='+ User);
        Conexao.Params.Add('password='+ Password);
        Conexao.Params.Add('port='+ IntToStr(Porta));
        Conexao.Params.Add('Database='+ Database);
     Except
        on E:Exception do
        ShowMessage('Erro ao acessar banco de dados!'#13#10 + E.Message);
     end;
end;

procedure TdmConexao.LeConfig;
var
   ArqIni: TIniFile;
begin
    try
        //Carrega o conteúdo do arquivo INI nos controles
        ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');

        //Aba Geral
        sLogomarca      := ArqIni.ReadString ('GERAL', 'LOGOMARCA'     , '');
        bSalvar_Arquivo := ArqIni.ReadBool   ('GERAL', 'SALVAR_ARQUIVO' , true);
        sPath_Arquivo   := ArqIni.ReadString ('GERAL', 'PATH_ARQUIVO'  , 'C:\');

       //Aba Emitente
       sRazao         := ArqIni.ReadString ('EMITENTE', 'RAZAO_SOCIAL' , '');
       sFantasia      := ArqIni.ReadString ('EMITENTE', 'NOME_FANTASIA', '');
       sCNPJ          := ArqIni.ReadString ('EMITENTE', 'CNPJ'         , '');
       sEndereco      := ArqIni.ReadString ('EMITENTE', 'ENDERECO'     , '');
       sNumero        := ArqIni.ReadString ('EMITENTE', 'NUMERO'       , '');
       sBairro        := ArqIni.ReadString ('EMITENTE', 'BAIRRO'       , '');
       sCidade        := ArqIni.ReadString ('EMITENTE', 'CIDADE'       , '');
       nCod_municipio := ArqIni.ReadInteger('EMITENTE', 'COD_MUNICIPIO', 0);
       sUF            := ArqIni.ReadString ('EMITENTE', 'UF'           , '');
       nCod_UF        := ArqIni.ReadInteger('EMITENTE', 'COD_UF'       , 0);
       nCod_pais      := ArqIni.ReadInteger('EMITENTE', 'COD_PAIS'     , 0);
       sPais          := ArqIni.ReadString ('EMITENTE', 'PAIS'         , '');
       sCEP           := ArqIni.ReadString ('EMITENTE', 'CEP'          , '');
       sTelefone      := ArqIni.ReadString ('EMITENTE', 'TELEFONE'     , '');
       sI_E           := ArqIni.ReadString ('EMITENTE', 'I_E'          , '');

       //Aba WebService
       sUF_WS    := ArqIni.ReadString ('WEBSERVICE', 'UF'      , '');
       nAmbiente := ArqIni.ReadInteger('WEBSERVICE', 'AMBIENTE', 0);
    finally
       FreeAndNil(ArqIni);
    end;

end;

end.
