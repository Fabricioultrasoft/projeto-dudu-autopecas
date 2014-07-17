unit uProdura_EntradaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmProcura_EntradaProduto = class(TForm)
    pnlTitulo: TPanel;
    pnl1: TPanel;
    lbl5: TLabel;
    edtCodigo: TEdit;
    grdProd: TDBGrid;
    pnlRodape: TPanel;
    lbl1: TLabel;
    rgOpcao: TRadioGroup;
    dtpEntrada: TDateTimePicker;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoChange(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
    procedure dtpEntradaChange(Sender: TObject);
    procedure grdProdKeyPress(Sender: TObject; var Key: Char);
    procedure grdProdDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      procedure ConsultaNota;
    { Private declarations }
  public
      procedure ConsultaDataEntrada();
      procedure CarregaCampos();
  end;

var
  frmProcura_EntradaProduto: TfrmProcura_EntradaProduto;

const

  //Instrução SQL SELECT básica para todas as consultas
  SELECT: string = 'SELECT E.N_NOTA, E.CHAVE_NFE, E.COD_FORN, E.DATA_ENTRADA, E.VALOR_TOTAL, E.RESPONSAVEL, F.DESC_FORN '+
                   'FROM ENTRADA_NF E INNER JOIN FORNECEDOR F ON E.COD_FORN = F.COD_FORN ';

  // Cláusula WHERE por número da Nota Fiscal
  WHERE_NOTA: string = 'WHERE E.N_NOTA LIKE :nota ';

  // Cláusula WHERE para Data de entrada
  WHERE_DATAENTRADA: string = 'WHERE E.DATA_ENTRADA = :data ';

  // Instrução SQL para ordenar por data de entrada
  ORDERBY: string ='ORDER BY E.DATA_ENTRADA DESC';


implementation

uses uDm, uEntrada_Produtos;

{$R *.dfm}

procedure TfrmProcura_EntradaProduto.CarregaCampos;
begin
    //Carregar os valores nos campos do form
    frmEntrada_Produtos.edtN_Documento.Text := dm.cdsEntradaNF.FieldByName('N_NOTA').AsString;
    frmEntrada_Produtos.dtpEntrada.Date     := dm.cdsEntradaNF.FieldByName('DATA_ENTRADA').AsDateTime;
    frmEntrada_Produtos.edtCod_Forn.Text    := dm.cdsEntradaNF.FieldByName('COD_FORN').AsString;
    frmEntrada_Produtos.edtResponsavel.Text := dm.cdsEntradaNF.FieldByName('RESPONSAVEL').AsString;
    frmEntrada_Produtos.edtValorTotal.Value := dm.cdsEntradaNF.FieldByName('VALOR_TOTAL').AsFloat;
    frmEntrada_Produtos.edtChaveNfe.Text    := dm.cdsEntradaNF.FieldByName('CHAVE_NFE').AsString;
    frmEntrada_Produtos.CarregaDescFornecedor(dm.cdsEntradaNF.FieldByName('COD_FORN').AsString);
    dm.AtualizaCDSProduto(dm.cdsEntradaNF.FieldByName('N_NOTA').AsString);
    frmEntrada_Produtos.grpProdutoNF.Enabled := True;
    Self.Close;
end;

procedure TfrmProcura_EntradaProduto.ConsultaDataEntrada;
begin
    //Consulta para Data de Entrada
     dm.qryEntradaNF.Close;
     dm.qryEntradaNF.SQL.Clear;
     dm.qryEntradaNF.SQL.Add(SELECT);
     dm.qryEntradaNF.SQL.Add(WHERE_DATAENTRADA);
     dm.qryEntradaNF.ParamByName('data').AsDate := dtpEntrada.Date;
     dm.qryEntradaNF.Open;
     dm.cdsEntradaNF.Refresh;
end;

procedure TfrmProcura_EntradaProduto.ConsultaNota;
begin
     //Consulta para EAN13
     dm.qryEntradaNF.Close;
     dm.qryEntradaNF.SQL.Clear;
     dm.qryEntradaNF.SQL.Add(SELECT);
     if edtCodigo.Text <> '' then
     begin
        dm.qryEntradaNF.SQL.Add(WHERE_NOTA);
        dm.qryEntradaNF.ParamByName('nota').AsString := edtCodigo.Text + '%';
     end;

     dm.qryEntradaNF.Open;
     dm.cdsEntradaNF.Refresh;
end;

procedure TfrmProcura_EntradaProduto.dtpEntradaChange(Sender: TObject);
begin
     ConsultaDataEntrada();
end;

procedure TfrmProcura_EntradaProduto.edtCodigoChange(Sender: TObject);
begin
    ConsultaNota();
end;

procedure TfrmProcura_EntradaProduto.FormCreate(Sender: TObject);
begin
     //Consulta para Data de Entrada
     dm.cdsEntradaNF.Close;
     dm.qryEntradaNF.Close;
     dm.qryEntradaNF.SQL.Clear;
     dm.qryEntradaNF.SQL.Add(SELECT);
     dm.qryEntradaNF.Open;
     dm.cdsEntradaNF.Open;
     dm.cdsEntradaNF.Refresh;
end;

procedure TfrmProcura_EntradaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmProcura_EntradaProduto.Close;
     if Key = VK_F5 then
     begin
        try
          //frmRelatorio := TfrmRelatorio.Create(self);
          //frmRelatorio.GeraReport('Report_Produtos', 'RTProdutos.rav');
        finally
          //FreeAndNil(frmRelatorio);
        end;
     end;
end;

procedure TfrmProcura_EntradaProduto.grdProdDblClick(Sender: TObject);
begin
    CarregaCampos;
end;

procedure TfrmProcura_EntradaProduto.grdProdKeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key = #13 then
     begin
         CarregaCampos();
     end;
end;

procedure TfrmProcura_EntradaProduto.rgOpcaoClick(Sender: TObject);
begin
    //Verifica se a opção selecionada
    if rgOpcao.ItemIndex = 1 then
    begin
       //Habilita o DataTimerPicker e desabilita o edit
       dtpEntrada.Visible := True;
       edtCodigo.Visible    := False;
    end
    else
    begin
       //Habilita o edit e desabilita o DataTimerPicker
       dtpEntrada.Visible := false;
       edtCodigo.Visible    := true;
       edtCodigo.SetFocus;
    end;
end;

end.
