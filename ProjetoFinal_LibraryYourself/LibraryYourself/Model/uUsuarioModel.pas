unit uUsuarioModel;

interface

uses uGenericEntity, IdHashSHA;

type
  TUsuarioModel = class
  private
    FCodigo:        Integer;
    FNome:          String;
    FSenha:         String;
    FAdministrador: Boolean;
    FCPF:           String;
    FCelular: String;
    procedure SetAdministrador(const Value: Boolean);
    procedure SetCelular(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);
  public
    property Codigo:        Integer read FCodigo        write SetCodigo;
    property Nome:          String  read FNome          write SetNome;
    property Senha:         String  read FSenha         write SetSenha;
    property Administrador: Boolean read FAdministrador write SetAdministrador;
    property CPF:           String  read FCPF           write SetCPF;
    property Celular:       String  read FCelular       write SetCelular;

  end;

implementation

uses SysUtils;

{ TUsuarioModel }

procedure TUsuarioModel.SetAdministrador(const Value: Boolean);
begin
  FAdministrador := Value;
end;

procedure TUsuarioModel.SetCelular(const Value: String);
begin
  FCelular := Value;
end;

procedure TUsuarioModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsuarioModel.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TUsuarioModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuarioModel.SetSenha(const Value: String);
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    FSenha := SHA1.HashStringAsHex(Value);
  finally
    FreeAndNil(SHA1);
  end;
end;

end.
