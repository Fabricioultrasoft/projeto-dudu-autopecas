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
    rlVendas: TRLReport;
    RLBand17: TRLBand;
    RLBand18: TRLBand;
    RLDBText27: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLBand19: TRLBand;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    RLBand20: TRLBand;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLBand21: TRLBand;
    RLLabel48: TRLLabel;
    RLSystemInfo7: TRLSystemInfo;
    RLLabel37: TRLLabel;
    rlDataInicial: TRLLabel;
    RLLabel50: TRLLabel;
    rlDataFinal: TRLLabel;
    rlDescricaoProduto: TRLLabel;
    rlVendaFornecedor: TRLReport;
    RLBand22: TRLBand;
    RLLabel49: TRLLabel;
    RLSystemInfo6: TRLSystemInfo;
    RLBand23: TRLBand;
    RLDBText28: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText39: TRLDBText;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLBand24: TRLBand;
    RLLabel52: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel60: TRLLabel;
    RLBand25: TRLBand;
    RLLabel61: TRLLabel;
    rlDataInicialVendaForn: TRLLabel;
    RLLabel63: TRLLabel;
    rlDataFinalVendaForn: TRLLabel;
    RLBand26: TRLBand;
    RLLabel65: TRLLabel;
    procedure rlVendasDataRecord(Sender: TObject; RecNo, CopyNo: Integer;
      var Eof: Boolean; var RecordAction: TRLRecordAction);
    procedure rlVendasBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlVendaFornecedorBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    procedure GeraReport(Report, FileReport: string);overload;
    procedure GeraReport(Report, FileReport, Parametro: string);overload;
  end;

var
  frmRelatorio: TfrmRelatorio;

implementation

uses uDm, UdmConexao, uConsultaVendas, uVendas_Produto;

{$R *.dfm}

{ TfrmRelatorio }

procedure TfrmRelatorio.GeraReport(Report, FileReport: string);
begin

end;

procedure TfrmRelatorio.GeraReport(Report, FileReport, Parametro: string);
begin

end;

procedure TfrmRelatorio.rlVendaFornecedorBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
    rlDataInicialVendaForn.Caption := FormatDateTime('dd/mm/yyyy', frmVendas_Produto.dtpInicial.Date);
    rlDataFinalVendaForn.Caption := FormatDateTime('dd/mm/yyyy', frmVendas_Produto.dtpFinal.Date);
end;

procedure TfrmRelatorio.rlVendasBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
    rlDataInicial.Caption := FormatDateTime('dd/mm/yyyy', frmConsultaVendas.dtpInicial.Date);
    rlDataFinal.Caption := FormatDateTime('dd/mm/yyyy', frmConsultaVendas.dtpFinal.Date);
end;

procedure TfrmRelatorio.rlVendasDataRecord(Sender: TObject; RecNo,
  CopyNo: Integer; var Eof: Boolean; var RecordAction: TRLRecordAction);
begin
    rlDescricaoProduto.Caption := Copy(dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString, 0, 34);
end;

end.
