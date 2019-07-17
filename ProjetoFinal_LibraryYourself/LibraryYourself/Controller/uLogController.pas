unit uLogController;

interface

uses SysUtils, uPadraoDAO, dialogs, FireDAC.Comp.Client, uDmAcessaBanco, uUsuarioModel;

type
  TLogController = class
  private
    FUsuario: TUsuarioModel;
    FQuery: TFDQuery;
    procedure SetUsuario(const Value: TUsuarioModel);
    function RetornaPrimaryKey(ACampoCodigo, ATabela: String): Integer;
  public
    property Usuario: TUsuarioModel read FUsuario write SetUsuario;
    procedure GravaLog(ADescricao: String);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TLogController }

constructor TLogController.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DmAcessaBanco.fdcLYS;
end;

destructor TLogController.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

procedure TLogController.GravaLog(ADescricao: String);
var LCodigo: Integer;
begin
  LCodigo := RetornaPrimaryKey('CODIGO','LOG');
  if FQuery.Active then
    FQuery.Close;
  FQuery.SQL.Text :=
    'INSERT INTO LOG VALUES (:codigo, :usuario_codigo, :descricao, :horario)';
  FQuery.ParamByName('codigo').AsInteger         := LCodigo;
  FQuery.ParamByName('usuario_codigo').AsInteger := FUsuario.Codigo;
  FQuery.ParamByName('descricao').AsString       := ADescricao;
  FQuery.ParamByName('horario').AsDateTime       := Now;
  FQuery.ExecSQL;
end;

function TLogController.RetornaPrimaryKey(ACampoCodigo,
  ATabela: String): Integer;
begin
  FQuery.SQL.Text :=
    'SELECT MAX(' + ACampoCodigo + ') CODIGO FROM ' + ATabela;
  FQuery.Open;
  try
    Result := FQuery.FieldByName('CODIGO').AsInteger + 1;
  finally
    FQuery.Close;
  end;
end;

procedure TLogController.SetUsuario(const Value: TUsuarioModel);
begin
  FUsuario := Value;
end;

end.
