unit Form.Padrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Controls3D,
  FMX.Layers3D, FMX.Layouts;

type
  TFormPadrao = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3D1: TLayout3D;
    Layout3: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Button5: TButton;
    StyleBook1: TStyleBook;
    Label2: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FClicks: Integer;
    procedure SetClicks(const Value: Integer);
    function GetClicks: Integer;
    { Private declarations }
  public
    { Public declarations }
    property Clicks : Integer read GetClicks write SetClicks;
  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.fmx}

procedure TFormPadrao.Button4Click(Sender: TObject);
begin
  ShowMessage('inserindo com Sucesso')
end;

procedure TFormPadrao.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  SetClicks(1);
end;

function TFormPadrao.GetClicks: Integer;
begin
Result := FClicks;
end;

procedure TFormPadrao.SetClicks(const Value: Integer);
begin
  FClicks := FClicks + Value;
  Label2.Text := IntToStr(FCLicks) + 'Cliques';
end;

end.
