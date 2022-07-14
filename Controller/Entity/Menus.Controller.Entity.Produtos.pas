unit Menus.Controller.Entity.Produtos;

interface

uses
  Menus.Controller.Entity.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Controller.Conexoes.Factory.Conexao,
  Menus.Controller.Conexoes.Factory.DataSet, Menus.Model.Entity.interfaces,
  Menus.Model.Entity.Factrory, Data.DB;

type
  TControllerEntityProdutos = class(TInterfacedObject, IControllerEntity)
  private
    FConexao: IModelConexao;
    FDataSet: IModelDataSet;
    FEntity: IModelEntity;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerEntity;
    function Listar(aDataSource: TDataSource): IControllerEntity;
  end;

implementation


{ TControllerEntityProdutos }

constructor TControllerEntityProdutos.Create;
begin
  FConexao := TControllerConexoesFacotryConexao.New.Conexao;
  FDataSet := TControllerConexoesFacotryDataset.New.DataSet(FConexao);
  FEntity := TModelEntityFactory.New.Produtos(FDataSet);
end;

destructor TControllerEntityProdutos.Destroy;
begin

  inherited;
end;

function TControllerEntityProdutos.Listar(aDataSource: TDataSource): IControllerEntity;
begin
  Result := Self;
  aDataSource.DataSet := TDataSet(FEntity.Listar);
end;

class function TControllerEntityProdutos.New: IControllerEntity;
begin
  Result := Self.Create;
end;

end.

