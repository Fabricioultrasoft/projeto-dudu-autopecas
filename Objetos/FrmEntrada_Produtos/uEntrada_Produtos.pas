unit uEntrada_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  uFormBase, uCad_Fornecedor, uProcura_Fornecedor;

type
  TfrmEntrada_Produtos = class(TFormBaseCad)
    ToolBar1: TToolBar;
    btnIncluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnRelat: TBitBtn;
    btnSair: TBitBtn;
    pgCadastro: TPageControl;
    tsCadastro: TTabSheet;
    TabSheet1: TTabSheet;
    grp1: TGroupBox;
    grpEntrada_Produtos: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    edtpesq: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dtpEntrada: TDateTimePicker;
    edtN_Documento: TEdit;
    edtCod_Prod: TEdit;
    edtQtde: TEdit;
    edtUnd: TEdit;
    cmbTipo: TComboBox;
    btnProcura_Produto: TSpeedButton;
    rgOpcao: TRadioGroup;
    lbl1: TLabel;
    dtpPesquisa: TDateTimePicker;
    lbl2: TLabel;
    edtVal_Custo: TEdit;
    lbl3: TLabel;
    edtVal_Venda: TEdit;
    lbl4: TLabel;
    edtCod_Forn: TEdit;
    btnProc_Fornecedor: TSpeedButton;
    lbl5: TLabel;
    edtReferencia: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    edtEAN13: TEdit;
    edtDUN14: TEdit;
    procedure btnProcura_ProdutoClick(Sender: TObject);
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Incluir();                   override;
    procedure Editar();                    override;
    procedure Gravar(Parametro: string);   override;
    procedure Excluir();                   override;
    function VerificaCampos: Boolean;
    procedure CarregaConsulta();
    procedure CarregaCampos();
    procedure AtualizaGrid();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtpesqChange(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
    procedure dtpPesquisaChange(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure btnRelatClick(Sender: TObject);
    procedure btnProc_FornecedorClick(Sender: TObject);
    procedure edtVal_VendaEnter(Sender: TObject);
    procedure dbgrdPesquisaTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntrada_Produtos: TfrmEntrada_Produtos;
  Param: string;

const
    //Cláusula SELECT básica para todas as consultas
    SELECT: string = 'SELECT E.N_NOTA, E.COD_PROD, P.DESC_PROD, E.QTDE, E.UND, E.TIPO_ENTRADA, E.DATA_ENTRADA, E.REF_PROD, E.COD_FORN, F.DESC_FORN, '+
                     'E.VAL_CUSTO, E.VAL_VENDA, E.EAN13, E.DUN14, E.CODIGO_NCM, E.TIPO_PROD '               +
                     'FROM ENTRADA_PRODUTO E, PRODUTO P, FORNECEDOR F '          +
                     'WHERE E.COD_PROD = P.COD_PROD AND E.COD_FORN = F.COD_FORN '+
                     'ORDER BY E.DATA_ENTRADA DESC';
implementation

uses uProcura_Produto, uDm, uRelatorio, uCalcula_Perc;

{$R *.dfm}

procedure TfrmEntrada_Produtos.AtualizaGrid;
begin
    //Atualiza os dados no ClientDataSet
    dm.cdsEntrada_Produto.Close;
    CarregaConsulta;
    dm.cdsEntrada_Produto.Open;
end;

procedure TfrmEntrada_Produtos.btnEditarClick(Sender: TObject);
begin
     Editar();
end;

procedure TfrmEntrada_Produtos.btnExcluirClick(Sender: TObject);
begin
    Excluir();
end;

procedure TfrmEntrada_Produtos.btnIncluirClick(Sender: TObject);
begin
    Incluir();
end;

procedure TfrmEntrada_Produtos.btnProcura_ProdutoClick(Sender: TObject);
begin
    //Carrega o form para procura de produtos cadastrados
    try
      frmProcura_Produto := TfrmProcura_Produto.Create(self);
      frmProcura_Produto.ShowModal;
    except
       FreeAndNil(frmProcura_Produto);
    end;
end;

procedure TfrmEntrada_Produtos.btnProc_FornecedorClick(Sender: TObject);
begin
    //Carrega o form para procura de fornecedor
    try
      frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
      frmProcura_Fornecedor.ShowModal;
    finally
      FreeAndNil(frmProcura_Fornecedor);
    end;
end;

procedure TfrmEntrada_Produtos.btnRelatClick(Sender: TObject);
begin
     //Gera o relatório
     try
       frmRelatorio := TfrmRelatorio.Create(self);
       frmRelatorio.GeraReport('Report_Entrada_Produtos', 'RTEntrada_Produtos.rav');
     finally
       FreeAndNil(frmRelatorio);
     end;
end;

procedure TfrmEntrada_Produtos.btnSairClick(Sender: TObject);
begin
    frmEntrada_Produtos.Close;
end;

procedure TfrmEntrada_Produtos.btnSalvarClick(Sender: TObject);
begin
     Gravar(Param);
end;

procedure TfrmEntrada_Produtos.CarregaCampos;
begin
    //Carregar os valores nos campos do form
    edtN_Documento.Text := dm.cdsEntrada_Produto.FieldByName('N_NOTA').AsString;
    edtCod_Prod.Text    := dm.cdsEntrada_Produto.FieldByName('COD_PROD').AsString;
    edtQtde.Text        := IntToStr(dm.cdsEntrada_Produto.FieldByName('QTDE').AsInteger);
    edtUnd.Text         := dm.cdsEntrada_Produto.FieldByName('UND').AsString;
    cmbTipo.ItemIndex   := cmbTipo.Items.IndexOf(dm.cdsEntrada_Produto.FieldByName('TIPO_ENTRADA').AsString);
    dtpEntrada.Date     := dm.cdsEntrada_Produto.FieldByName('DATA_ENTRADA').AsDateTime;
    edtCod_Forn.Text    := dm.cdsEntrada_Produto.FieldByName('COD_FORN').AsString;
    edtReferencia.Text  := dm.cdsEntrada_Produto.FieldByName('REF_PROD').AsString;
    edtVal_Custo.Text   := FormatFloat('##0.00', dm.cdsEntrada_Produto.FieldByName('VAL_CUSTO').AsFloat);
    edtVal_Venda.Text   := FormatFloat('##0.00', dm.cdsEntrada_Produto.FieldByName('VAL_VENDA').AsFloat);
    edtEAN13.Text       := dm.cdsEntrada_Produto.FieldByName('EAN13').AsString;
    edtDUN14.Text       := dm.cdsEntrada_Produto.FieldByName('DUN14').AsString;
end;

procedure TfrmEntrada_Produtos.CarregaConsulta;
begin
    //Consultas básica
    dm.qryEntrada_Produto.Close;
    dm.qryEntrada_Produto.SQL.Clear;
    dm.qryEntrada_Produto.SQL.Add(SELECT);
    dm.qryEntrada_Produto.Open;
    dm.cdsEntrada_Produto.Open;
    dm.cdsEntrada_Produto.Refresh;
end;

procedure TfrmEntrada_Produtos.dbgrdPesquisaCellClick(Column: TColumn);
begin
    CarregaCampos;
end;

procedure TfrmEntrada_Produtos.dbgrdPesquisaTitleClick(Column: TColumn);
begin
    //Ordena os registros após clik na coluna
    dm.cdsEntrada_Produto.IndexFieldNames := Column.FieldName;
end;

procedure TfrmEntrada_Produtos.dtpPesquisaChange(Sender: TObject);
begin
    //Pesquisa que passa como parâmetro a data de entrada do produto
    dm.qryEntrada_Produto.Close;
    dm.qryEntrada_Produto.SQL.Clear;
    dm.qryEntrada_Produto.SQL.Add(SELECT);
    dm.qryEntrada_Produto.SQL.Add('AND DATA_ENTRADA = :dt');
    dm.qryEntrada_Produto.ParamByName('dt').AsDate := dtpPesquisa.Date;
    dm.qryEntrada_Produto.Open;
    dm.cdsEntrada_Produto.Open;
    dm.cdsEntrada_Produto.Refresh;
end;

procedure TfrmEntrada_Produtos.Editar;
begin
     //Procedimento de Edição de registro
     inherited;
     Param                       := 'U';
     grpEntrada_Produtos.Enabled := True;
     pgCadastro.ActivePageIndex  := 0;
     edtN_Documento.SetFocus;
end;

procedure TfrmEntrada_Produtos.edtpesqChange(Sender: TObject);
begin
    //Pesquisa que passa parâmetros conforme a opção selecionada no rgOpcao
    if edtpesq.Text <> '' then
    begin
        dm.qryEntrada_Produto.Close;
        dm.qryEntrada_Produto.SQL.Clear;
        dm.qryEntrada_Produto.SQL.Add(SELECT);
        case rgOpcao.ItemIndex of
           0: dm.qryEntrada_Produto.SQL.Add('AND N_NOTA LIKE ' + QuotedStr(edtpesq.Text + '%'));
           1: dm.qryEntrada_Produto.SQL.Add('AND DESC_PROD LIKE ' + QuotedStr(edtpesq.Text + '%'));
           2: dm.qryEntrada_Produto.SQL.Add('AND DATA_ENTRADA =' + FormatDateTime('dd/mm/yyyy', dtpPesquisa.Date));
           3:dm.qryEntrada_Produto.SQL.Add('');
        end;
    end
    else
    begin
        CarregaConsulta;
    end;
    dm.cdsEntrada_Produto.Refresh;
end;

procedure TfrmEntrada_Produtos.edtVal_VendaEnter(Sender: TObject);
begin
    //Chama o form para cálculo do percentual
    if edtVal_Custo.Text <> '' then
    begin
       Try
          frmCalula_Perc := TfrmCalula_Perc.Create(self);
          frmCalula_Perc.ShowModal;
       Finally
          FreeAndNil(frmCalula_Perc);
       End;
       edtVal_Custo.SetFocus;
    end;
end;

procedure TfrmEntrada_Produtos.Excluir;
begin
    //Procedimento de exclusão de registro
    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryEntrada_Produto.Close;
            dm.qryEntrada_Produto.SQL.Clear;
            dm.qryEntrada_Produto.SQL.Add('DELETE FROM ENTRADA_PRODUTOS WHERE N_NOTA = :nota');
            dm.qryEntrada_Produto.ParamByName('nota').AsString := edtN_Documento.Text;
            dm.qryEntrada_Produto.ExecSQL();
            AtualizaGrid();
            LimpaCampos();
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
     end;
end;

procedure TfrmEntrada_Produtos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsEntrada_Produto.Close;
    Action              := caFree;
    frmEntrada_Produtos := nil;
end;

procedure TfrmEntrada_Produtos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
     inherited;

     if Key = VK_F7 then
     begin
          frmProcura_Fornecedor := TfrmProcura_Fornecedor.Create(self);
          frmProcura_Fornecedor.ShowModal;
     end;

     if Key = VK_F8 then
     begin
          frmProcura_Produto := TfrmProcura_Produto.Create(self);
          frmProcura_Produto.ShowModal;
     end;
end;

procedure TfrmEntrada_Produtos.Gravar;
begin
     //Procedimento de gravação

     //Verifica se a operação é de Inclusão
     if (Parametro = 'I') then
     begin
         if (VerificaCampos) then
         begin
             try
                  dm.qryEntrada_Produto.Close;
                  dm.qryEntrada_Produto.SQL.Clear;
                  dm.qryEntrada_Produto.SQL.Add('INSERT INTO ENTRADA_PRODUTO (N_NOTA, COD_PROD, QTDE, UND, TIPO_ENTRADA, DATA_ENTRADA, COD_FORN, ' +
                  'REF_PROD, VAL_CUSTO, VAL_VENDA, EAN13, DUN14) VALUES(:nota, :cod_prod, :qtde, :und, :tipo, :data_ent, :forn, :ref, :custo, :venda, :ean, :dun)');
                  dm.qryEntrada_Produto.Params.ParamByName('nota').AsString      := edtN_Documento.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('cod_prod').AsString  := edtCod_Prod.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('qtde').AsInteger     := StrToInt(edtQtde.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('und').AsString       := edtUnd.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('tipo').AsString      := cmbTipo.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('data_ent').AsDate    := dtpEntrada.Date;
                  dm.qryEntrada_Produto.Params.ParamByName('forn').AsString      := edtCod_Forn.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('ref').AsString       := edtReferencia.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('custo').AsFloat      := StrToFloat(edtVal_Custo.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('venda').AsFloat      := StrToFloat(edtVal_Venda.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('ean').AsString       := edtEAN13.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('dun').AsString       := edtDUN14.Text;
                  dm.qryEntrada_Produto.ExecSQL();
                  LimpaCAmpos();
                  AtualizaGrid();
                  grpEntrada_Produtos.Enabled := False;
             except
                  on E:Exception do
                  ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
             end;
         end;
     end
     else
     begin
          //Verifica se a operação é de Update
          if (Parametro = 'U') then
          begin
              try
                  dm.qryEntrada_Produto.Close;
                  dm.qryEntrada_Produto.SQL.Clear;
                  dm.qryEntrada_Produto.SQL.Add('UPDATE ENTRADA_PRODUTO SET '+
                  'N_NOTA=:nota ,COD_PROD=:cod_prod ,QTDE=:qtde , UND=:und ,TIPO_ENTRADA=:tipo ,DATA_ENTRADA=:data_ent ,COD_FORN=:forn, REF_PROD=:ref, ' +
                  'VAL_CUSTO=:custo, VAL_VENDA=:venda, EAN13=:ean, DUN14=:dun WHERE N_NOTA=:nota');
                  dm.qryEntrada_Produto.Params.ParamByName('nota').AsString      := edtN_Documento.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('cod_prod').AsString  := edtCod_Prod.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('qtde').AsInteger     := StrToInt(edtQtde.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('und').AsString       := edtUnd.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('tipo').AsString      := cmbTipo.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('data_ent').AsDate    := dtpEntrada.Date;
                  dm.qryEntrada_Produto.Params.ParamByName('nota').AsString      := edtN_Documento.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('forn').AsString      := edtCod_Forn.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('ref').AsString       := edtReferencia.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('custo').AsFloat      := StrToFloat(edtVal_Custo.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('venda').AsFloat      := StrToFloat(edtVal_Venda.Text);
                  dm.qryEntrada_Produto.Params.ParamByName('ean').AsString      := edtEAN13.Text;
                  dm.qryEntrada_Produto.Params.ParamByName('dun').AsString      := edtDUN14.Text;
                  dm.qryEntrada_Produto.ExecSQL();
                  grpEntrada_Produtos.Enabled := False;
                  AtualizaGrid;
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;
     Param := '';
end;

procedure TfrmEntrada_Produtos.Incluir;
begin
    //Procedimento de inclusão de registro
    inherited;
     Param                       := 'I';
     grpEntrada_Produtos.Enabled := True;
     pgCadastro.ActivePageIndex  := 0;
     edtN_Documento.SetFocus;
     LimpaCampos();
end;

procedure TfrmEntrada_Produtos.rgOpcaoClick(Sender: TObject);
begin
    //Verifica se a opção selecionada
    if rgOpcao.ItemIndex = 2 then
    begin
       //Habilita o DataTimerPicker e desabilita o edit
       dtpPesquisa.Visible := True;
       edtpesq.Visible    := False;
    end
    else
    begin
       //Habilita o edit e desabilita o DataTimerPicker
       dtpPesquisa.Visible := false;
       edtpesq.Visible    := true;
       edtpesq.SetFocus;
    end;

    //Carrega a consulta básica se a opção seleciona for Todos
    if rgOpcao.ItemIndex = 3 then CarregaConsulta;
end;

function TfrmEntrada_Produtos.VerificaCampos: Boolean;
begin
     //Verifica o preenchimento dos campos obrigatórios
     if (edtN_Documento.Text <> '') and (edtCod_Prod.Text <> '') and (edtQtde.Text <> '') then
     begin
        Result := True;
     end
     else
     begin
        Result := False;
        Application.MessageBox('Existem campos de preenchimento obrigatório não preenchidos!', 'Erro', MB_OK)
     end;
end;

end.
