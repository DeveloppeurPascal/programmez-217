unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.Bind.GenData, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Vcl.Grids, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    PrototypeBindSource1: TPrototypeBindSource;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  showmessage(Edit1.Text);
end;

end.
