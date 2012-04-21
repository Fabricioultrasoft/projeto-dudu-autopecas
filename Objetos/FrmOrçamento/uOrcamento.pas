unit uOrcamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ComCtrls, ExtCtrls, Grids, DBGrids,
  FMTBcd, DB, SqlExpr, uFormBase;

type
  TfrmOrcamento = class(TFormBaseCad)
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
    grpOrcamento: TGroupBox;
    dbgrdPesquisa: TDBGrid;
    pnl: TPanel;
    edtpesq: TEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    dtpOrcamento: TDateTimePicker;
    lbl3: TLabel;
    cmbTipo: TComboBox;
    lbl4: TLabel;
    edtCod_Func: TEdit;
    btnProc_Func: TSpeedButton;
    pnl2: TPanel;
    grdOrcamento: TDBGrid;
    pnl3: TPanel;
    lbl2: TLabel;
    edtVal_Total: TEdit;
    lbl5: TLabel;
    edtNumero: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    cmbPagamento: TComboBox;
    rgOpcao: TRadioGroup;
    lbl8: TLabel;
    dtpPesquisa: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyDown(var Key: Word; Shift: TShiftState);override;
    procedure btnSairClick(Sender: TObject);
    procedure grdOrcamentoEditButtonClick(Sender: TObject);
    procedure Incluir();                 override;
    procedure Gravar(Parametro: string); override;
    procedure Editar();                  override;
    procedure Excluir();                 override;
    procedure ExcluirItem();
    procedure CarregaPagamento();
    procedure AtualizaGrid();
    procedure CarregaConsulta();
    function GeraCodigo: string;
    function  VerificaCampo: boolean;
    procedure CarregaOrcamento();
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnProc_FuncClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure rgOpcaoClick(Sender: TObject);
    procedure edtpesqChange(Sender: TObject);
    procedure dtpPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
     Param: string;
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

const
    SELECT : string = 'SELECT O.COD_ORC, O.DATA_ORCAMENTO, O.TIPO_ORCAMENTO, P.TIPO_PAGAMENTO, O.COD_FUNC, U.DESC_USUARIO, O.VAL_TOTAL, O.ID_PAGAMENTO '+
                      'FROM ORCAMENTO O, USUARIO U, PAGAMENTO P '+
                      'WHERE O.COD_FUNC = U.COD_USER AND O.ID_PAGAMENTO = P.ID';

implementation

uses uDm, UdmConexao, uProcura_Estoque, uProcura_Funcionario;

{$R *.dfm}

procedure TfrmOrcamento.AtualizaGrid;
begin
    //Método para atualizar as informações do ClientDataSet
    dm.cdsOrcamento.Close;
    CarregaConsulta();
    dm.cdsOrcamento.Open;
end;

procedure TfrmOrcamento.btnEditarClick(Sender: TObject);
begin
    Editar();
end;

procedure TfrmOrcamento.btnExcluirClick(Sender: TObject);
begin
    Excluir;
end;

procedure TfrmOrcamento.btnIncluirClick(Sender: TObject);
begin
     Incluir();
end;

procedure TfrmOrcamento.btnProc_FuncClick(Sender: TObject);
begin
    //Chama o formulário de consulta de funcionários
    frmProcura_Funcionario := TfrmProcura_Funcionario.Create(self);
    frmProcura_Funcionario.ShowModal;
end;

procedure TfrmOrcamento.btnSairClick(Sender: TObject);
begin
     frmOrcamento.Close;
end;

procedure TfrmOrcamento.btnSalvarClick(Sender: TObject);
begin
     Gravar(Param);
end;

procedure TfrmOrcamento.CarregaConsulta;
begin
    //Carregar informações do banco de dados e atualizar o ClientDataSet
    dm.qryOrcamento.Close;
    dm.qryOrcamento.SQL.Clear;
    dm.qryOrcamento.SQL.Add(SELECT);
    dm.qryOrcamento.Open;
    dm.cdsOrcamento.Open;
    dm.cdsOrcamento.Refresh;
end;

procedure TfrmOrcamento.CarregaOrcamento();
begin
    //Carregar informações do DBGrid nos respectivos campos do frmOrçamento
    dm.qryItem_Orc.Close;
    dm.qryItem_Orc.SQL.Clear;
    dm.qryItem_Orc.SQL.Add('SELECT ID, COD_ORC, COD_PROD, REF_PROD, DESC_PROD, QTDE, VAL_PROD, TOTAL_PROD, TIPO_ENTRADA, TIPO_ORCAMENTO');
    dm.qryItem_Orc.SQL.Add('FROM ITEM_ORCAMENTO ');
    dm.qryItem_Orc.SQL.Add('WHERE COD_ORC = :CODIGO');
    dm.qryItem_Orc.ParamByName('CODIGO').AsString := dm.cdsOrcamento.FieldByName('COD_ORC').AsString;
    dm.qryItem_Orc.Open;
    dm.cdsItem_Orc.Open;
    dm.cdsItem_Orc.Refresh;

    edtNumero.Text         := dm.cdsOrcamento.FieldByName('COD_ORC').AsString;
    edtCod_Func.Text       := dm.cdsOrcamento.FieldByName('COD_FUNC').AsString;
    dtpOrcamento.Date      := dm.cdsOrcamento.FieldByName('DATA_ORCAMENTO').AsDateTime;
    edtVal_Total.Text      := FormatFloat('##0.00', dm.cdsOrcamento.FieldByName('VAL_TOTAL').AsFloat);
    cmbTipo.ItemIndex      := cmbTipo.Items.IndexOf(dm.cdsOrcamento.FieldByName('TIPO_ORCAMENTO').AsString);
    cmbPagamento.ItemIndex := dm.cdsOrcamento.FieldByName('ID_PAGAMENTO').AsInteger -1;
end;

procedure TfrmOrcamento.CarregaPagamento;
var
   qry  : TSQLQuery;
   lista: TStringList;
begin
    //Carregar tipos de pagamentos no combobox
    try
        lista := TStringList.Create;
    
        qry := TSQLQuery.Create(nil);
        qry.SQLConnection := dmConexao.Conexao;
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT ID, TIPO_PAGAMENTO FROM PAGAMENTO');
        qry.Open;

        qry.First;
        while not qry.Eof do
        begin
            lista.Add(qry.Fields[0].AsString + ' - '  + qry.Fields[1].AsString);
            qry.Next;
        end;

        cmbPagamento.Items.AddStrings(lista);
    finally
        FreeAndNil(qry);
    end;
end;

procedure TfrmOrcamento.dbgrdPesquisaCellClick(Column: TColumn);
begin
    //dispara o evento para carregar as informações
    CarregaOrcamento();
end;

procedure TfrmOrcamento.dtpPesquisaChange(Sender: TObject);
begin
    //Pesquisa passando como parãmetro data do orçamento
    dm.qryOrcamento.Close;
    dm.qryOrcamento.SQL.Clear;
    dm.qryOrcamento.SQL.Add(SELECT);
    dm.qryOrcamento.SQL.Add('AND DATA_ORCAMENTO = :dt');
    dm.qryOrcamento.ParamByName('dt').AsDate := dtpPesquisa.Date;
    dm.qryOrcamento.Open;
    dm.cdsOrcamento.Open;
    dm.cdsOrcamento.Refresh;
end;

procedure TfrmOrcamento.Editar;
begin
    //Procedimento de edição do orçamento
    inherited;
    Param                      := 'U';
    grpOrcamento.Enabled       := True;
    pgCadastro.ActivePageIndex := 0;
    dtpOrcamento.SetFocus;
end;

procedure TfrmOrcamento.edtpesqChange(Sender: TObject);
begin
    //Procedimento de pesquisa no edit
    if edtpesq.Text <> '' then
    begin
        dm.qryOrcamento.Close;
        dm.qryOrcamento.SQL.Clear;
        dm.qryOrcamento.SQL.Add(SELECT);
        case rgOpcao.ItemIndex of
           0: dm.qryOrcamento.SQL.Add('AND COD_ORC LIKE ' + QuotedStr(edtpesq.Text + '%'));
           1: dm.qryOrcamento.SQL.Add('AND DATA_ORCAMENTO =' + FormatDateTime('dd/mm/yyyy', dtpPesquisa.Date));
           2: dm.qryOrcamento.SQL.Add('');
        end;
        dm.qryOrcamento.Open;
    end
    else
    begin
        CarregaConsulta;
    end;
    dm.cdsOrcamento.Refresh;
end;

procedure TfrmOrcamento.Excluir;
begin
    //Procedimento de exclusão de orçamento

    try
        if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            dm.qryOrcamento.Close;
            dm.qryOrcamento.SQL.Clear;
            dm.qryOrcamento.SQL.Add('DELETE FROM ORCAMENTO WHERE COD_ORC = :codigo');
            dm.qryOrcamento.ParamByName('codigo').AsString := dm.cdsOrcamento.FieldByName('COD_ORC').AsString;
            dm.qryOrcamento.ExecSQL();
            LimpaCampos();
            grpOrcamento.Enabled := False;
            AtualizaGrid();
            dm.cdsItem_Orc.EmptyDataSet;
        end;
    except
        on E:Exception do
        ShowMessage('Erro ao excluir registro !'#13#10 + E.Message);
    end;
end;

procedure TfrmOrcamento.ExcluirItem;
begin
    //Procedimento de exclusão de item do orçamento
    try
        if (dm.cdsItem_Orc.IsEmpty) or (dm.cdsItem_Orc.State in [dsinsert, dsedit]) then
           dm.cdsItem_Orc.Cancel
        else
           if Application.MessageBox('Deseja excluir esse registro?', 'Confirmação', MB_YESNO)= mrYes then
           begin
              //Antes de excluir tem que subtrair do valor total do Orçamento
              edtVal_Total.Text := FormatFloat('##0.00', (dm.cdsItem_Orc.FieldByName('S_TOTAL_PROD').Value - dm.cdsItem_Orc.FieldByName('TOTAL_PROD').Value));
              dm.cdsItem_Orc.Delete;
           end;

    except
        on E:Exception do
        ShowMessage('Erro ao excluir Item !'#13#10 + E.Message);
    end;
end;

procedure TfrmOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (dm.cdsItem_Orc.Active) and ((dm.cdsItem_Orc.ChangeCount > 0) or (Param <> '')) then
     begin
        if Application.MessageBox('Deseja gravar alterações antes de sair?', 'Confirmação', MB_YESNO)= mrYes then
        begin
            Gravar(param);
        end
     end;
     dm.cdsItem_Orc.Close;
     action       := caFree;
     frmOrcamento := nil;
end;

procedure TfrmOrcamento.FormCreate(Sender: TObject);
begin
    CarregaPagamento;
end;

procedure TfrmOrcamento.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
    inherited;
    if (Key = VK_F8) and (dm.cdsOrcamento.State in [dsinsert, dsEdit])  then
    begin
         frmProcura_Funcionario := TfrmProcura_Funcionario.Create(self);
         frmProcura_Funcionario.ShowModal;
    end;

    if (Key = vk_f9) and (dm.cdsItem_Orc.State in [dsinsert, dsEdit]) then
    begin
         frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
         frmProcura_Estoque.ShowModal;
    end;

    if key = VK_F5 then ExcluirItem;
end;

procedure TfrmOrcamento.rgOpcaoClick(Sender: TObject);
begin
    if rgOpcao.ItemIndex = 1 then
    begin
       //Habilita o dtpPesquisa para consulta e desabilita edtpesq
       dtpPesquisa.Visible := True;
       edtpesq.Visible    := False;
    end
    else
    begin
       //Habilita o edtpesq para consulta e desabilita dtpPesquisa
       dtpPesquisa.Visible := false;
       edtpesq.Visible    := true;
       edtpesq.SetFocus;
    end;

    //Carrega todos os Orçamentos
    if rgOpcao.ItemIndex = 2 then CarregaConsulta;
end;

function TfrmOrcamento.GeraCodigo: string;
var
   qryCodigo: TSQLQuery;
begin

    //Função para capturar o código gerado na procedure do banco de dados
    try
        try
            qryCodigo := TSQLQuery.Create(nil);
            qryCodigo.SQLConnection := dmConexao.Conexao;

            qryCodigo.Close;
            qryCodigo.SQL.Clear;
            qryCodigo.SQL.Add('SELECT CODIGO FROM sp_formata_NUMERO(GEN_ID(gen_orcamento_id, 1), :dt)');
            qryCodigo.ParamByName('dt').AsString := FormatDateTime('/yy', Now);
            qryCodigo.Open;

            Result := qryCodigo.Fields[0].AsString;
        except
            on E:Exception do
            ShowMessage('Erro gerar Código do Orçamento!'#13#10 + E.Message);
        end;
    finally
        FreeAndNil(qryCodigo);
    end;
end;

procedure TfrmOrcamento.Gravar(Parametro: string);
begin
     //Procedimento de gravação do orçamento

     //Verifica se a operação é Inclusão
     if (Parametro = 'I') then
     begin
         if (VerificaCampo) then
         begin
             try
                  dm.qryOrcamento.Close;
                  dm.qryOrcamento.SQL.Clear;
                  dm.qryOrcamento.SQL.Add('INSERT INTO ORCAMENTO (COD_ORC, DATA_ORCAMENTO, TIPO_ORCAMENTO, COD_FUNC, VAL_TOTAL, ID_PAGAMENTO)'+
                  'VALUES(:cod_orc, :data, :tipo, :cod_func, :valor_total, :id)');
                  dm.qryOrcamento.Params.ParamByName('cod_orc').AsString     := edtNumero.Text;
                  dm.qryOrcamento.Params.ParamByName('data').AsDate          := dtpOrcamento.Date;
                  dm.qryOrcamento.Params.ParamByName('tipo').AsString        := cmbTipo.Text;
                  dm.qryOrcamento.Params.ParamByName('cod_func').AsString    := edtCod_Func.Text;
                  dm.qryOrcamento.Params.ParamByName('valor_total').AsFloat  := dm.cdsItem_Orc.FieldByName('S_TOTAL_PROD').Value;
                  dm.qryOrcamento.Params.ParamByName('id').AsInteger          := cmbPagamento.ItemIndex + 1;
                  dm.qryOrcamento.ExecSQL();
                  dm.cdsItem_Orc.ApplyUpdates(0);
                  LimpaCampos();
                  AtualizaGrid();
                  grpOrcamento.Enabled := False;
             except
                  on E:Exception do
                  ShowMessage('Erro ao gravar registro !'#13#10 + E.Message);
             end;
         end;
     end
     else
     begin
          //Verifica se a operação é Update
          if (Parametro = 'U') then
          begin
              try
                  dm.qryOrcamento.Close;
                  dm.qryOrcamento.SQL.Clear;
                  dm.qryOrcamento.SQL.Add('UPDATE ORCAMENTO SET '+
                  'DATA_ORCAMENTO=:data ,TIPO_ORCAMENTO=:tipo, COD_FUNC=:cod_func, VAL_TOTAL=:valor_total, ID_PAGAMENTO=:id '+
                  'WHERE COD_ORC=:cod_orc');
                  dm.qryOrcamento.Params.ParamByName('cod_orc').AsString     := edtNumero.Text;
                  dm.qryOrcamento.Params.ParamByName('data').AsDate          := dtpOrcamento.Date;
                  dm.qryOrcamento.Params.ParamByName('tipo').AsString        := cmbTipo.Text;
                  dm.qryOrcamento.Params.ParamByName('cod_func').AsString    := edtCod_Func.Text;
                  dm.qryOrcamento.Params.ParamByName('valor_total').AsFloat  := StrToFloat(edtVal_Total.Text);
                  dm.qryOrcamento.Params.ParamByName('id').AsInteger          := cmbPagamento.ItemIndex + 1;
                  dm.qryOrcamento.ExecSQL();
                  dm.cdsItem_Orc.ApplyUpdates(0);
                  AtualizaGrid();
                  grpOrcamento.Enabled := False;
                  LimpaCampos();
              except
                  on E:Exception do
                  ShowMessage('Erro ao editar registro !'#13#10 + E.Message);
              end;
          end;
     end;

     //Limpa o valor da variável de operações
     Param := '';
     dm.cdsItem_Orc.Close;
end;

procedure TfrmOrcamento.grdOrcamentoEditButtonClick(Sender: TObject);
begin
     //Carrega o frmEstoque para incluir um item
     if grdOrcamento.SelectedField = dm.cdsItem_Orc.FieldByName('COD_PROD') then
     begin
          frmProcura_Estoque := TfrmProcura_Estoque.Create(self);
          frmProcura_Estoque.ShowModal;
     end;
end;

procedure TfrmOrcamento.Incluir;
begin
    //Procedimento de inclusão de novo orçamento
    inherited;
    edtNumero.Text             := GeraCodigo;
    dtpOrcamento.Date          := Now;
    grpOrcamento.Enabled       := True;
    Param                      := 'I';
    pgCadastro.ActivePageIndex := 0;
    dm.cdsItem_Orc.Open;
    dm.cdsItem_Orc.EmptyDataSet;
    dtpOrcamento.SetFocus;
end;

procedure TfrmOrcamento.TabSheet1Show(Sender: TObject);
begin
    //Atualiza o cdsOrçamento e fecha o cdsItem_Orc
    AtualizaGrid();
    dm.cdsItem_Orc.Close;
end;

function TfrmOrcamento.VerificaCampo: boolean;
begin
      //Verifica se existem campos obrigatórios sem preenchimento
      if (edtCod_Func.Text <> '') and (dm.cdsItem_Orc.RecordCount > 0) then
      begin
         Result := True;
      end
      else
      begin
          if edtCod_Func.Text = '' then
              Application.MessageBox('É necessário informar o ID do funcionário!', 'Erro', MB_OK)
          else
              Application.MessageBox('Não existem itens nesse Orçamento!', 'Erro', MB_OK);

          Abort;
          Result := False;
      end;
end;
end.
