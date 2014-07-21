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
      procedure ConsultaGeral();
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

  // Instrução SQL SELECT para relatório comparativo Entrada de Produto x Estoque
  SELECT_COMPARATIVO: string = 'SELECT N.VALOR_TOTAL, N.CHAVE_NFE, P.N_NOTA, N.DATA_CADASTRO, P.EAN13, PR.DESC_PROD, P.QTDE_CONVERSAO, P.UND_CONVERSAO, E.QTDE, P.VAL_CUSTO, P.VAL_VENDA, F.DESC_FORN ';

  // Instrução SQL FROM para relatório comparativo Entrada de Produto x Estoque
  FROM_COMPARATIVO: string = 'FROM ENTRADA_PRODUTO P INNER JOIN ESTOQUE E ON P.EAN13 = E.EAN13 '+
                                                     'INNER JOIN ENTRADA_NF N ON N.N_NOTA = P.N_NOTA '+
                                                     'INNER JOIN PRODUTO PR   ON PR.EAN13 = P.EAN13 '+
                                                     'INNER JOIN FORNECEDOR F ON F.COD_FORN = N.COD_FORN ';


implementation

uses uDm, uEntrada_Produtos, uRelatorio;

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

procedure TfrmProcura_EntradaProduto.ConsultaGeral;
begin
     dm.cdsEntradaNF.Close;
     dm.qryEntradaNF.Close;
     dm.qryEntradaNF.SQL.Clear;
     dm.qryEntradaNF.SQL.Add(SELECT);
     dm.qryEntradaNF.SQL.Add(ORDERBY);
     dm.qryEntradaNF.Open;
     dm.cdsEntradaNF.Open;
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
     Self.ConsultaGeral;
end;

procedure TfrmProcura_EntradaProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_ESCAPE then frmProcura_EntradaProduto.Close;
     if Key = VK_F5 then
     begin
         try
            dm.cdsEntradaEstoque.Close;
            dm.qryEntradaEstoque.Close;
            dm.qryEntradaEstoque.SQL.Clear;
            dm.qryEntradaEstoque.SQL.Add(SELECT_COMPARATIVO);
            dm.qryEntradaEstoque.SQL.Add(FROM_COMPARATIVO);
            dm.qryEntradaEstoque.SQL.Add('WHERE N.N_NOTA = ' + dm.cdsEntradaNF.FieldByName('N_NOTA').AsString);
            dm.qryEntradaEstoque.Open;
            dm.cdsEntradaEstoque.Open;
            dm.cdsEntradaEstoque.Refresh;

            frmRelatorio := TfrmRelatorio.Create(nil);
            frmRelatorio.rlEntradaEstoque.Preview();
         finally
            FreeAndNil(frmRelatorio);
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
       edtCodigo.Visible  := False;
       Self.ConsultaGeral;
    end
    else
    begin
       //Habilita o edit e desabilita o DataTimerPicker
       dtpEntrada.Visible := false;
       edtCodigo.Clear;
       edtCodigo.Visible  := true;
       edtCodigo.SetFocus;
       Self.ConsultaGeral;
    end;
end;

end.
