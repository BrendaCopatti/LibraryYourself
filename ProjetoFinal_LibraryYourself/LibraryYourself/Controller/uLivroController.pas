unit uLivroController;

interface

uses SysUtils, StrUtils, Dialogs, Vcl.StdCtrls, Generics.Collections,
     uLivroModel, uPadraoController, uEditoraModel, uAutorModel;

type
  TLivroController = class(TPadraoController)
  private
    FAutores: TDictionary<integer, TAutorModel>;
    FEditoras: TDictionary<integer, TEditoraModel>;
    procedure BuscaAutores();
    procedure BuscaEditoras();
  public
    function GravarRegistro(ALivroModel: TLivroModel): Boolean;
    function ExcluirRegistro(ACodigo: Integer): Boolean;
    procedure AlimentaComboAutores(cbxAutor: TComboBox);
    procedure AlimentaComboEditoras(cbxEditora: TComboBox);

    function RetornaObjetoAutor(ACodigoAutor: Integer): TAutorModel;
    function RetornaObjetoEditora(ACodigoEditora: Integer): TEditoraModel;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TLivroController }

procedure TLivroController.AlimentaComboAutores(cbxAutor: TComboBox);
var LAutor: TPair<integer, TAutorModel>;
begin
  BuscaAutores();
  cbxAutor.Clear;
  for LAutor in FAutores do
  begin
    cbxAutor.AddItem(LAutor.Value.Nome, LAutor.Value);
  end;
end;

procedure TLivroController.AlimentaComboEditoras(cbxEditora: TComboBox);
var LEditora: TPair<integer, TEditoraModel>;
begin
  BuscaEditoras();
  cbxEditora.Clear;
  for LEditora in FEditoras do
  begin
    cbxEditora.AddItem(LEditora.Value.Nome, LEditora.Value);
  end;
end;

procedure TLivroController.BuscaAutores();
begin
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := 'SELECT * FROM AUTOR ORDER BY NOME';
  FQuery.Open();
  try
    FAutores.Clear;
    while not FQuery.Eof do
    begin
      FAutores.Add(FQuery.FieldByName('CODIGO').AsInteger,
                   TAutorModel.Create(FQuery.FieldByName('CODIGO').AsInteger,
                                      FQuery.FieldByName('NOME').AsString));
      FQuery.Next;
    end;
  finally
    FQuery.Close;
  end;
end;

procedure TLivroController.BuscaEditoras();
begin
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := 'SELECT * FROM EDITORA ORDER BY NOME';
  FQuery.Open();
  try
    FEditoras.Clear;
    while not FQuery.Eof do
    begin
      FEditoras.Add(FQuery.FieldByName('CODIGO').AsInteger,
                    TEditoraModel.Create(FQuery.FieldByName('CODIGO').AsInteger,
                                         FQuery.FieldByName('NOME').AsString));
      FQuery.Next;
    end;
  finally
    FQuery.Close;
  end;
end;

constructor TLivroController.Create;
begin
  inherited;
  FAutores := TDictionary<integer, TAutorModel>.Create;
  FEditoras := TDictionary<integer, TEditoraModel>.Create;
end;

destructor TLivroController.Destroy;
begin
  FreeAndNil(FAutores);
  FreeAndNil(FEditoras);
  inherited;
end;

function TLivroController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM LIVRO WHERE CODIGO = :codigo';
  FQuery.ParamByName('codigo').AsInteger := ACodigo;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog('Excluiu Livro '+ ACodigo.ToString);
  except
    on E: Exception do
    begin
      Result := False;
      frMain.FLogController.GravaLog('Erro ao excluir Livro '+ ACodigo.ToString);
      ShowMessage('Ocorreu um erro ao excluir o registro');
    end;
  end;
end;

function TLivroController.GravarRegistro(ALivroModel: TLivroModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
  LInsert := ALivroModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'LIVRO');
    LSQL :=
      'INSERT INTO LIVRO VALUES (:codigo, :titulo, :editora_codigo, :autor_codigo)';
  end
  else
  begin
    LCodigo := ALivroModel.Codigo;
    LSQL :=
      'UPDATE LIVRO SET TITULO = :titulo, '+
                       'EDITORA_CODIGO = :editora_codigo, '+
                       'AUTOR_CODIGO = :autor_codigo '+
      'WHERE CODIGO = :codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  FQuery.ParamByName('codigo').AsInteger         := LCodigo;
  FQuery.ParamByName('titulo').AsString          := ALivroModel.Titulo;
  FQuery.ParamByName('editora_codigo').AsInteger := ALivroModel.Editora.Codigo;
  FQuery.ParamByName('autor_codigo').AsInteger   := ALivroModel.Autor.Codigo;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog(
      IfThen(LInsert, 'Inseriu ', 'Editou ') +
      'Livro: código: ' + LCodigo.ToString +
              ' nome: ' + ALivroModel.Titulo +
    ' editora_codigo: ' + ALivroModel.Editora.Codigo.ToString +
      ' autor_codigo: ' + ALivroModel.Autor.Codigo.ToString);
  except
    on E: Exception do
    begin
      Result := False;
      frMain.FLogController.GravaLog(
      'Erro ao '+
      IfThen(LInsert, 'Inserir ', 'Editar ') +
        'Livro: código: ' + LCodigo.ToString +
                ' nome: ' + ALivroModel.Titulo +
      ' editora_codigo: ' + ALivroModel.Editora.Codigo.ToString +
        ' autor_codigo: ' + ALivroModel.Autor.Codigo.ToString);
      ShowMessage('Ocorreu um erro na inclusão do livro.');
    end;
  end;
end;

function TLivroController.RetornaObjetoAutor(ACodigoAutor: Integer): TAutorModel;
var LAutor: TAutorModel;
begin
  if FAutores.TryGetValue(ACodigoAutor, LAutor) then
    Result := LAutor
  else
    Result := nil;
end;

function TLivroController.RetornaObjetoEditora(ACodigoEditora: Integer): TEditoraModel;
var LEditora: TEditoraModel;
begin
  if FEditoras.TryGetValue(ACodigoEditora, LEditora) then
    Result := LEditora
  else
    Result := nil;
end;

end.
