unit Menus.Controller.ListBox.Factory;

interface

uses
  System.Classes, Menus.Controller.ListBox.Interfaces, Menus.Controller.ListBox.Default;

type
  TControllerListBoxFactory = class(TInterfacedObject, iControllerListBoxFactory)
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerListBoxFactory;
    function Default(Conteiner: TComponent): iControllerListBoxDefault;
    function Principal(Conteiner: TComponent): iControllerListBoxMenu;
    function Produto(Conteiner : TComponent) : iControllerListBoxMenu;
    function Cliente(Conteiner : TComponent) : iControllerListBoxMenu;
  end;

implementation

uses
  Menus.Controller.ListBox.Principal, Menus.Controller.ListBox.Produtos, Menus.Controller.ListBox.Cliente;

{ TControllerListBoxFactory }

function TControllerListBoxFactory.Cliente(
  Conteiner: TComponent): iControllerListBoxMenu;
begin
  Result := TControllerListBoxCliente.New(Conteiner);
end;

constructor TControllerListBoxFactory.Create;
begin

end;

function TControllerListBoxFactory.Default(Conteiner: TComponent): iControllerListBoxDefault;
begin
  Result := TControllerListBoxDefault.New(Conteiner);
end;

destructor TControllerListBoxFactory.Destroy;
begin

  inherited;
end;

class function TControllerListBoxFactory.New: iControllerListBoxFactory;
begin
  Result := Self.Create;
end;

function TControllerListBoxFactory.Principal(Conteiner: TComponent): iControllerListBoxMenu;
begin
 Result := TControllerListBoxPrincipal.New(Conteiner);
end;

function TControllerListBoxFactory.Produto(
  Conteiner: TComponent): iControllerListBoxMenu;
begin
  Result := TControllerListBoxProduto.New(Conteiner);
end;

end.

