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
    Z: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Button5: TButton;
    StyleBook1: TStyleBook;
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPadrao: TFormPadrao;

implementation

{$R *.fmx}

procedure TFormPadrao.Button4Click(Sender: TObject);
begin
  ShowMessage('inserindo com Sucesso')
end;

end.
