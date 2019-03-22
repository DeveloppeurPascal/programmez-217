unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts, FMX.Ani;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Layout1: TLayout;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure cestbon;
    procedure cestpasbon;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  password: string;
begin
  password := Edit1.Text;
  if (password.ToLower = 'pass') then
    cestbon
  else
    cestpasbon;
end;

procedure TForm1.cestbon;
begin
  Layout1.Align := TAlignLayout.None;
  FloatAnimation2.Enabled := true;
end;

procedure TForm1.cestpasbon;
begin
  FloatAnimation1.Enabled := true;
end;

procedure TForm1.FloatAnimation1Finish(Sender: TObject);
begin
  Edit1.SetFocus;
  FloatAnimation1.Enabled := false;
end;

procedure TForm1.FloatAnimation2Finish(Sender: TObject);
begin
  FloatAnimation2.Enabled := false;
  freeandnil(Layout1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
