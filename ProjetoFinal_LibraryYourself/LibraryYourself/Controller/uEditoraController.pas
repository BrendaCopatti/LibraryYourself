unit uEditoraController;

interface

uses SysUtils, StrUtils, Dialogs, uPadraoController, uEditoraModel;

type
  TEditoraController = class(TPadraoController)
    function GravarRegistro(AEditoraModel: TEditoraModel): Boolean;
    function ExcluirRegistro(ACodigo: Integer): Boolean;
  end;

implementation

{ TEditoraController }

function TEditoraController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM EDITORA WHERE CODIGO = :codigo';
  FQuery.ParamByName('codigo').AsInteger := ACodigo;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog('Excluiu Editora '+ ACodigo.ToString);
  except
    on E: Exception do
    begin
      Result := False;
      frMain.FLogController.GravaLog('Erro ao excluir Editora '+ ACodigo.ToString);
      ShowMessage('Ocorreu um erro ao excluir o registro');
    end;
  end;
end;

function TEditoraController.GravarRegistro(
  AEditoraModel: TEditoraModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
  LInsert := AEditoraModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'EDITORA');
    LSQL :=
      'INSERT INTO EDITORA VALUES (:codigo, :nome)';
  end
  else
  begin
    LCodigo := AEditoraModel.Codigo;
    LSQL :=
      'UPDATE EDITORA SET NOME = :nome WHERE CODIGO = :codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  FQuery.ParamByName('codigo').AsInteger := LCodigo;
  FQuery.ParamByName('nome').AsString    := AEditoraModel.Nome;
  try
    FQuery.ExecSQL();
    frMain.FLogController.GravaLog(
      IfThen(LInsert, 'Inseriu ', 'Editou ') +
      'Editora: c�digo: ' + LCodigo.ToString +
              ' nome: ' + AEditoraModel.Nome);
  except
    on E: Exception do
    begin
      Result := False;
      frMain.FLogController.GravaLog(
        'Erro ao '+
        IfThen(LInsert, 'Inserir ', 'Editar ') +
        'Editora: c�digo: ' + LCodigo.ToString +
                ' nome: ' + AEditoraModel.Nome);
      ShowMessage('Ocorreu um erro na inclus�o do editora.');
    end;
  end;
end;

end.
