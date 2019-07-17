unit uUsuarioController;

interface

uses SysUtils, StrUtils, Dialogs, uUsuarioModel, uPadraoController, uPermissoesModel;

type
  TUsuarioController = class(TPadraoController)
    function GravarRegistro(AUsuarioModel: TUsuarioModel): Integer;
    function ExcluirRegistro(ACodigo: Integer): Boolean;

    function GravarRegistroPermissoes(APermissoesModel: TPermissoesModel): Boolean;
    function ExcluirRegistroPermissoes(ACodigo: Integer): Boolean;
  end;

implementation

{ TUsuarioController }

function TUsuarioController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM USUARIO WHERE CODIGO = :codigo';
  FQuery.ParamByName('codigo').AsInteger := ACodigo;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog('Excluiu Usuário '+ ACodigo.ToString);
  except
    on E: Exception do
    begin
      Result := False;
      frMain.FLogController.GravaLog('Erro ao excluir Usuário '+ ACodigo.ToString);
      ShowMessage('Ocorreu um erro ao excluir o registro');
    end;
  end;
end;

function TUsuarioController.ExcluirRegistroPermissoes(
  ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM PERMISSOES WHERE USUARIO_CODIGO = :usuario_codigo';
  FQuery.ParamByName('usuario_codigo').AsInteger := ACodigo;
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

function TUsuarioController.GravarRegistro(
  AUsuarioModel: TUsuarioModel): Integer;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  LInsert := AUsuarioModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'USUARIO');
    LSQL :=
      'INSERT INTO USUARIO VALUES (:codigo, :nome, :administrador, :cpf, :senha, :celular)';
  end
  else
  begin
    LCodigo := AUsuarioModel.Codigo;
    LSQL :=
      'UPDATE USUARIO SET NOME = :nome, ADMINISTRADOR = :administrador, '+
                         'CPF = :cpf, SENHA = :senha, CELULAR = :celular '+
      'WHERE CODIGO = :codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  FQuery.ParamByName('codigo').AsInteger        := LCodigo;
  FQuery.ParamByName('nome').AsString           := AUsuarioModel.Nome;
  FQuery.ParamByName('administrador').AsBoolean := AUsuarioModel.Administrador;
  FQuery.ParamByName('cpf').AsString            := AUsuarioModel.CPF;
  FQuery.ParamByName('senha').AsString          := AUsuarioModel.Senha;
  FQuery.ParamByName('celular').AsString        := AUsuarioModel.Celular;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog(
      IfThen(LInsert, 'Inseriu ', 'Editou ') +
        'Usuário: código: ' + LCodigo.ToString +
                ' nome: ' + AUsuarioModel.Nome +
                 ' cpf: ' + AUsuarioModel.CPF +
             ' celular: ' + AUsuarioModel.Celular);
    Result := LCodigo;
  except
    on E: Exception do
    begin
      Result := 0;
      frMain.FLogController.GravaLog(
      'Erro ao '+
      IfThen(LInsert, 'Inserir ', 'Editar ') +
        'Usuário: código: ' + LCodigo.ToString +
                ' nome: ' + AUsuarioModel.Nome +
                 ' cpf: ' + AUsuarioModel.CPF +
             ' celular: ' + AUsuarioModel.Celular);
      ShowMessage('Ocorreu um erro na inclusão do usuário.');
    end;
  end;
end;

function TUsuarioController.GravarRegistroPermissoes(
  APermissoesModel: TPermissoesModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
  LInsert := APermissoesModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'PERMISSOES');
    LSQL :=
      'INSERT INTO PERMISSOES VALUES (:codigo, :usuario_codigo, '       +
                                     ':acessoautor, :acessoeditora, '   +
                                     ':acessolivro, :acessoemprestimo, '+
                                     ':acessousuario, :acessopermissoes)';
  end
  else
  begin
    LCodigo := APermissoesModel.Codigo;
    LSQL :=
      'UPDATE PERMISSOES SET USUARIO_CODIGO = :usuario_codigo,'                      +
               'ACESSO_AUTOR = :acessoautor, ACESSO_EDITORA = :acessoeditora, '      +
               'ACESSO_LIVRO = :acessolivro, ACESSO_EMPRESTIMO = :acessoemprestimo, '+
                         'ACESSO_USUARIO = :acessousuario, ACESSO_PERMISSOES = :acessopermissoes '+
      'WHERE USUARIO_CODIGO = :usuario_codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  if LInsert then
    FQuery.ParamByName('codigo').AsInteger := LCodigo;
  FQuery.ParamByName('usuario_codigo').AsInteger   := APermissoesModel.Usuario.Codigo;
  FQuery.ParamByName('acessoautor').AsBoolean      := APermissoesModel.AcessoAutor;
  FQuery.ParamByName('acessoeditora').AsBoolean    := APermissoesModel.AcessoEditora;
  FQuery.ParamByName('acessolivro').AsBoolean      := APermissoesModel.AcessoLivro;
  FQuery.ParamByName('acessoemprestimo').AsBoolean := APermissoesModel.AcessoEmprestimo;
  FQuery.ParamByName('acessousuario').AsBoolean    := APermissoesModel.AcessoUsuario;
  FQuery.ParamByName('acessopermissoes').AsBoolean := APermissoesModel.AcessoPermissoes;
  try
    FQuery.ExecSQL();
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ocorreu um erro na inclusão do usuário.');
    end;
  end;
end;

end.
