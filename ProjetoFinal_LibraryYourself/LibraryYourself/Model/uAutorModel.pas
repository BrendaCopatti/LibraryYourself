unit uAutorModel;

interface

type
  TAutorModel = class
  private
    FCodigo: Integer;
    FNome:   String;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
	  property Nome:   String  read FNome   write SetNome;

    constructor Create(ACodigo: Integer = 0; ANome: String = '');
  end;
implementation

uses SysUtils;

{ TAutorModel }

constructor TAutorModel.Create(ACodigo: Integer; ANome: String);
begin
  FCodigo := ACodigo;
  FNome := ANome;
end;

procedure TAutorModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAutorModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
