unit Menus.Model.Conexoes.DBExpress.Conexao;

interface

uses
  Menus.Model.Conexoes.Interfaces, System.Classes, System.SysUtils, Data.DB,
  Data.SqlExpr, Data.DBXFirebird;

type
  TModelConexaoDBExpress = class(TInterfacedObject, IModelConexao, IModelConexaoParametros)
  private
    FConexao: TSQLConnection;
    FDataBase: string;
    FUserName: string;
    FPassword: string;
    FDriverID: string;
    FServer: string;
    FPorta: Integer;
    FCaminhoDll: string;
    procedure LerParametros;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelConexao;
    function EndConexao: TComponent;
    function Parametros: IModelConexaoParametros;
    function DataBase(Value: string): IModelConexaoParametros;
    function UserName(Value: string): IModelConexaoParametros;
    function Password(Value: string): IModelConexaoParametros;
    function DriverID(Value: string): IModelConexaoParametros;
    function Server(Value: string): IModelConexaoParametros;
    function Porta(Value: integer): IModelConexaoParametros;
    function CaminhoDll(Value: string): IModelConexaoParametros;
    function EndParametros: IModelConexao;
    function Conectar: IModelConexao;
  end;

implementation

{ TModelConexaoDBExpress }

function TModelConexaoDBExpress.CaminhoDll(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FCaminhoDll := Value;
end;

function TModelConexaoDBExpress.Conectar: IModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := True;
end;

constructor TModelConexaoDBExpress.Create;
begin
  FConexao := TSQLConnection.Create(nil);
end;

function TModelConexaoDBExpress.DataBase(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FDataBase := Value;
end;

destructor TModelConexaoDBExpress.Destroy;
begin
  FConexao.DisposeOf;
  inherited;
end;

function TModelConexaoDBExpress.DriverID(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoDBExpress.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoDBExpress.EndParametros: IModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoDBExpress.LerParametros;
begin
  FConexao.DriverName :=  FDriverID;
  FConexao.Params.AddPair('VendorLib',FCaminhoDll);
  FConexao.Params.AddPair('VendorLibWin64',FCaminhoDll);
  FConexao.Params.AddPair('Database',FServer+':'+FDataBase);
  FConexao.Params.AddPair('User_Name',FPassword);
  FConexao.Params.AddPair('Password',FUserName);
end;

class function TModelConexaoDBExpress.New: IModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoDBExpress.Parametros: IModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoDBExpress.Password(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoDBExpress.Porta(Value: integer): IModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoDBExpress.Server(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoDBExpress.UserName(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

