unit uACL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ImgList;

type
  TfrmControleAcesso = class(TForm)
    pnl1: TPanel;
    pnl3: TPanel;
    btn1: TBitBtn;
    gr1: TDBGrid;
    img: TImageList;
    procedure gr1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gr1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleAcesso: TfrmControleAcesso;

implementation

uses uDm;

{$R *.dfm}

procedure TfrmControleAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm.cdsACL.Close;
end;

procedure TfrmControleAcesso.FormCreate(Sender: TObject);
begin
    dm.cdsACL.Open;
end;

procedure TfrmControleAcesso.gr1CellClick(Column: TColumn);
begin
    dm.cdsACL.Edit;

    if Column.FieldName = 'FUNCIONARIO' then
    begin
        if dm.cdsACL.FieldByName('FUNCIONARIO').AsInteger = 1 then
           dm.cdsACL.FieldByName('FUNCIONARIO').AsInteger := 0
        else
           dm.cdsACL.FieldByName('FUNCIONARIO').AsInteger := 1;
    end;

    dm.cdsACL.Post;
    dm.cdsACL.ApplyUpdates(0);
end;

procedure TfrmControleAcesso.gr1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check, iTopo, iLeft: Integer;
  R: TRect;
begin
    iTopo := 1;
    iLeft := 70;

    //Desenha um checkbox no dbgrid
    if Column.FieldName = 'FUNCIONARIO' then
    begin
        gr1.Canvas.FillRect(Rect);
        img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.Top+iTopo, 1);

        if dm.cdsACL.FieldByName('FUNCIONARIO').AsInteger = 1 then
           img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 2)
        else
           img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 0);
    end
    else
    begin
        if Column.FieldName = 'ADMINISTRADOR' then
        begin

            gr1.Canvas.FillRect(Rect);
            img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.Top+iTopo, 1);

            if dm.cdsACL.FieldByName('ADMINISTRADOR').AsInteger = 1 then
               img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 2)
            else
               img.Draw(gr1.Canvas, Rect.Left+iLeft, Rect.top+iTopo, 0);
        end;
    end;
end;

end.
