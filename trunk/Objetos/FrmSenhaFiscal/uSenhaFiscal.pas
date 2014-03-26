unit uSenhaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmSenhaFiscal = class(TForm)
    Panel1: TPanel;
    edtSenha: TEdit;
    lbl1: TLabel;
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function VerificaSenha(Senha, Privilegio:string):boolean;
    procedure CancelarItem();
    procedure TrocaDevolucao();
    procedure EstornaValor();
  end;

var
  frmSenhaFiscal: TfrmSenhaFiscal;

implementation

uses uDm, uCancela_Item, uProcura_Venda, uTrocaDevolucao, uPDV,
  uEstornoFinanceiro;

{$R *.dfm}

procedure TfrmSenhaFiscal.CancelarItem;
begin
      if edtSenha.Text <> '' then
      begin
          if VerificaSenha(edtSenha.Text, 'ADMINISTRAÇÃO') then
          begin
             try
                frmPDV.bFCancelaItem := False;
                frmSenhaFiscal.Close;
                frmCancelaItem := TfrmCancelaItem.Create(nil);
                frmCancelaItem.ShowModal;
             finally
                FreeAndNil(frmCancelaItem);
             end;
          end
          else
          begin
             MessageDlg('Senha não liberada!', mtWarning, [mbOK], 0);
             edtSenha.Clear;
          end;
      end
      else
        MessageDlg('É necessário informar a senha do fiscal!', mtWarning, [mbOK], 0);
end;

procedure TfrmSenhaFiscal.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) and (frmPDV.bFCancelaItem) then
        CancelarItem;

     if (key = #13) and (Assigned(frmProcura_Venda)) then
        TrocaDevolucao;

     if (key = #13) and (frmPDV.bFEstornaValor) then
        EstornaValor;
end;

procedure TfrmSenhaFiscal.EstornaValor;
begin
      if edtSenha.Text <> '' then
      begin
          if VerificaSenha(edtSenha.Text, 'ADMINISTRAÇÃO') then
          begin
             try
                frmPDV.bFEstornaValor := False;
                frmSenhaFiscal.Close;
                frmEstornoFinanceiro := TfrmEstornoFinanceiro.Create(nil);
                frmEstornoFinanceiro.ShowModal;
             finally
                FreeAndNil(frmEstornoFinanceiro);
             end;
          end
          else
          begin
             MessageDlg('Senha não liberada!', mtWarning, [mbOK], 0);
             edtSenha.Clear;
          end;
      end
      else
        MessageDlg('É necessário informar a senha do fiscal!', mtWarning, [mbOK], 0);

end;

procedure TfrmSenhaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action  := caFree;
    frmSenhaFiscal := nil;
end;

procedure TfrmSenhaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then self.Close; 
end;

procedure TfrmSenhaFiscal.TrocaDevolucao;
begin
      if edtSenha.Text <> '' then
      begin
          if VerificaSenha(edtSenha.Text, 'ADMINISTRAÇÃO') then
          begin
             try
                frmTrocaDevolucao := TfrmTrocaDevolucao.Create(nil);
                frmTrocaDevolucao.ShowModal;
             finally
                FreeAndNil(frmTrocaDevolucao);
             end;
          end
          else
          begin
             MessageDlg('Senha não liberada!', mtWarning, [mbOK], 0);
             edtSenha.Clear;
          end;
      end
      else
        MessageDlg('É necessário informar a senha do fiscal!', mtWarning, [mbOK], 0);
end;

function TfrmSenhaFiscal.VerificaSenha(Senha, Privilegio: string): boolean;
begin
    try
        dm.qryUsuario.Close;
        dm.qryUsuario.SQL.Clear;
        dm.qryUsuario.SQL.Add('SELECT * FROM USUARIO ');
        dm.qryUsuario.SQL.Add('WHERE SENHA = :senha AND PRIVILEGIO = :privilegio');
        dm.qryUsuario.ParamByName('senha').AsString      := Trim(Senha);
        dm.qryUsuario.ParamByName('privilegio').AsString := Trim(Privilegio);
        dm.qryUsuario.Open;

        if not dm.qryUsuario.IsEmpty then
           Result := true
        else
           Result := false;
    except

    end;
end;

end.
