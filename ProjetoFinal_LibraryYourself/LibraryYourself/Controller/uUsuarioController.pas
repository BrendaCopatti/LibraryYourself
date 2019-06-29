unit uUsuarioController;

interface

uses SysUtils, Dialogs, uUsuarioModel, uPadraoController;

type
  TUsuarioController = class(TPadraoController)
    function GravarRegistro(AUsuarioModel: TUsuarioModel): Boolean;
    function ExcluirRegistro(ACodigo: Integer): Boolean;
  end;

implementation

{ TUsuarioController }

function TUsuarioController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin

end;

function TUsuarioController.GravarRegistro(
  AUsuarioModel: TUsuarioModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
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
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ocorreu um erro na inclusão do usuário.');
    end;
  end;
end;

end.
