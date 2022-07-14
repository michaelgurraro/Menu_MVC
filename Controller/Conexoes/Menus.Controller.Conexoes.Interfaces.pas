unit Menus.Controller.Conexoes.Interfaces;

interface

uses
  Menus.Model.Conexoes.Interfaces;

type
  IControllerConexoesFacotryConexao = interface
    ['{8570942A-3F5A-499D-8E29-332FD4318A78}']
    function Conexao: IModelConexao;
  end;

  IControllerFactroyDataSet = interface
    ['{D6195EDB-5D75-4323-B674-ABB55C6B1F11}']
    function DataSet(Conexao : IModelConexao) : IModelDataSet;
  end;

implementation

end.

