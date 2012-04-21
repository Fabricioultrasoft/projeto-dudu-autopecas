unit uRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RpRenderText, RpRenderRTF, RpRenderHTML, RpRender,
  RpRenderPDF, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TfrmRelatorio = class(TForm)
    RvPrjReport: TRvProject;
    RvSystem: TRvSystem;
    rvDtsProdutos: TRvDataSetConnection;
    rvDtsEstoque: TRvDataSetConnection;
    rvDtsFornecedor: TRvDataSetConnection;
    rvDtsEntrada_Produtos: TRvDataSetConnection;
    rvDtsVenda_Fornecedor: TRvDataSetConnection;
  private
    { Private declarations }
  public
    procedure GeraReport(Report, FileReport: string);overload;
    procedure GeraReport(Report, FileReport, Parametro: string);overload;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

uses uDm, UdmConexao;

{$R *.dfm}

{ TfrmRelatorio }

procedure TfrmRelatorio.GeraReport(Report, FileReport: string);
begin
    try
        RvSystem.SystemPreview.FormState := wsMaximized;
        RvPrjReport.Close;
        RvPrjReport.ProjectFile := ExtractFilePath(Application.ExeName) + 'Report\' + FileReport;
        RvPrjReport.Open;
        RvPrjReport.ExecuteReport(Report);
    Except
        on e:exception do
        ShowMessage('Erro ao carregar Relatório: ' + Report +#13#10 + e.Message);
    end;
end;

procedure TfrmRelatorio.GeraReport(Report, FileReport, Parametro: string);
begin
    try
        RvSystem.SystemPreview.FormState := wsMaximized;
        RvPrjReport.Close;
        RvPrjReport.ProjectFile := ExtractFilePath(Application.ExeName) + 'Report\' + FileReport;
        RvPrjReport.SetParam('Periodo', Parametro);
        RvPrjReport.Open;
        RvPrjReport.ExecuteReport(Report);
    Except
        on e:exception do
        ShowMessage('Erro ao carregar Relatório: ' + Report +#13#10 + e.Message);
    end;
end;

end.
