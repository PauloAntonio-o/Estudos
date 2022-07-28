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

  TEventMemo = procedure (Value : String) of object;

  TPessoa = class
  private
    FDataNascimento: TDateTime;
    FNome: String;
    FTelefone: String;
    Conexao: IConexao;
    FUF: String;
    FCidade: String;
    FEndereco: String;
    FEventMemo: TEventMemo;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetEventMemo(const Value: TEventMemo);
  public
    constructor Create(aConexao: IConexao); virtual; // Conex�o do banco Create
    procedure Cadastrar;
    procedure CriarFinanceiro;
    function Idade: Integer;
    Function Tipo: String; virtual; abstract;
    property Nome: String read FNome write SetNome;
    property Telefone : String read FTelefone write SetTelefone;
    property Endereco : String read FEndereco write SetEndereco;
    property Cidade : String read FCidade write SetCidade;
    property UF : String read FUF write SetUF;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
    property EventMemo : TEventMemo read FEventMemo write SetEventMemo;
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
    EventMemo(Nome + ' Cadastrado Com Sucesso');

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
    Lista.Add('Saldo 1000');
    Lista.SaveToFile(Nome + '_Financeiro.txt');
    EventMemo(Nome + ' Cadastrado Com Sucesso');

  finally
    Lista.free;
  end;

end;

function TPessoa.Idade: Integer;
begin
  Result := Trunc((Now - FDataNascimento) / 365.25);

end;

procedure TPessoa.SetCidade(const Value: String);
begin
  FCidade := Value;
end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);

begin
  FDataNascimento := Value;

end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetEventMemo(const Value: TEventMemo);
begin
  FEventMemo := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Nome n�o pode ser Nulo!');
  FNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TPessoa.SetUF(const Value: String);
begin
  FUF := Value;
end;

{ TClasseAmiga }

{ TClasseAmiga }

procedure TClasseAmiga.TesteDeSoftware;
begin

end;

{ TMuComp }

end.
