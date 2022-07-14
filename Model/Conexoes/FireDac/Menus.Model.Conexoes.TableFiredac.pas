unit Menus.Model.Conexoes.TableFiredac;

interface

uses
  Menus.Model.Conexoes.Interfaces, System.Classes, Firedac.Comp.Client;

type
  TModeloConexoesTableFiredac = class(TInterfacedObject, IModelDataSet)
  private
    FTable : TFDTable;
  public
    constructor Create(Conexao : IModelConexao);
    destructor Destroy; override;
    class function New(Conexao : IModelConexao): IModelDataSet;
    function Open(aTabel: string): IModelDataSet;
    function EndDataSet : TComponent;
  end;

implementation

{ TModeloConexoesTableFiredac }

constructor TModeloConexoesTableFiredac.Create(Conexao : IModelConexao);
begin
  FTable := TFDTable.Create(nil);
  FTable.Connection := (Conexao.EndConexao as TFDConnection);
end;

destructor TModeloConexoesTableFiredac.Destroy;
begin
  FTable.DisposeOf;
  inherited;
end;

function TModeloConexoesTableFiredac.EndDataSet: TComponent;
begin
  Result := FTable;
end;

class function TModeloConexoesTableFiredac.New(Conexao : IModelConexao): IModelDataSet;
begin
  Result := Self.Create(Conexao);
end;

function TModeloConexoesTableFiredac.Open(aTabel: string): IModelDataSet;
begin
  Result := Self;
  FTable.Open(aTabel);
end;

end.

