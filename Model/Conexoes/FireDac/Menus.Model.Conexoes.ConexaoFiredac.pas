unit Menus.Model.Conexoes.ConexaoFiredac;

interface

uses
  Menus.Model.Conexoes.Interfaces, System.Classes, System.SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.DApt;

type
  TModelConexaoFiredac = class(TInterfacedObject, IModelConexao, IModelConexaoParametros)
  private
    FConexao: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDataBase: string;
    FUserName: string;
    FPassword: string;
    FDriverID: string;
    FServer: string;
    FPorta: Integer;
    FCaminhoDll : string;
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
    function CaminhoDll(Value : string) : IModelConexaoParametros;
    function EndParametros: IModelConexao;
    function Conectar: IModelConexao;
  end;

implementation

{ TModelConexaoFiredac }

function TModelConexaoFiredac.CaminhoDll(
  Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FCaminhoDll := Value;
end;

function TModelConexaoFiredac.Conectar: IModelConexao;
begin
  Result := Self;
  LerParametros;
  FConexao.Connected := True;
end;

constructor TModelConexaoFiredac.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
  FDPhysFBDriverLink := TFDPhysFBDriverLink.Create(nil);
end;

function TModelConexaoFiredac.DataBase(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FDataBase := Value;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FConexao.DisposeOf;
  FDGUIxWaitCursor.DisposeOf;
  FDPhysFBDriverLink.DisposeOf;
  inherited;
end;

function TModelConexaoFiredac.DriverID(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FDriverID := Value;
end;

function TModelConexaoFiredac.EndConexao: TComponent;
begin
  Result := FConexao;
end;

function TModelConexaoFiredac.EndParametros: IModelConexao;
begin
  Result := Self;
end;

procedure TModelConexaoFiredac.LerParametros;
begin
  FConexao.Params.Database := FDataBase;
  FConexao.Params.UserName := FUserName;
  FConexao.Params.Password := FPassword;
  FConexao.Params.DriverID := FDriverID;
  FConexao.Params.Add('Server=' + FServer);
  FConexao.Params.Add('Port=' + FPorta.ToString);
  FDPhysFBDriverLink.VendorLib := FCaminhoDll;
end;

class function TModelConexaoFiredac.New: IModelConexao;
begin
  Result := Self.Create;
end;

function TModelConexaoFiredac.Parametros: IModelConexaoParametros;
begin
  Result := Self;
end;

function TModelConexaoFiredac.Password(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FPassword := Value;
end;

function TModelConexaoFiredac.Porta(Value: integer): IModelConexaoParametros;
begin
  Result := Self;
  FPorta := Value;
end;

function TModelConexaoFiredac.Server(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FServer := Value;
end;

function TModelConexaoFiredac.UserName(Value: string): IModelConexaoParametros;
begin
  Result := Self;
  FUserName := Value;
end;

end.

