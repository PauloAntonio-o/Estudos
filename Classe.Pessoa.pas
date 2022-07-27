unit Classe.Pessoa;

interface

uses System.Classes, Interfacese;

type
  TClasseAmiga = Class
  private
    Teste: String;
  public
    procedure TesteDeSoftware; //
  End;

type
  TPessoa = class
  private
    FDataNascimento: TDateTime;
    FNome: String;
    FTelefone: String;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: String);
  public
    Telefone: String;
    Endereco: String;
    Cidade: String;
    UF: String;
    Conexao: IConexao;
    constructor Create(aConexao: IConexao); virtual; // Conex�o do banco Create
    procedure Cadastrar;
    procedure CriarFinanceiro;
    function Idade: Integer;
    Function Tipo: String; virtual; abstract;
    property Nome: String read FNome write SetNome;
    property DataNascimento: TDateTime read FDataNascimento
      write SetDataNascimento;
  end;

  TMuComp = class(TComponent)
    constructor Create(AOwner: TComponent); Override;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

procedure TPessoa.Cadastrar;
Var
  Lista: TStringList;
begin

  Lista := TStringList.Create;
  try
    Lista.Add('Nome: ' + Nome);
    Lista.Add('Telefone: ' + Telefone);
    Lista.Add('Endere�o: ' + Endereco);
    Lista.Add('Cidade: ' + Cidade);
    Lista.Add('UF: ' + UF);
    Lista.SaveToFile(Nome + '_Cliente.txt');

    Conexao.Gravar;

  finally
    Lista.free;
  end;
end;

constructor TPessoa.Create(aConexao: IConexao); // Conex�o do banco interface.
begin
  Conexao := aConexao;
  UF := 'PE';
end;

procedure TPessoa.CriarFinanceiro;
Var
  Lista: TStringList;
begin

  Lista := TStringList.Create;
  try
    Lista.Add('Nome:' + Nome);
    Lista.SaveToFile(Nome + '_Financeiro.txt');

  finally
    Lista.free;
  end;

end;

function TPessoa.Idade: Integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);

end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);

begin
  FDataNascimento := Value;

end;

procedure TPessoa.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Nome n�o pode ser Nulo!');
  FNome := Value;
end;

{ TClasseAmiga }

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
begin

end;

{ TMuComp }

constructor TMuComp.Create(AOwner: TComponent);
begin
  inherited;

end;

end.
