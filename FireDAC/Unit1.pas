unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.StdCtrls, FMX.ScrollBox, FMX.Grid, FMX.Controls.Presentation, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDQuery1: TFDQuery;
    Button1: TButton;
    Grid1: TGrid;
    Label1: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    procedure CalculerTotal;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.ioutils;

procedure TForm1.Button1Click(Sender: TObject);
var
  tab: TFDTable;
  i: integer;
begin
  tab := TFDTable.Create(Self);
  try
    tab.Connection := FDConnection1;
    tab.TableName := 'MaTable';
    tab.Open;
    for i := 1 to 10 do
    begin
      tab.Insert;
      tab.FieldByName('Valeur').AsInteger := random(500);
      tab.Post;
    end;
    tab.Close;
  finally
    freeandnil(tab);
  end;
  FDQuery1.Refresh;
  CalculerTotal;
end;

procedure TForm1.CalculerTotal;
var
  total: integer;
begin
  try
    total := FDConnection1.ExecSQLScalar('select sum(Valeur) from MaTable');
  except
    total := 0;
  end;
  Label2.Text := total.ToString;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  dbname: string;
  creerdb: boolean;
begin
{$IFDEF DEBUG}
  dbname := tpath.GetDocumentsPath + pathdelim + 'programmez-firedac-demo-DEBUG.db';
{$ELSE}
  dbname := tpath.GetDocumentsPath + pathdelim + 'programmez-firedac-demo.db';
{$ENDIF}
  creerdb := not tfile.Exists(dbname);
  FDConnection1.Params.Clear;
  FDConnection1.Params.Values['DriverID'] := 'SQLite';
  FDConnection1.Params.Values['Database'] := dbname;
  FDConnection1.Params.Values['OpenMode'] := 'CreateUTF16';
  FDConnection1.Params.Values['StringFormat'] := 'Unicode';
{$IFDEF DEBUG}
  FDConnection1.Params.Values['Password'] := '';
  FDConnection1.Params.Values['Encrypt'] := '';
  FDConnection1.Params.Values['LokingMode'] := 'Normal';
{$ELSE}
  FDConnection1.Params.Values['Password'] := 'motdepassepourlaprod';
  FDConnection1.Params.Values['Encrypt'] := 'aes-256';
  FDConnection1.Params.Values['LokingMode'] := 'Exclusive';
{$ENDIF}
  FDConnection1.LoginPrompt := false;
  FDConnection1.Connected := true;
  if creerdb then
  begin
    FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS MaTable (ID INTEGER PRIMARY KEY, Valeur INTEGER DEFAULT 0)');
  end;
  CalculerTotal;
  FDQuery1.Open('select * from MaTable');
end;

end.
