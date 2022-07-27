unit Classe.Fornecedor;

interface

uses Classe.Pessoa;

type
  TFornecedor = class(TPessoa)
  RazaoSocial : String;
  Function Tipo : String; Override;

  end;

implementation

{ TFornecedor }

function TFornecedor.Tipo: String;
begin
Result := 'Fornecedor';
end;

end.
