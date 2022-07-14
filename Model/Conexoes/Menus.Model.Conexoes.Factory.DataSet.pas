unit Menus.Model.Conexoes.Factory.DataSet;

interface

uses
   {$IFDEF  FIREDAC}
  Menus.Model.Conexoes.TableFiredac,
   {$ENDIF}
  {$IFDEF  DBEXPRESS}
  Menus.Model.Conexoes.DBExpress.DataSet,
  {$ENDIF}
  Menus.Model.Conexoes.Interfaces;

type
  TModelConexoesFactoryDataSet = class(TInterfacedObject, IModelFactoryDataSet)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelFactoryDataSet;
    function DataSetFiredac(Conexao: IModelConexao): IModelDataSet;
    function DataSetDBExpress(Conexao: IModelConexao): IModelDataSet;
  end;

implementation

{ TModelConexoesFactoryDataSet }

constructor TModelConexoesFactoryDataSet.Create;
begin

end;

function TModelConexoesFactoryDataSet.DataSetDBExpress(Conexao: IModelConexao): IModelDataSet;
begin
   {$IFDEF  DBEXPRESS}
  Result := TModeloConexoesDBExpressDataSet.New(Conexao);
   {$ENDIF}
end;

function TModelConexoesFactoryDataSet.DataSetFiredac(Conexao: IModelConexao): IModelDataSet;
begin
   {$IFDEF  FIREDAC}
  Result := TModeloConexoesTableFiredac.New(Conexao);
   {$ENDIF}
end;

destructor TModelConexoesFactoryDataSet.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryDataSet.New: IModelFactoryDataSet;
begin
  Result := Self.Create;
end;

end.

