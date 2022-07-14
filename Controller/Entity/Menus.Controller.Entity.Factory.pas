unit Menus.Controller.Entity.Factory;

interface

uses
  Menus.Controller.Entity.Interfaces, Menus.Controller.Entity.Produtos;

type
  TControllerEntityFactory = class(TInterfacedObject, IControllerEntityFactory)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerEntityFactory;
    function Produto : IControllerEntity;
  end;

implementation

{ TControllerEntityFactory }

constructor TControllerEntityFactory.Create;
begin

end;

destructor TControllerEntityFactory.Destroy;
begin

  inherited;
end;

class function TControllerEntityFactory.New: IControllerEntityFactory;
begin
  Result := Self.Create;
end;

function TControllerEntityFactory.Produto: IControllerEntity;
begin
  Result := TControllerEntityProdutos.New;
end;

end.

