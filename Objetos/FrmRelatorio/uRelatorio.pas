unit uRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RpRenderText, RpRenderRTF, RpRenderHTML, RpRender,
  RpRenderPDF, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, RLFilters,
  RLPDFFilter;

type
  TfrmRelatorio = class(TForm)
    rlCliente: TRLReport;
    RLBCabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLBColuna: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBDados: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBRodape: TRLBand;
    RLLabel6: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    rlFornecedor: TRLReport;
    RLBand1: TRLBand;
    RLLabel7: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand3: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLBand4: TRLBand;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText9: TRLDBText;
    RLProduto: TRLReport;
    RLBand5: TRLBand;
    RLLabel14: TRLLabel;
    RLBand6: TRLBand;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLBand7: TRLBand;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLBand8: TRLBand;
    RLLabel20: TRLLabel;
    RLSystemInfo3: TRLSystemInfo;
    RLEstoque: TRLReport;
    RLBand9: TRLBand;
    RLLabel21: TRLLabel;
    RLBand10: TRLBand;
    RLLabel22: TRLLabel;
    RLSystemInfo4: TRLSystemInfo;
    RLBand11: TRLBand;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLBand12: TRLBand;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLDescarte: TRLReport;
    RLBand13: TRLBand;
    RLLabel28: TRLLabel;
    RLBand14: TRLBand;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLBand15: TRLBand;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLBand16: TRLBand;
    RLLabel34: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
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

end;

procedure TfrmRelatorio.GeraReport(Report, FileReport, Parametro: string);
begin
    
end;

end.
