unit Menus.Controller.ListBox.Interfaces;

interface

uses
  System.Classes, FMX.Types;

type
  iControllerListBoxItensDefault = interface;
  iControllerListBoxDefault = interface;

  iControllerListBoxItemForm = interface
    ['{87EDF674-917E-4A5A-BB56-B4A705B6EDC4}']
    function Show : TFmxObject;
  end;

  iControllerListBoxMenu = interface
    ['{EDD2E31F-9954-4B90-9792-0FF93E6FC32C}']
    procedure Exibir;
  end;

  iControllerListBoxItensFactory = interface
    ['{A76B58D0-3B73-4CD5-8144-4B23DD3F12DF}']
    function Default: iControllerListBoxItensDefault;
    function Produto: iControllerListBoxItemForm;
    function Cliente: iControllerListBoxItemForm;
  end;

  iControllerListBoxFactory = interface
    ['{F2B0D273-69A9-4FFB-ACE8-6BE50F9099EE}']
    function Default(Conteiner : TComponent) : iControllerListBoxDefault;
    function Principal(Conteiner : TComponent) : iControllerListBoxMenu;
    function Produto(Conteiner : TComponent) : iControllerListBoxMenu;
    function Cliente(Conteiner : TComponent) : iControllerListBoxMenu;
  end;

  iControllerListBoxItensDefault = interface
    ['{A5A27158-FB96-444F-9D0D-4CA1A5FB6BB1}']
    function Name(Value: string): iControllerListBoxItensDefault;
    function Text(Value: string): iControllerListBoxItensDefault;
    function StyleLookup(Value: string): iControllerListBoxItensDefault;
    function onClick(Value: TNotifyEvent): iControllerListBoxItensDefault;
    function Item: TFMXObject;
  end;

  iControllerListBoxDefault = interface
    ['{047D63E5-21C5-431F-A1FC-902AFDCD4494}']
    function Name(Value: string): iControllerListBoxDefault;
    function Align(Value: TAlignLayout): iControllerListBoxDefault;
    function ItemHeight(Value: Integer): iControllerListBoxDefault;
    function AddItem(Value: TFMXObject): iControllerListBoxDefault;
    function Lista: TFMXObject;
    procedure Exibir;
  end;



implementation

end.

