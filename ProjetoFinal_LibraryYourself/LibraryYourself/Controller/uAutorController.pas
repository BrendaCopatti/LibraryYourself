unit uAutorController;

interface

uses SysUtils, uAutorModel, uPadraoController, Dialogs;

type
  TAutorController = class(TPadraoController)
  public
    function GravarRegistro(AAutorModel: TAutorModel): Boolean;
    function ExcluirRegistro(ACodigo: Integer): Boolean;
  end;

implementation

{ TAutorController }

function TAutorController.ExcluirRegistro(ACodigo: Integer): Boolean;
begin
  Result := True;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'DELETE FROM AUTOR WHERE CODIGO = :codigo';
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

function TAutorController.GravarRegistro(AAutorModel: TAutorModel): Boolean;
var LSQL: String;
    LCodigo: Integer;
    LInsert: Boolean;
begin
  Result := True;
  LInsert := AAutorModel.Codigo = 0;
  if LInsert then
  begin
    LCodigo := RetornaPrimaryKey('CODIGO', 'AUTOR');
    LSQL :=
      'INSERT INTO AUTOR VALUES (:codigo, :nome)';
  end
  else
  begin
    LCodigo := AAutorModel.Codigo;
    LSQL :=
      'UPDATE AUTOR SET NOME = :nome WHERE CODIGO = :codigo';
  end;
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text := LSQL;
  FQuery.ParamByName('codigo').AsInteger := LCodigo;
  FQuery.ParamByName('nome').AsString    := AAutorModel.Nome;
  try
    FQuery.ExecSQL();
  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Ocorreu um erro na inclusão do autor.');
    end;
  end;
end;

end.
