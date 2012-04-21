unit uFormBase;

interface

uses
   Forms, Windows, Classes, StdCtrls, ComCtrls, Variants, Messages, Dialogs, SysUtils, uFuncao, Buttons, Controls,
   DBGrids, Grids;

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
    TFormBaseCad = class(TFormBase)
    protected
        Param: string;
        procedure Incluir();virtual;
        procedure Editar();virtual;
        procedure Gravar(Parametro: String);virtual;
        procedure Excluir();virtual;
        procedure KeyDown(var Key: Word; Shift: TShiftState); override;
        procedure DoClose(var Action: TCloseAction);override;
    public
        constructor Create(Awoner: TComponent); override;
    end;

implementation

{ TFormBase }

constructor TFormBase.Create(Awoner: TComponent);
begin
     //Inicializa o objeto
     inherited Create(Awoner);
     KeyPreview := True;
     ShowHint   := true;
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
            TDBGrid(Components[i]).Cursor := -21;

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


constructor TFormBaseCad.Create(Awoner: TComponent);
begin
  inherited;

end;

procedure TFormBaseCad.DoClose(var Action: TCloseAction);
begin
     inherited;
     //Verifica se existe um operação em andamento
     if Param <> '' then
     begin
       if Application.MessageBox('Deseja gravar alterações antes de sair?', 'Confirmação', MB_YESNO)= mrYes then
       begin
          Gravar(param);
       end;
     end;
end;

procedure TFormBaseCad.Editar;
begin
     //Verifica se existe um operação em andamento
     if Param <> '' then
     begin
         ShowMessage('Existe uma operação em andamento!');
         Abort;
     end;
end;

procedure TFormBaseCad.Excluir;
begin
     
end;

procedure TFormBaseCad.Gravar(Parametro: String);
begin
    //
end;

procedure TFormBaseCad.Incluir;
begin
     //Verifica se existe um operação em andamento
     if Param <> '' then
     begin
         ShowMessage('Existe uma operação em andamento!');
         Abort;
     end;
end;

procedure TFormBaseCad.KeyDown(var Key: Word; Shift: TShiftState);
begin
    inherited;
    case KEY of
       VK_F1    : Incluir();
       VK_F2    : Editar();
       VK_F3    : Gravar(Param);
       VK_DELETE: Excluir();
    end;
end;

end.
