unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ACBrBase, ACBrEnterTab, SqlExpr;

type
  TfrmConfig = class(TForm)
    pnl3: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    Panel1: TPanel;
    pgConfig: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grpEmpresa: TGroupBox;
    grpGeral: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtRazao: TEdit;
    edtRua: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    edtUF: TEdit;
    edtCNPJ: TEdit;
    edtInsc: TEdit;
    edtResponsavel: TEdit;
    edtFone: TEdit;
    ACBrEnterTab1: TACBrEnterTab;
    lbl1: TLabel;
    lbl7: TLabel;
    grpImpressora: TGroupBox;
    lbl4: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    cmbImpressora: TComboBox;
    lbl5: TLabel;
    edtVelocidade: TEdit;
    Label11: TLabel;
    cmbPorta: TComboBox;
    grp1: TGroupBox;
    lbl6: TLabel;
    lbl8: TLabel;
    edtMsgCabecalho: TEdit;
    edtMsgRodape: TEdit;
    lbl9: TLabel;
    grp2: TGroupBox;
    ckbCabecalhoSuprimento: TCheckBox;
    ckbCabecalhoSangria: TCheckBox;
    ckbCabecalhoFechamento: TCheckBox;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    procedure CarregaDados();
    procedure GravarDados();
    function VerificaCampos(): Boolean;
    function VerificaCampoGeral(): Boolean;
    procedure ReloadConfig();
  public
    FID_Empresa: integer;
    FID_Config : integer;
  end;

var
  frmConfig: TfrmConfig;
  qry: TSQLQuery;

const
   // Intrução SQL para carregar os dados da Empresa
   SELECT_EMPRESA: string = 'SELECT FIRST 1 SKIP 0 ID, RAZAO, RUA, BAIRRO, NUMERO, CIDADE, UF, CNPJ, INSCRICAO_ESTADUAL, PROPRIETARIO, FONE FROM EMPRESA';

   // Intrução SQL para carregar os dados gerais
   SELECT_GERAL : string = 'SELECT FIRST 1 SKIP 0 ID, MODELO_IMPRESSORA, PORTA, VELOCIDADE, MSG_CABECALHO, MSG_RODAPE, CABECALHO_SANGRIA, CABECALHO_SUPRIMENTO, CABECALHO_FECHAMENTO FROM CONFIG';

   // Instrução SQL para inserir os dados da empresa
   INSERT_EMPRESA: string = 'INSERT INTO EMPRESA (RAZAO, RUA, NUMERO, BAIRRO, CIDADE, UF, CNPJ, INSCRICAO_ESTADUAL, PROPRIETARIO, FONE)VALUES(:razao, :rua, :numero, :bairro, :cidade, :uf, :cnpj, :insc, :propriet, :fone)';

   // Intrução SQL para atualizar os dados da Empresa
   UPDATE_EMPRESA : string = 'UPDATE EMPRESA SET RAZAO=:razao ,RUA=:rua , NUMERO=:numero ,BAIRRO=:bairro ,CIDADE=:cidade ,UF=:uf, CNPJ=:cnpj, INSCRICAO_ESTADUAL=:insc ,PROPRIETARIO=:propriet ,FONE=:fone WHERE ID=:id';

   // Intrução SQL para inserir os dados da Gerais
   INSERT_GERAL : string = 'INSERT INTO CONFIG (MODELO_IMPRESSORA, PORTA, VELOCIDADE, MSG_CABECALHO, MSG_RODAPE, CABECALHO_SANGRIA, CABECALHO_SUPRIMENTO, CABECALHO_FECHAMENTO)VALUES(:modelo, :porta, :velocidade, :msgC, :msgR, :cabSa, :cabSu, :cabFe)';

   // Intrução SQL para atualizar os dados da Empresa
   UPDATE_GERAL : string = 'UPDATE CONFIG SET MODELO_IMPRESSORA=:modelo, PORTA=:porta, VELOCIDADE=:velocidade, MSG_CABECALHO=:msgC, MSG_RODAPE=:msgR, CABECALHO_SANGRIA=:cabSa, CABECALHO_SUPRIMENTO=:cabSu, CABECALHO_FECHAMENTO=:cabFe WHERE ID=:id';

implementation

uses UdmConexao, uMenu;

{$R *.dfm}

{ TfrmConfig }

procedure TfrmConfig.btn2Click(Sender: TObject);
begin
    GravarDados;
end;

procedure TfrmConfig.CarregaDados;
begin
     try
        try
           qry := TSQLQuery.Create(nil);
           qry.SQLConnection := dmConexao.Conexao;

           qry.Close;
           qry.SQL.Clear;
           qry.SQL.Add(SELECT_EMPRESA);
           qry.Open;

           if not qry.IsEmpty then
           begin
               FID_Empresa         := qry.Fields[0].AsInteger;
               edtRazao.Text       := qry.Fields[1].AsString;
               edtRua.Text         := qry.Fields[2].AsString;
               edtNumero.Text      := qry.Fields[3].AsString;
               edtBairro.Text      := qry.Fields[4].AsString;
               edtCidade.Text      := qry.Fields[5].AsString;
               edtUF.Text          := qry.Fields[6].AsString;
               edtCNPJ.Text        := qry.Fields[7].AsString;
               edtInsc.Text        := qry.Fields[8].AsString;
               edtResponsavel.Text := qry.Fields[9].AsString;
               edtFone.Text        := qry.Fields[10].AsString;
           end;

           qry.Close;
           qry.SQL.Clear;
           qry.SQL.Add(SELECT_GERAL);
           qry.Open;

           if not qry.IsEmpty then
           begin
               FID_Config              := qry.Fields[0].AsInteger;
               cmbImpressora.ItemIndex := cmbImpressora.Items.IndexOf(qry.Fields[1].AsString);
               cmbPorta.ItemIndex      := cmbPorta.Items.IndexOf(qry.Fields[2].AsString);
               edtVelocidade.Text      := IntToStr(qry.Fields[3].AsInteger);
               edtMsgCabecalho.Text    := qry.Fields[4].AsString;
               edtMsgRodape.Text       := qry.Fields[5].AsString;
               ckbCabecalhoSangria.Checked    := Boolean(qry.Fields[6].AsInteger);
               ckbCabecalhoSuprimento.Checked := Boolean(qry.Fields[7].AsInteger);
               ckbCabecalhoFechamento.Checked := Boolean(qry.Fields[8].AsInteger);
           end;
        finally
            FreeAndNil(qry);
        end;
     except
         on E:Exception do
         MessageDlg('Erro ao carregar dados: ' + E.Message, mtError, [mbOK], 0);
     end;
end;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
    CarregaDados;
end;

procedure TfrmConfig.GravarDados;
begin
    try
        try
            qry := TSQLQuery.Create(nil);
            qry.SQLConnection := dmConexao.Conexao;

            if (pgConfig.ActivePageIndex = 0) and (VerificaCampos) then
            begin
                if (FID_Empresa = 0)  or (FID_Empresa = null) then
                begin
                    qry.Close;
                    qry.SQL.Clear;
                    qry.SQL.Add(INSERT_EMPRESA);
                    qry.ParamByName('razao').AsString    := edtRazao.Text;
                    qry.ParamByName('rua').AsString      := edtRua.Text;
                    qry.ParamByName('numero').AsString   := edtNumero.Text;
                    qry.ParamByName('bairro').AsString   := edtBairro.Text;
                    qry.ParamByName('cidade').AsString   := edtCidade.Text;
                    qry.ParamByName('uf').AsString       := edtUF.Text;
                    qry.ParamByName('cnpj').AsString     := edtCNPJ.Text;
                    qry.ParamByName('insc').AsString     := edtInsc.Text;
                    qry.ParamByName('propriet').AsString := edtResponsavel.Text;
                    qry.ParamByName('fone').AsString     := edtFone.Text;
                    qry.ExecSQL() ;
                end
                else
                begin
                    qry.Close;
                    qry.SQL.Clear;
                    qry.SQL.Add(UPDATE_EMPRESA);
                    qry.ParamByName('id').AsInteger      := FID_Empresa;
                    qry.ParamByName('razao').AsString    := edtRazao.Text;
                    qry.ParamByName('rua').AsString      := edtRua.Text;
                    qry.ParamByName('numero').AsString   := edtNumero.Text;
                    qry.ParamByName('bairro').AsString   := edtBairro.Text;
                    qry.ParamByName('cidade').AsString   := edtCidade.Text;
                    qry.ParamByName('uf').AsString       := edtUF.Text;
                    qry.ParamByName('cnpj').AsString     := edtCNPJ.Text;
                    qry.ParamByName('insc').AsString     := edtInsc.Text;
                    qry.ParamByName('propriet').AsString := edtResponsavel.Text;
                    qry.ParamByName('fone').AsString     := edtFone.Text;
                    qry.ExecSQL() ;
                end;
                MessageDlg('Dados gravados com sucesso!', mtInformation, [mbOK], 0);
            end;

            if (pgConfig.ActivePageIndex = 1) and (VerificaCampos) then
            begin
                if (FID_Config = 0) or (FID_Config = null) then
                begin
                    qry.Close;
                    qry.SQL.Clear;
                    qry.SQL.Add(INSERT_GERAL);
                    qry.ParamByName('modelo').AsString     := cmbImpressora.Text;
                    qry.ParamByName('porta').AsString      := cmbPorta.Text;
                    qry.ParamByName('velocidade').AsString := edtVelocidade.Text;
                    qry.ParamByName('msgC').AsString       := edtMsgCabecalho.Text;
                    qry.ParamByName('msgR').AsString       := edtMsgRodape.Text;
                    qry.ParamByName('cabSa').AsInteger     := Integer(ckbCabecalhoSangria.Checked);
                    qry.ParamByName('cabSu').AsInteger     := Integer(ckbCabecalhoSuprimento.Checked);
                    qry.ParamByName('cabFe').AsInteger     := Integer(ckbCabecalhoFechamento.Checked);
                    qry.ExecSQL();
                end
                else
                begin
                    qry.Close;
                    qry.SQL.Clear;
                    qry.SQL.Add(UPDATE_GERAL);
                    qry.ParamByName('id').AsInteger        := FID_Config;
                    qry.ParamByName('modelo').AsString     := cmbImpressora.Text;
                    qry.ParamByName('porta').AsString      := cmbPorta.Text;
                    qry.ParamByName('velocidade').AsString := edtVelocidade.Text;
                    qry.ParamByName('msgC').AsString       := edtMsgCabecalho.Text;
                    qry.ParamByName('msgR').AsString       := edtMsgRodape.Text;
                    qry.ParamByName('cabSa').AsInteger     := Integer(ckbCabecalhoSangria.Checked);
                    qry.ParamByName('cabSu').AsInteger     := Integer(ckbCabecalhoSuprimento.Checked);
                    qry.ParamByName('cabFe').AsInteger     := Integer(ckbCabecalhoFechamento.Checked);
                    qry.ExecSQL();
                end;
                MessageDlg('Dados gravados com sucesso!', mtInformation, [mbOK], 0);
            end;

            ReloadConfig();
        finally
            FreeAndNil(qry);
        end;
     except
         on E:Exception do
         MessageDlg('Erro ao gravar dados: ' + E.Message, mtError, [mbOK], 0);
     end;
end;

procedure TfrmConfig.ReloadConfig;
var
   qry: TSQLQuery;
begin
    try
       qry := TSQLQuery.Create(nil);
       qry.SQLConnection := dmConexao.Conexao;

       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add(SELECT_EMPRESA);
       qry.Open;

       if not qry.IsEmpty then
       begin
          frmMenu.FRazao        := qry.Fields[1].AsString;
          frmMenu.FRua          := qry.Fields[2].AsString;
          frmMenu.FNumero       := qry.Fields[3].AsString;
          frmMenu.FBairro       := qry.Fields[4].AsString;
          frmMenu.FCidade       := qry.Fields[5].AsString;
          frmMenu.FUF           := qry.Fields[6].AsString;
          frmMenu.FCNPJ         := qry.Fields[7].AsString;
          frmMenu.FInscricao    := qry.Fields[8].AsString;
          frmMenu.FProprietario := qry.Fields[9].AsString;
          frmMenu.FFone         := qry.Fields[10].AsString;
       end;

       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add(SELECT_GERAL);
       qry.Open;

       if not qry.IsEmpty then
       begin
          frmMenu.FModelo        := qry.Fields[1].AsString;
          frmMenu.FPorta         := qry.Fields[2].AsString;
          frmMenu.FVelocidade    := qry.Fields[3].AsString;
          frmMenu.FMsgCabecalho  := qry.Fields[4].AsString;
          frmMenu.FMsgRodape     := qry.Fields[5].AsString;
          frmMenu.FCabSangria    := Boolean(qry.Fields[6].AsInteger);
          frmMenu.FCabSuprimento := Boolean(qry.Fields[7].AsInteger);
          frmMenu.FCabFechamento := Boolean(qry.Fields[8].AsInteger);
       end;
    except
         on E:Exception do
         MessageDlg('Erro ao recarregar dados: ' + E.Message, mtError, [mbOK], 0);
    end;
end;

function TfrmConfig.VerificaCampos: Boolean;
var
   i, x : integer;
   resp: Boolean;
begin
    resp := true;
    if (pgConfig.ActivePageIndex = 0) then
    begin
        for i := 0 to ComponentCount - 1 do
        begin
            if (Components[i] is TEdit) and (TEdit(Components[i]).Parent = grpEmpresa) and (TEdit(Components[i]).Text = '') then
            begin
               resp := false;
               break;
            end;
        end;
    end;

    if (pgConfig.ActivePageIndex = 1) then
    begin
        for i := 0 to ComponentCount - 1 do
        begin
            if (Components[i] is TComboBox) and (TComboBox(Components[i]).Parent = grpImpressora) and (TComboBox(Components[i]).Text = '') then
            begin
               resp := false;
               break;
            end;

            if (Components[i] is TEdit) and (TEdit(Components[i]).Parent = grpImpressora) and (TEdit(Components[i]).Text = '') then
            begin
               resp := false;
               break;
            end;
        end;
    end;

    if not resp then
    begin
       Result := resp;
       MessageDlg('Existem campos obrigatórios(*) sem preenchimento!', mtError, [mbOK], 0);
       exit;
    end;

    Result := resp;
end;

function TfrmConfig.VerificaCampoGeral: Boolean;
var
   i : integer;
   resp: Boolean;
begin
    resp := true;
    for i := 0 to ComponentCount - 1 do
    begin
        if (Components[i] is TComboBox) and (TComboBox(Components[i]).Text = '') then
        begin
           resp := false;
           break;
        end;
    end;

    if not resp then
    begin
       Result := resp;
       MessageDlg('Existem campos obrigatórios(*) sem preenchimento!', mtError, [mbOK], 0);
       Exit;
    end;

    Result := resp;
end;

end.
