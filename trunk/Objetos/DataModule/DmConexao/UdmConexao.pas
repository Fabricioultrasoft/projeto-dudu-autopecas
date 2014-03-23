unit UdmConexao;

interface

uses
  SysUtils, Classes, IniFiles, Forms, Dialogs, DB, WideStrings, DBXFirebird,
  SqlExpr, RLHTMLFilter, RLXLSFilter, RLFilters, RLPDFFilter, RpRenderText,
  RpRenderRTF, RpRenderHTML, RpDefine, RpRender, RpRenderPDF, Graphics, TypInfo,
  Windows, Messages, Variants, Controls, StdCtrls, Buttons, ExtCtrls, UFormBase,
  Grids, DBGrids, ComCtrls, UConexao;

type
  TdmConexao = class(TDataModule)
    Conexao: TSQLConnection;
    PDF: TRvRenderPDF;
    HTML: TRvRenderHTML;
    RTF: TRvRenderRTF;
    TEXT: TRvRenderText;
    procedure ConexaoBeforeConnect(Sender: TObject);
  private

  public
     conn: TConexao;
  end;

var
  dmConexao: TdmConexao;


implementation

{$R *.dfm}


procedure TdmConexao.ConexaoBeforeConnect(Sender: TObject);
begin
    try
         conn := TConexao.Create(ExtractFilePath(Application.ExeName) + 'String_Conexao.ini', 'Conexao');
         conn.Conectar(Conexao);
     except
         on E:Exception do
         begin
             ShowMessage('Erro ao iniciar conexão!'#13 + E.Message);
             Application.Terminate;
         end;
     end;
end;

end.
