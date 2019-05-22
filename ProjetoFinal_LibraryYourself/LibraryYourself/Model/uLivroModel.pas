unit uLivroModel;

interface

uses uGenericEntity, uEditoraModel;

type
  [TableName('emprestimo')]
  TLivroModel = class(TGenericEntity)
  private
    FTitulo:    String;
    FISBN:      String;
    FDescricao: String;
    FCodigo:    Integer;
    FAno:       SmallInt;
    FEditora:   TEditoraModel;
    procedure SetAno(const Value: SmallInt);
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetEditora(const Value: TEditoraModel);
    procedure SetISBN(const Value: String);
    procedure SetTitulo(const Value: String);
  public
    [KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo:         Integer       read FCodigo    write SetCodigo;
    [FieldName('titulo')]
	  property Titulo:         String        read FTitulo    write SetTitulo;
    [FieldName('isbn')]
    property ISBN:           String        read FISBN      write SetISBN;
    [FieldName('editora_codigo')]
    [ForeignKey('editora_codigo', 'codigo', 'editora')]
    property Editora:        TEditoraModel read FEditora   write SetEditora;
    [FieldName('descricao')]
    property Descricao:      String        read FDescricao write SetDescricao;
    [FieldName('ano')]
    property Ano:            SmallInt      read FAno       write SetAno;

    function ToString(): String; override;
  end;

implementation

uses SysUtils;

{ TLivro }

procedure TLivroModel.SetAno(const Value: SmallInt);
begin
  FAno := Value;
end;

procedure TLivroModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TLivroModel.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TLivroModel.SetEditora(const Value: TEditoraModel);
begin
  FEditora := Value;
end;

procedure TLivroModel.SetISBN(const Value: String);
begin
  FISBN := Value;
end;

procedure TLivroModel.SetTitulo(const Value: String);
begin
  FTitulo := Value;
end;

function TLivroModel.ToString: String;
begin
  Result := Self.FCodigo.ToString + ' - ' +
            Self.FTitulo          + ' '   +
            Self.FEditora.Nome;
end;

end.
