unit uLivroModel;

interface

uses uGenericEntity, uEditoraModel, uAutorModel;

type
  TLivroModel = class(TGenericEntity)
  private
    FTitulo:  String;
    FCodigo:  Integer;
    FEditora: TEditoraModel;
    FAutor:   TAutorModel;
    procedure SetCodigo(const Value: Integer);
    procedure SetEditora(const Value: TEditoraModel);
    procedure SetTitulo(const Value: String);
    procedure SetAutor(const Value: TAutorModel);
  public
    property Codigo:  Integer       read FCodigo    write SetCodigo;
	  property Titulo:  String        read FTitulo    write SetTitulo;
    property Editora: TEditoraModel read FEditora   write SetEditora;
    property Autor:   TAutorModel   read FAutor     write SetAutor;
  end;

implementation

uses SysUtils;

{ TLivro }

procedure TLivroModel.SetAutor(const Value: TAutorModel);
begin
  FAutor := Value;
end;

procedure TLivroModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TLivroModel.SetEditora(const Value: TEditoraModel);
begin
  FEditora := Value;
end;

procedure TLivroModel.SetTitulo(const Value: String);
begin
  FTitulo := Value;
end;

end.
