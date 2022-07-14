unit Menus.Model.Conexoes.Interfaces;

interface

uses
  System.Classes;

type
  IModelConexaoParametros = interface;

  IModelConexao = interface
    ['{0A7903B2-A164-4AFC-94D9-15108A9A3EC8}']
    function Conectar : IModelConexao;
    function EndConexao: TComponent;
    function Parametros: IModelConexaoParametros;
  end;

  IModelConexaoParametros = interface
    ['{B286507F-9CB5-4615-B90A-27D8CB5C5B40}']
    function DataBase(Value: string): IModelConexaoParametros;
    function UserName(Value: string): IModelConexaoParametros;
    function Password(Value: string): IModelConexaoParametros;
    function DriverID(Value: string): IModelConexaoParametros;
    function Server(Value: string): IModelConexaoParametros;
    function Porta(Value: integer): IModelConexaoParametros;
    function CaminhoDll(Value : string) : IModelConexaoParametros;
    function EndParametros : IModelConexao;
  end;

  IModelDataSet = interface
    ['{5BBC942E-4059-4467-85A5-15D28D9FC2D9}']
    function Open(aTabel : string) : IModelDataSet;
    function EndDataSet : TComponent;
  end;

  IModelFactoryConexao = interface
    ['{24AA93A8-CE82-4ABD-A53A-3F0F9A44D23F}']
    function ConxeaoFiredac : IModelConexao;
    function ConxeaoDBExpress : IModelConexao;
  end;

  IModelFactoryDataSet = interface
    ['{9DC87103-8B47-4CCE-BF08-BD3E69AB905D}']
    function DataSetFiredac(Conexao : IModelConexao) : IModelDataSet;
    function DataSetDBExpress(Conexao : IModelConexao) : IModelDataSet;
  end;

implementation

end.

