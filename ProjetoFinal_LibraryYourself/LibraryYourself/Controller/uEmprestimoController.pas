unit uEmprestimoController;

interface

uses SysUtils, Dialogs, Vcl.StdCtrls, Generics.Collections,
     uEmprestimoModel, uPadraoController, uUsuarioModel, uLivroModel,
     Variants, DB;

type
  TEmprestimoController = class(TPadraoController)
  private
    FUsuarios: TDictionary<integer, TUsuarioModel>;
    FLivros: TDictionary<integer, TLivroModel>;
    procedure BuscaUsuarios();
    procedure BuscaLivros();
  public
    function GravarRegistro(AEmprestimoModel: TEmprestimoModel): Boolean;
    function ExcluirRegistro(ACodigo: Integer): Boolean;
    procedure AlimentaComboUsuarios(cbxUsuario: TComboBox);
    procedure AlimentaComboLivros(cbxLivro: TComboBox);

    function RetornaObjetoUsuario(ACodigoUsuario: Integer): TUsuarioModel;
    function RetornaObjetoLivro(ACodigoLivro: Integer): TLivroModel;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEmprestimoController }

procedure TEmprestimoController.AlimentaComboLivros(cbxLivro: TComboBox);
var LLivro: TPair<integer, TLivroModel>;
begin
  BuscaLivros();
  cbxLivro.Clear;
  for LLivro in FLivros do
  begin
    cbxLivro.AddItem(LLivro.Value.Titulo, LLivro.Value);
  end;
end;

procedure TEmprestimoController.AlimentaComboUsuarios(cbxUsuario: TComboBox);
var LUsuario: TPair<integer, TUsuarioModel>;
begin
  BuscaUsuarios();
  cbxUsuario.Clear;
  for LUsuario in FUsuarios do
  begin
    cbxUsuario.AddItem(LUsuario.Value.Nome, LUsuario.Value);
  end;
end;

procedure TEmprestimoController.BuscaLivros;
begin
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := 'SELECT * FROM LIVRO ORDER BY TITULO';
  FQuery.Open();
  try
    FLivros.Clear;
    while not FQuery.Eof do
    begin
      FLivros.Add(FQuery.FieldByName('CODIGO').AsInteger,
                  TLivroModel.Create(FQuery.FieldByName('CODIGO').AsInteger,
                                     FQuery.FieldByName('TITULO').AsString));
      FQuery.Next;
    end;
  finally
    FQuery.Close;
  end;
end;

procedure TEmprestimoController.BuscaUsuarios;
begin
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := 'SELECT * FROM USUARIO ORDER BY NOME';
  FQuery.Open();
  try
    FUsuarios.Clear;
    while not FQuery.Eof do
    begin
      FUsuarios.Add(FQuery.FieldByName('CODIGO').AsInteger,
                    TUsuarioModel.Create(FQuery.FieldByName('CODIGO').AsInteger,
                                         FQuery.FieldByName('NOME').AsString));
      FQuery.Next;
    end;
  finally
    FQuery.Close;
  end;
end;

constructor TEmprestimoController.Create;
begin
  inherited;
  FUsuarios := TDictionary<integer, TUsuarioModel>.Create;
  FLivros   := TDictionary<integer, TLivroModel>.Create;
end;

destructor TEmprestimoController.Destroy;
begin
  FreeAndNil(FUsuarios);
  FreeAndNil(FLivros);
  inherited;
end;

function TEmprestimoController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM EMPRESTIMO WHERE CODIGO = :codigo';
  FQuery.ParamByName('codigo').AsInteger := ACodigo;
  try
    FQuery.ExecSQL();
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ocorreu um erro ao excluir o registro');
    end;
  end;
end;

function TEmprestimoController.GravarRegistro(
  AEmprestimoModel: TEmprestimoModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
  LInsert := AEmprestimoModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'EMPRESTIMO');
    LSQL :=
      'INSERT INTO EMPRESTIMO VALUES (:codigo, :livro_codigo, :usuario_codigo, '+
                               ':dataretirada, :datavencimento, :datadevolucao)';
  end
  else
  begin
    LCodigo := AEmprestimoModel.Codigo;
    LSQL :=
      'UPDATE EMPRESTIMO SET LIVRO_CODIGO = :livro_codigo, '    +
                            'USUARIO_CODIGO = :usuario_codigo, '+
                            'DATARETIRADA = :dataretirada, '    +
                            'DATAVENCIMENTO = :datavencimento, '+
                            'DATADEVOLUCAO = :datadevolucao '   +
      'WHERE CODIGO = :codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  FQuery.ParamByName('codigo').AsInteger          := LCodigo;
  FQuery.ParamByName('livro_codigo').AsInteger    := AEmprestimoModel.Livro.Codigo;
  FQuery.ParamByName('usuario_codigo').AsInteger  := AEmprestimoModel.Usuario.Codigo;
  FQuery.ParamByName('dataretirada').AsDateTime   := AEmprestimoModel.DataRetirada;
  FQuery.ParamByName('datavencimento').AsDateTime := AEmprestimoModel.DataVencimento;
  if AEmprestimoModel.DataDevolucao = StrToDateTime('30/12/1899') then
  begin
    FQuery.ParamByName('datadevolucao').DataType := ftDate;
    FQuery.ParamByName('datadevolucao').Value := null;
  end
  else
    FQuery.ParamByName('datadevolucao').AsDateTime := AEmprestimoModel.DataDevolucao;
  try
    FQuery.ExecSQL();
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ocorreu um erro na inclusão do emprestimo.');
    end;
  end;
end;

function TEmprestimoController.RetornaObjetoLivro(
  ACodigoLivro: Integer): TLivroModel;
var LLivro: TLivroModel;
begin
  if FLivros.TryGetValue(ACodigoLivro, LLivro) then
    Result := LLivro
  else
    Result := nil;
end;

function TEmprestimoController.RetornaObjetoUsuario(
  ACodigoUsuario: Integer): TUsuarioModel;
var LUsuario: TUsuarioModel;
begin
  if FUsuarios.TryGetValue(ACodigoUsuario, LUsuario) then
    Result := LUsuario
  else
    Result := nil;
end;

end.
