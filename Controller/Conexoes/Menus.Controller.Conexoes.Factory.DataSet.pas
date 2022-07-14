unit Menus.Controller.Conexoes.Factory.DataSet;

interface

uses
  Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces,
  Menus.Model.Conexoes.Factory.DataSet;

type
  TControllerConexoesFacotryDataset = class(TInterfacedObject, IControllerFactroyDataSet)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerFactroyDataSet;
    function DataSet(Conexao: IModelConexao): IModelDataSet;
  end;

implementation

{ TControllerConexoesFacotryDataset }

constructor TControllerConexoesFacotryDataset.Create;
begin

end;

function TControllerConexoesFacotryDataset.DataSet(Conexao: IModelConexao): IModelDataSet;
begin
  {$IFDEF FIREDAC}
  Result := TModelConexoesFactoryDataSet.New.DataSetFiredac(Conexao);
  {$ENDIF}

  {$IFDEF DBEXPRESS}
  Result := TModelConexoesFactoryDataSet.New.DataSetDBExpress(Conexao);
  {$ENDIF}
end;

destructor TControllerConexoesFacotryDataset.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFacotryDataset.New: IControllerFactroyDataSet;
begin
  Result := Self.Create;
end;

end.

