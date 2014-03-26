{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
unit uFormBase;

interface

uses
   Forms, Windows, Classes, StdCtrls, ComCtrls, Variants, Messages, Dialogs, SysUtils, uFuncao, Buttons, Controls,
   DBGrids, Grids, Mask, JvExMask, JvToolEdit, JvBaseEdits;

type
   TFormBase = class(TForm)
   protected
        procedure KeyDown(var Key: Word; Shift: TShiftState); override;
        procedure IniciarComponentes();virtual;
    public
        procedure LimpaCampos(); virtual;
        constructor Create(Awoner: TComponent); override;

    end;

type
   TOperacao = (opNone, opInsert, opUpdate, opDelete);

type
    TFormBaseCad = class(TFormBase)
  private

  protected
      FOperacao: TOperacao;
      procedure Incluir();virtual;
      procedure Editar();virtual;
      procedure Gravar(Operacao: TOperacao);virtual;
      procedure Excluir();virtual;
      procedure Cancelar(); virtual;
      procedure KeyDown(var Key: Word; Shift: TShiftState); override;
      procedure DoClose(var Action: TCloseAction);override;
      procedure IniciarComponentes();override;

  public
      procedure SetOperacao(Operacao: TOperacao); virtual;
      constructor Create(Awoner: TComponent); override;
  end;

implementation

{ TFormBase }

constructor TFormBase.Create(Awoner: TComponent);
begin
     //Inicializa o objeto
     inherited Create(Awoner);
     IniciarComponentes;
end;

procedure TFormBase.KeyDown(var Key: Word; Shift: TShiftState);
begin
     //Seleciona o próximo controle e muda o focu pressionando a tecla ENTER
     if key = VK_RETURN then
     begin
         SelectNext(ActiveControl, True, true);
         //Perform(Wm_NextDlgCtl,0,0);
     end;


     //Fecha o formulário pressionando a tecla ESC
     if key = VK_ESCAPE then
     begin
         Close;
         Abort;
     end;
end;

procedure TFormBase.LimpaCampos;
var
   i : integer;
begin
    //Limpa o conteúdo dos controles no form
    for i := 0 to ComponentCount - 1 do
    begin
        if (Components[i] is TEdit) and (TEdit(Components[i]).Text <> '') then
           TEdit(Components[i]).Clear;

        if (Components[i] is TJvCalcEdit) and (TJvCalcEdit(Components[i]).Value <> 0) then
           TJvCalcEdit(Components[i]).Clear;

        if (Components[i] is TJvComboEdit) and (TJvComboEdit(Components[i]).Text <> '') then
           TJvComboEdit(Components[i]).Clear;

        if Components[i] is TMemo then
           TMemo(Components[i]).Lines.Clear;

        if Components[i] is TComboBox then
          TComboBox(Components[i]).ItemIndex := -1;

        if Components[i] is TDateTimePicker then
           TDateTimePicker(Components[i]).Date := Now;
    end;
end;

procedure TFormBase.IniciarComponentes;
var
   i: integer;
begin
     self.Position    := poDesktopCenter;
     self.KeyPreview  := true;
     self.ShowHint    := true;

     //Inicializa os componentes do form
     for i := 0 to ComponentCount - 1 do
     begin
         //Seta a propriedade cursor para HandPoint
         if Components[i] is TBitBtn then
            TBitBtn(Components[i]).Cursor := -21;

         if Components[i] is TButton then
            TButton(Components[i]).Cursor := -21;

         if Components[i] is TSpeedButton then
            TSpeedButton(Components[i]).Cursor := -21;

         if Components[i] is TComboBox then
            TComboBox(Components[i]).Cursor := -21;

         if Components[i] is TDBGrid then
         begin
            TDBGrid(Components[i]).Cursor       := -21;
            TDBGrid(Components[i]).DrawingStyle := gdsGradient;
            TDBGrid(Components[i]).Options      := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgRowSelect,dgTitleClick,dgTitleHotTrack];
            TDBGrid(Components[i]).BorderStyle  := bsNone;
         end;

         if Components[i] is TDateTimePicker then
            TDateTimePicker(Components[i]).Cursor := -21;

         //Seta a data atual para o componente DateTimePicker
         if Components[i] is TDateTimePicker then
            TDateTimePicker(Components[i]).Date := Now;

         //Seleciona o tabsheet 0 do pagecontrol
         if Components[i] is TPageControl then
            TPageControl(Components[i]).ActivePageIndex := 0;
     end;
end;


{ TFormBaseCad }


procedure TFormBaseCad.Cancelar;
begin
  inherited;
  FOperacao := opNone;
end;

constructor TFormBaseCad.Create(Awoner: TComponent);
begin
  inherited;
   //
end;

procedure TFormBaseCad.DoClose(var Action: TCloseAction);
begin
     //Verifica se existe um operação em andamento
     if FOperacao <> opNone then
     begin
       if Application.MessageBox('Deseja gravar alterações antes de sair?', 'Confirmação', MB_YESNO)= mrYes then
       begin
          Gravar(FOperacao);
       end;
     end;
end;

procedure TFormBaseCad.Editar;
begin
     //Verifica se existe um operação em andamento
     if FOperacao <> opNone then
     begin
         ShowMessage('Existe uma operação em andamento!');
         Abort;
     end;
end;

procedure TFormBaseCad.Excluir;
begin
     
end;

procedure TFormBaseCad.Gravar(Operacao: TOperacao);
begin
    //
end;

procedure TFormBaseCad.Incluir;
begin
     //Verifica se existe um operação em andamento
     if FOperacao <> opNone then
     begin
         ShowMessage('Existe uma operação em andamento!');
         Abort;
     end;
end;

procedure TFormBaseCad.IniciarComponentes;
begin
  self.BorderStyle := bsSingle;
  self.BorderIcons := [biSystemMenu];
  inherited;
end;

procedure TFormBaseCad.KeyDown(var Key: Word; Shift: TShiftState);
begin
    inherited;
    case KEY of
       VK_F1    : Incluir();
       VK_F2    : Editar();
       VK_F3    : Gravar(FOperacao);
       VK_F4    : Cancelar();
       VK_DELETE: Excluir();
    end;
end;

procedure TFormBaseCad.SetOperacao(Operacao: TOperacao);
begin
    FOperacao := Operacao;
end;

end.
