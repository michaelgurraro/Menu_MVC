unit Menus.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Menus.Controller.ListBox.Factory;

{$R *.fmx}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   {$IFDEF  FIREDAC}
       Label1.Text := 'Firedac';
   {$ENDIF}

   {$IFDEF DBEXPRESS}
       Label1.Text := 'DBEXPRESS';
   {$ENDIF}

   TControllerListBoxFactory.New.Principal(Layout1).Exibir;
end;

end.

