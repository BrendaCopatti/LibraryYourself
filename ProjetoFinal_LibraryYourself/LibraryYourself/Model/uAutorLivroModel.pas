unit uAutorLivroModel;

interface

uses uGenericEntity, uCustomAttributesEntity, uAutorModel, uLivroModel;

type
  [TableName('autor_livro')]
  TAutorLivroModel = class(TGenericEntity)
  private
    FAutor: TAutorModel;
    FCodigo: Integer;
    FLivro: TLivroModel;
    procedure SetAutor(const Value: TAutorModel);
    procedure SetCodigo(const Value: Integer);
    procedure SetLivro(const Value: TLivroModel);
  public
    [KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo: Integer     read FCodigo write SetCodigo;
    [FieldName('autor_codigo')]
    [ForeignKey('autor_codigo', 'codigo', 'autor')]
    property Autor:  TAutorModel read FAutor  write SetAutor;
    [FieldName('livro_codigo')]
    [ForeignKey('livro_codigo', 'codigo', 'livro')]
    property Livro:  TLivroModel read FLivro  write SetLivro;

    function ToString(): String; override;
  end;

implementation

uses SysUtils;

{ TAutorLivroModel }

procedure TAutorLivroModel.SetAutor(const Value: TAutorModel);
begin
  FAutor := Value;
end;

procedure TAutorLivroModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAutorLivroModel.SetLivro(const Value: TLivroModel);
begin
  FLivro := Value;
end;

function TAutorLivroModel.ToString: String;
begin
  Result :=     Self.FCodigo.ToString + ' - ' +
    'Autor: ' + Self.FAutor.ToString  + ' ' +
    'Livro: ' + Self.FLivro.ToString;
end;

end.
