unit uQtde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uProcura_Produto, uFuncao;

type
  TfrmQtde = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtQtde: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CarregaValores(qtde: Double);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtde: TfrmQtde;

implementation

uses uDm, uPDV, uMenu, uProcura_Estoque, uProcura_Venda, uSenhaFiscal;

{$R *.dfm}

procedure TfrmQtde.CarregaValores(qtde: Double);
begin
     if (qtde > 0) then
     begin
         //Edita o ClientDataSet com a QTDE e TOTAL_PROD
         dm.cdsItem_Venda.Edit;
         dm.cdsItem_Venda.FieldByName('QTDE').AsFloat := qtde;
         dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat := dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat * qtde;
         dm.cdsItem_Venda.Post;

         frmPDV.FImpressao.ImprimirItem(IntToStr(dm.cdsItem_Venda.FieldByName('ID_ITEM').AsInteger), dm.cdsItem_Venda.FieldByName('EAN13').AsString,
                                          dm.cdsEstoque.FieldByName('DESC_CUPOM').AsString, FormatFloat('#0.000', qtde), dm.cdsItem_Venda.FieldByName('UND').AsString,
                                          FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat), FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat));

         //Carrega os valores na tela de PDV
         if Assigned(frmPDV) then
         begin
             frmPDV.edtProduto.Text           := copy(dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString, 1, 25);
             frmPDV.edtValor_Unitario.Text    := IntToStr(dm.cdsItem_Venda.FieldByName('QTDE').AsInteger) + ' x ' + FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('VAL_PROD').AsFloat);
             frmPDV.edtSub_total.Text         := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('TOTAL_PROD').AsFloat);
             frmPDV.edtTotal.Text             := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('S_TOTAL').Value);
         end;
     end;
end;

procedure TfrmQtde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  := caFree;
    frmQtde := nil;
end;

procedure TfrmQtde.FormCreate(Sender: TObject);
begin
    if Assigned(frmSenhaFiscal) then
       frmSenhaFiscal.Close;
end;

procedure TfrmQtde.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
    begin
         dm.cdsItem_Venda.Cancel;
         frmQtde.Close;
    end;
end;

procedure TfrmQtde.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (edtQtde.Text <> '')then
    begin
         if (Assigned(frmPDV)) and (not Assigned(frmProcura_Venda))  then
         begin
           CarregaValores(StrToFloat(edtQtde.Text));
           frmQtde.Close;
           frmProcura_Estoque.Close;
         end;

         if Assigned(frmProcura_Venda) then
         begin
             CarregaValores(StrToFloat(edtQtde.Text));
             frmQtde.Close;
         end;
    end;
end;

end.
