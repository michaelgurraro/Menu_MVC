unit Menus.Controller.ListBox.Cliente;


interface

uses
  Menus.Controller.ListBox.Interfaces, System.Classes;

type
  TControllerListBoxCliente = class(TInterfacedObject, iControllerListBoxMenu)
  private
    FContainer: TComponent;
  public
    constructor Create(Container: TComponent);
    destructor Destroy; override;
    class function New(Container: TComponent): iControllerListBoxMenu;
    procedure Exibir;
  end;

implementation

uses
  Menus.Controller.ListBox.Factory, Menus.Controller.ListBox.Itens.Factory;

{ TControllerListBoxCliente }

constructor TControllerListBoxCliente.Create(Container: TComponent);
begin
  FContainer := Container;
end;

destructor TControllerListBoxCliente.Destroy;
begin

  inherited;
end;

procedure TControllerListBoxCliente.Exibir;
begin
  TControllerListBoxFactory.New
    .Default(FContainer)
    .AddItem(TControllerListBoxItensFactory.New.Produto.Show)
    .Exibir;
end;

class function TControllerListBoxCliente.New(Container: TComponent): iControllerListBoxMenu;
begin
  Result := Self.Create(Container);
end;

end.

