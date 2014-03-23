unit USplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, jpeg, ExtCtrls, UConexao, ShellAPI;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    ProgressBar: TProgressBar;
    Label1: TLabel;
    lblAtualizacao: TLabel;
    lblVersao: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbl2Click(Sender: TObject);
    procedure lbl2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    Conn: TConexao;
    procedure gravaLog(Mensagem: string);
  end;

var
  frmSplash: TfrmSplash;

implementation

uses uMenu, Udm, UdmConexao;

{$R *.dfm}

procedure TfrmSplash.FormActivate(Sender: TObject);
var
   vFim:Boolean;

begin
    vFim := false;
    ProgressBar.Position := 0;

    while ProgressBar.Position <= 100 do
    begin
        ProgressBar.StepBy(20);
        case ProgressBar.Position of
          20 : label1.Caption := 'Carregando...';
          40 : label1.Caption := 'Verificando arquivo INI ...';
        end;

        if ProgressBar.Position = 40 then
        begin
             if FileExists(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini') then
             begin
                label1.Caption := 'Carregando arquivo INI...';
             end
             else
             begin
                Label1.Font.Color := clRed;
                Label1.Caption := 'Arquivo INI não encontrado ...';
                self.gravaLog('Arquivo INI não encontrado');
                frmSplash.Update;
                Sleep(200);
                vFim := true;
                break;
             end;
        end;

        if ProgressBar.Position = 60 then
        begin
           try
              Conn := TConexao.Create(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini', 'Conexao');
              label1.Caption := 'Carregando configurações do arquivo INI...';
           except
              Label1.Font.Color := clRed;
              Label1.Caption := 'Falha ao configurar conexão ...';
              self.gravaLog('Falha ao configurar conexão');
              frmSplash.Update;
              Sleep(200);
              vFim := true;
              break;
           end;
        end;

        if ProgressBar.Position = 80 then
        begin
           try
               dmConexao.Conexao.Connected := true;
               label1.Caption := 'Conectando com o banco de dados ...';
               FreeAndNil(Conn);
           except
               Label1.Font.Color := clRed;
               label1.Caption := 'Erro na conexão com o banco de dados ...';
               self.gravaLog('Erro na conexão com o banco de dados');
               frmSplash.Update;
               Sleep(200);
               vFim := true;
               break;
           end;
        end;

        frmSplash.Update;
        Sleep(450);
    end;

    if vFim then
    begin
       label1.Caption := 'Finalizando programa...';
       Sleep(50);
       Application.Terminate;
    end
    else
    begin
       label1.Caption := 'Inicializando o programa...';
       frmSplash.Update;
       Sleep(100);
    end;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
     lblVersao.Caption      := 'Versão: ' + frmMenu.GetBuildInfo;
     lblAtualizacao.Caption := 'Última Atualização: ' + DateToStr(Arq.GetLastWriteTime(Application.ExeName));
end;

procedure TfrmSplash.gravaLog(Mensagem: string);
var
   arq: TextFile;
   nomeLog: string;
begin
    try
        try
            nomeLog := ExtractFilePath(Application.ExeName) + 'log.txt';
            AssignFile(arq, nomeLog);

            if FileExists(nomeLog) then
              Append(arq)
            else
              Rewrite(arq);

            Writeln(arq, FormatDateTime('dd/mm/yyyy', now) + ' - ' + FormatDateTime('hh:mm:ss', Time) + ' - ' + Mensagem);
        finally
            CloseFile(arq);
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao gravar log!'#13#10 + E.Message);
    end;
end;

procedure TfrmSplash.lbl2Click(Sender: TObject);
var
    buffer: String;
begin
      buffer := lbl2.Caption;
      ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSplash.lbl2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    lbl2.Font.Style := lbl2.Font.Style + [fsUnderline];
end;

end.
