unit Menus.Model.Conexoes.DBExpress.DataSet;

interface

uses
  Menus.Model.Conexoes.Interfaces, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TModeloConexoesDBExpressDataSet = class(TInterfacedObject, IModelDataSet)
  private
    FTable : TSQLTable;
  public
    constructor Create(Conexao : IModelConexao);
    destructor Destroy; override;
    class function New(Conexao : IModelConexao): IModelDataSet;
    function Open(aTabel: string): IModelDataSet;
    function EndDataSet : TComponent;
  end;

implementation

{ TModeloConexoesTableFiredac }

constructor TModeloConexoesDBExpressDataSet.Create(Conexao : IModelConexao);
begin
  FTable := TSQLTable.Create(nil);
  FTable.SQLConnection := (Conexao.EndConexao as TSQLConnection);
end;

destructor TModeloConexoesDBExpressDataSet.Destroy;
begin
  FTable.DisposeOf;
  inherited;
end;

function TModeloConexoesDBExpressDataSet.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModeloConexoesDBExpressDataSet.New(Conexao : IModelConexao): IModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModeloConexoesDBExpressDataSet.Open(aTabel: string): IModelDataSet;
begin
  Result := Self;
  FTable.TableName := aTabel;
  FTable.Open;
end;

end.
