unit Menus.Model.Entity.Interfaces;

interface
uses
  System.Classes, Menus.Model.Conexoes.Interfaces;
type
  IModelEntity = interface
    ['{5D20C82A-E833-416C-9746-55457E8C39BC}']
    function Listar : TComponent;
  end;

  IModelEntityFactory = interface
    ['{F115F9A3-64D2-4AB1-887D-A3F8CA17B41C}']
    function Produtos(DataSet : IModelDataSet) : IModelEntity;
  end;
implementation

end.
