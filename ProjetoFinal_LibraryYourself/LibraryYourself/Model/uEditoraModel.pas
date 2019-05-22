unit uEditoraModel;

interface

uses uGenericEntity;

type
  [TableName('editora')]
  TEditoraModel = class(TGenericEntity)
  private
    FCodigo: Integer;
    FNome:   String;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
  public
    [KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('nome')]
	  property Nome:   String  read FNome   write SetNome;

    function ToString(): String; override;
  end;

implementation

uses SysUtils;

{ TEditoraModel }

procedure TEditoraModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEditoraModel.SetNome(const Value: String);
begin
  FNome := Value;
end;

function TEditoraModel.ToString: String;
begin
  Result :=
    Self.FCodigo.ToString + ' - ' +
    Self.FNome;
end;

end.
