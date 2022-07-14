unit Menus.View.Produtos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, FMX.Grid.Style,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FMX.ScrollBox, FMX.Grid, Menus.Controller.Entity.Interfaces, Menus.Controller.Entity.Factory,
  FMX.Edit;

type
  TfrmProdutos = class(TForm)
    ToolBar1: TToolBar;
    Produtos: TLabel;
    Layout1: TLayout;
    StringGrid1: TStringGrid;
    DataSource1: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Layout2: TLayout;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FEntity : IControllerEntity;
    procedure PreencherDados;
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

uses
  Menus.Controller.ListBox.Factory;

{$R *.fmx}

procedure TfrmProdutos.Button1Click(Sender: TObject);
begin
  DataSource1.DataSet.Append;
end;

procedure TfrmProdutos.Button2Click(Sender: TObject);
begin
  DataSource1.DataSet.Edit;
end;

procedure TfrmProdutos.Button3Click(Sender: TObject);
begin
  DataSource1.DataSet.Delete;
end;

procedure TfrmProdutos.Button4Click(Sender: TObject);
begin
  PreencherDados;
  DataSource1.DataSet.Post;
end;

procedure TfrmProdutos.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  Edit1.Text := DataSource1.DataSet.FieldByName('Codigo').AsString;
  Edit2.Text := DataSource1.DataSet.FieldByName('Descricao').AsString;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  TControllerListBoxFactory.New
                .Produto(Layout1)
                .Exibir;

  FEntity := TControllerEntityFactory.New.Produto.Listar(DataSource1);
end;

procedure TfrmProdutos.PreencherDados;
begin
  DataSource1.DataSet.FieldByName('Codigo').AsString := Edit1.Text;
  DataSource1.DataSet.FieldByName('Descricao').AsString := Edit2.Text;
end;

initialization
  RegisterFmxClasses([TfrmProdutos]);

end.
