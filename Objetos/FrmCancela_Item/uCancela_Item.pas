unit uCancela_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, uImpressora;

type
  TfrmCancelaItem = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtItem: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtItemKeyPress(Sender: TObject; var Key: Char);
    procedure CancelarItem();
  private
    { Private declarations }
  public
    FImpressora: TImpressora;
  end;

var
  frmCancelaItem: TfrmCancelaItem;
  Texto : AnsiString;

implementation

uses uDm, uPDV, uSenhaFiscal;

{$R *.dfm}

procedure TfrmCancelaItem.CancelarItem;
begin
     try
        //Localiza o Item antes de deletar
        if dm.cdsItem_Venda.Locate('ID_ITEM', edtItem.Text, [loCaseInsensitive, loPartialKey]) then
        begin
            //Confirma a exclus�o
            if Application.MessageBox('Deseja cancelar esse item?', 'Confirma��o', MB_YESNO)= mrYes then
            begin
                dm.cdsItem_Venda.Delete;

                //Verifico se a venda j� est� gravada no banco
                if frmPDV.sFStatus = 'F' then
                   dm.cdsItem_Venda.ApplyUpdates(0);

                //Limpa os campos da tela de PDV
                frmPDV.edtValor_Unitario.Clear;
                frmPDV.edtSub_total.Clear;
                frmPDV.edtProduto.Clear;

                //Verifica se o ClientDataSet n�o est� vazio para executar a soma
                if not dm.cdsItem_Venda.IsEmpty then
                   frmPDV.edtTotal.Text := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('S_TOTAL').Value)
                else
                   frmPDV.edtTotal.Clear;

                frmPDV.ImprimeCancelaItem(edtItem.Text, Copy(dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString, 1, 24));
                if frmPDV.FVerificacaoImpressora then
                begin
                    // Imprime o item cancelado
                    Texto := '';
                    Texto := Concat(Texto, #10+'<c>ITEM ' + edtItem.Text + ' *' + Copy(dm.cdsItem_Venda.FieldByName('DESC_PROD').AsString, 1, 24) + '* CANCELADO</c>'#10);
                    frmPDV.FImpressora.ImprimeTextoTag(PAnsiChar(Texto), false);
                end;

                // Posiciona o cursor n� �ltimo item
                dm.cdsItem_Venda.Last;
            end;
        end
        else
            ShowMessage('Item n�o encontrado!');

     except
        on E:Exception do
        ShowMessage('Erro ao cancelar item !'#13#10 + E.Message);
     end;
end;

procedure TfrmCancelaItem.edtItemKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        CancelarItem;
        frmCancelaItem.Close;
    end;
end;

procedure TfrmCancelaItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action         := caFree;
    frmCancelaItem := nil;
end;

procedure TfrmCancelaItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmCancelaItem.Close;
end;

end.
