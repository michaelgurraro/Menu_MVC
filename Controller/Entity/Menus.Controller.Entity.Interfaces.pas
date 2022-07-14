unit Menus.Controller.Entity.Interfaces;

interface

uses
  Data.DB;

type
  IControllerEntity = interface
    ['{7CED8E5C-2CD2-44DB-87D3-3515BC31C007}']
    function Listar(aDataSource: TDataSource): IControllerEntity;
  end;

  IControllerEntityFactory = interface
    ['{D00EF109-13F3-4EEE-A7A9-9D871369664E}']
    function Produto : IControllerEntity;
  end;

implementation

end.

