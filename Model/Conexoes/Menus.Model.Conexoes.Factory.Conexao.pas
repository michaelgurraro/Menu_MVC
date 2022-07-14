unit Menus.Model.Conexoes.Factory.Conexao;

interface

uses
   {$IFDEF  FIREDAC}
  Menus.Model.Conexoes.ConexaoFiredac,
   {$ENDIF}
  {$IFDEF  DBEXPRESS}
  Menus.Model.Conexoes.DBExpress.Conexao,
  {$ENDIF}
  Menus.Model.Conexoes.Interfaces;

type
  TModelConexoesFactoryConexao = class(TInterfacedObject, IModelFactoryConexao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelFactoryConexao;
    function ConxeaoFiredac: IModelConexao;
    function ConxeaoDBExpress: IModelConexao;
  end;

implementation

{ TModelConexoesFactoryConexao }

function TModelConexoesFactoryConexao.ConxeaoDBExpress: IModelConexao;
begin
  {$IFDEF  DBEXPRESS}
  Result := TModelConexaoDBExpress.New;
  {$ENDIF}

end;

function TModelConexoesFactoryConexao.ConxeaoFiredac: IModelConexao;
begin
  {$IFDEF  FIREDAC}
  Result := TModelConexaoFiredac.New;
  {$ENDIF}

end;

constructor TModelConexoesFactoryConexao.Create;
begin

end;

destructor TModelConexoesFactoryConexao.Destroy;
begin

  inherited;
end;

class function TModelConexoesFactoryConexao.New: IModelFactoryConexao;
begin
  Result := Self.Create;
end;

end.

