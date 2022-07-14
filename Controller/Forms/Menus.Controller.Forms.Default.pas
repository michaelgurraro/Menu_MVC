unit Menus.Controller.Forms.Default;

interface

uses
  FMX.Types, System.Classes, FMX.Forms, System.SysUtils;

type
  TControllerFormsDefault = class
    class procedure CreateForm(ClassName: string);
  end;

implementation

{ ControllerFormsDefault }

class procedure TControllerFormsDefault.CreateForm(ClassName: string);
var
  ObjFMX: TFmxObjectClass;
  newForm : TCustomForm;
begin
  ObjFMX := TFmxObjectClass(GetClass(ClassName));

  try
    newForm := (ObjFMX.Create(nil) as TCustomForm);

    try
      newForm.Position := TFormPosition.ScreenCenter;
      newForm.ShowModal;
    finally
      FreeAndNil(newForm);
    end;
  except
    raise Exception.Create('Objeto não existe');
  end;


end;

end.

