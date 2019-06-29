unit uEditoraModel;

interface

uses uGenericEntity;

type
  TEditoraModel = class
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

{ TEditoraModel }

constructor TEditoraModel.Create(ACodigo: Integer; ANome: String);
begin
  FCodigo := ACodigo;
  FNome := ANome;
end;

procedure TEditoraModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEditoraModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
