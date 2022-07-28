unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, Conexao.MySQL, Interfacese,
  Conexao.SQLServer, Classe.Pessoa, Classe.Fornecedor, Classe.Cliente,
  FMX.ListBox, Classe.Animal, Form.Padrao, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Form.Heranca1, Form.Heranca2;

type
  TForm3 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button3: TButton;
    ComboBox2: TComboBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExibeMensagemMemo(value :String);
    procedure ExibeMensagemLabel(Value : String);

  public
    { Public declarations }

  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
  var
    Cliente: TCliente;
  begin
    Cliente := TCliente.Create(TConexaoSQLServer.Create); // Conexão do banco
    try
      Cliente.EventMemo := ExibeMensagemLabel;

      Cliente.Nome := 'Paulo';
      Cliente.Telefone := '98165458';
      Cliente.Endereco := 'Rua São Miguel';
      Cliente.Cidade := 'Garanhuns';
      Cliente.UF := 'PE';
      Cliente.Saldo := 1000;
      Cliente.Cadastrar;
      Cliente.CriarFinanceiro;

    finally
      Cliente.Free;
    end;
  end;

end;

procedure TForm3.Button2Click(Sender: TObject);
var
  Fornecedor: TFornecedor;
begin
  Fornecedor := TFornecedor.Create(TConexaoSQLServer.Create);
  // Conexão do banco
  try

    Fornecedor.EventMemo := ExibeMensagemMemo;

    Fornecedor.Nome := 'Paulo';
    Fornecedor.Telefone := '98165458';
    Fornecedor.Endereco := 'Rua São Miguel';
    Fornecedor.Cidade := 'Garanhuns';
    Fornecedor.UF := 'PE';
    Fornecedor.RazaoSocial := 'Kingdom Soft';
    Fornecedor.Cadastrar;
    Fornecedor.CriarFinanceiro;
  finally
    Fornecedor.Free;
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  case ComboBox1.ItemIndex of
    0 : Pessoa := TCliente.Create(nil);
    1 : Pessoa := TFornecedor.Create(nil);
  end;
  try
    ShowMessage(Pessoa.Tipo);
  finally
    Pessoa.Free;

  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
Var
  Animal: TAnimal;
begin
  case ComboBox2.ItemIndex of
    0 : Animal := TCachorro.Create;
    1 : Animal := TGato.Create;
  end;
  try
    ShowMessage(Animal.Voz);
  finally
    Animal.free;
  end;

end;
procedure TForm3.Button5Click(Sender: TObject);
begin
  FormPadrao.ShowModal;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  FormPadrao1.ShowModal;
end;

procedure TForm3.ExibeMensagemLabel(Value: String);
begin
  label1.Text:= Value;
end;

procedure TForm3.ExibeMensagemMemo(value: String);
begin
  Memo1.Lines.Add(Value);
end;

end.
