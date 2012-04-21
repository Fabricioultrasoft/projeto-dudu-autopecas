unit uCancela_Item;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB;

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
    { Public declarations }
  end;

var
  frmCancelaItem: TfrmCancelaItem;

implementation

uses uDm, uPDV;

{$R *.dfm}

procedure TfrmCancelaItem.CancelarItem;
begin
     try
        //Localiza o Item antes de deletar
        if dm.cdsItem_Venda.Locate('ID_ITEM', edtItem.Text, [loCaseInsensitive, loPartialKey]) then
        begin
            //Confirma a exclusão
            if Application.MessageBox('Deseja cancelar esse item?', 'Confirmação', MB_YESNO)= mrYes then
            begin
                dm.cdsItem_Venda.Delete;

                //Limpa os campos da tela de PDV
                frmPDV.edtValor_Unitario.Clear;
                frmPDV.edtSub_total.Clear;
                frmPDV.edtProduto.Clear;

                //Verifica se o ClientDataSet não está vazio para executar a soma
                if not dm.cdsItem_Venda.IsEmpty then
                   frmPDV.edtTotal.Text := FormatFloat('##0.00' ,dm.cdsItem_Venda.FieldByName('S_TOTAL').Value)
                else
                   frmPDV.edtTotal.Clear;
            end;
        end
        else
            ShowMessage('Item não encontrado!');

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
