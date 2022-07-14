unit Menus.Model.Entity.Factrory;

interface

uses
  Menus.Model.Entity.interfaces, Menus.Model.Conexoes.Interfaces;

type
  TModelEntityFactory = class(TInterfacedObject,IModelEntityFactory)
    private
    public
    constructor Create;
    destructor Destroy; override;
    class function New : IModelEntityFactory;
    function Produtos(DataSet : IModelDataSet) : IModelEntity;
  end;

implementation

uses
  Menus.Model.Entity.Produtos;

{ TModelEntityFactory }

constructor TModelEntityFactory.Create;
begin

end;

destructor TModelEntityFactory.Destroy;
begin

  inherited;
end;

class function TModelEntityFactory.New: IModelEntityFactory;
begin
  Result := Self.Create;
end;


function TModelEntityFactory.Produtos(DataSet : IModelDataSet) : IModelEntity;
begin
  Result := TModelEntityProdutos.New(DataSet);
end;

end.
