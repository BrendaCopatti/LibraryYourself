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

    function ToString(): String; override;
  end;
implementation

uses SysUtils;

{ TAutorModel }

procedure TAutorModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAutorModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

function TAutorModel.ToString: String;
begin
  Result :=
    Self.FCodigo.ToString + ' - ' +
    Self.FNome;
end;

end.
