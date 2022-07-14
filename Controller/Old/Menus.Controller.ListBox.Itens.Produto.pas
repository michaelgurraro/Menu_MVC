unit Menus.Controller.ListBox.Itens.Produto;

interface

uses
  Menus.Controller.ListBox.Interfaces, FMX.Types;

type
  TControllerListBoxItensProduto = class(TInterfacedObject, iControllerListBoxItemForm)
  constructor Create;
  destructor Destroy; override;
  class function New : iControllerListBoxItemForm;
  function Show : TFmxObject;
  procedure onClick(Sender : TObject);
  end;

implementation

uses Menus.Controller.ListBox.Itens.Factory, Menus.Controller.Forms.Default;

{ TControllerListBoxItensProduto }

constructor TControllerListBoxItensProduto.Create;
begin

end;

destructor TControllerListBoxItensProduto.Destroy;
begin

  inherited;
end;

class function TControllerListBoxItensProduto.New: iControllerListBoxItemForm;
begin
  Result := Self.Create;
end;

procedure TControllerListBoxItensProduto.onClick(Sender: TObject);
begin
  TControllerFormsDefault.CreateForm('TfrmProdutos');
end;

function TControllerListBoxItensProduto.Show: TFmxObject;
begin
  Result := TControllerListBoxItensFactory.New
            .Default
            .Name('btnProduto')
            .Text('Produtos')
            .onClick(onClick)
            .Item;
end;

end.

