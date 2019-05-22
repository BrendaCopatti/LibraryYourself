unit uUsuarioModel;

interface

uses uGenericEntity;

type
  [TableName('usuario')]
  TUsuarioModel = class(TGenericEntity)
  private
    FCodigo:        Integer;
    FNome:          String;
    FSenha:         String;
    FAdministrador: Boolean;
    FCPF:           String;
    FRG:            String;
    FCelular:       String;
    FTelefone:      String;
    procedure SetAdministrador(const Value: Boolean);
    procedure SetCelular(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetCPF(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetRG(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    [KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo:        Integer read FCodigo        write SetCodigo;
    [FieldName('nome')]
    property Nome:          String  read FNome          write SetNome;
    [FieldName('senha')]
    property Senha:         String  read FSenha         write SetSenha;
    [FieldName('administrador')]
    property Administrador: Boolean read FAdministrador write SetAdministrador;
    [FieldName('cpf')]
    property CPF:           String  read FCPF           write SetCPF;
    [FieldName('rg')]
    property RG:            String  read FRG            write SetRG;
    [FieldName('celular')]
    property Celular:       String  read FCelular       write SetCelular;
    [FieldName('telefone')]
    property Telefone:      String  read FTelefone      write SetTelefone;

    function ToString(): String; override;
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

procedure TUsuarioModel.SetRG(const Value: String);
begin
  FRG := Value;
end;

procedure TUsuarioModel.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TUsuarioModel.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

function TUsuarioModel.ToString: String;
begin
  Result := Self.FCodigo.ToString + ' - ' +
            Self.FNome;
end;

end.
