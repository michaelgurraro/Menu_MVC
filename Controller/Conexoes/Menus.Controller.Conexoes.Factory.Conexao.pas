unit Menus.Controller.Conexoes.Factory.Conexao;

interface

uses
  Menus.Controller.Conexoes.Interfaces, Menus.Model.Conexoes.Interfaces, Menus.Model.Conexoes.Factory.Conexao;

type
  TControllerConexoesFacotryConexao = class(TInterfacedObject, IControllerConexoesFacotryConexao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerConexoesFacotryConexao;
    function Conexao: IModelConexao;
  end;

implementation


{ TControllerConexoesFacotryConexao }

function TControllerConexoesFacotryConexao.Conexao: IModelConexao;
begin
  {$IFDEF FIREDAC}
    Result := TModelConexoesFactoryConexao.New
                .ConxeaoFiredac
                .Parametros
                  .DataBase('E:\AGROTIS\DataBase\DATABASE.FDB')
                  .UserName('SYSDBA')
                  .Password('masterkey')
                  .DriverID('FB')
                  .Server('LocalHost')
                  .Porta(3050)
                  .CaminhoDll('C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll')
                .EndParametros
                .Conectar;
  {$ENDIF}


  {$IFDEF DBEXPRESS}
    Result := TModelConexoesFactoryConexao.New
                .ConxeaoDBExpress
                .Parametros
                  .DataBase('E:\AGROTIS\DataBase\DATABASE.FDB')
                  .UserName('SYSDBA')
                  .Password('masterkey')
                  .DriverID('Firebird')
                  .Server('LocalHost')
                  .Porta(3050)
                  .CaminhoDll('C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll')
                .EndParametros
                .Conectar;
  {$ENDIF}


end;

constructor TControllerConexoesFacotryConexao.Create;
begin

end;

destructor TControllerConexoesFacotryConexao.Destroy;
begin

  inherited;
end;

class function TControllerConexoesFacotryConexao.New: IControllerConexoesFacotryConexao;
begin
  Result := Self.Create;
end;

end.

