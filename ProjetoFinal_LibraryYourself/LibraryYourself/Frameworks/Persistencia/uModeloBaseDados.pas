unit uModeloBaseDados;

interface

uses
  SysUtils, Classes, FMTBcd, DB, FireDAC.Comp.Client;

type
  TDSServerModuleBaseDados = class(TDataModule)
    FCONEXAO: TFDConnection;
    FQueryGeral: TFDQuery;
  private
  public
    function Conectar:boolean;
    function Desconectar:boolean;

    function GetDataSet(AQuery: string): TFDQuery;
    function ExecSql(AQuery: string): boolean;
  end;

var
  DSServerModuleBaseDados: TDSServerModuleBaseDados;

implementation

{$R *.dfm}

function TDSServerModuleBaseDados.Conectar:boolean;
begin
  try
    FCONEXAO.Connected := true;
    Result := true;
  except
    Result := false;
  end;
end;

function TDSServerModuleBaseDados.Desconectar:boolean;
begin
  try
    FCONEXAO.Connected := false;
    Result := true;
  except
    Result := false;
  end;
end;

function TDSServerModuleBaseDados.GetDataSet(AQuery: string): TFDQuery;
begin
  FQueryGeral.Close;
  FQueryGeral.Params.Clear;
  FQueryGeral.SQL.Text := AQuery;
  FQueryGeral.Open;
  Result := FQueryGeral;
end;

function TDSServerModuleBaseDados.ExecSql(AQuery: string): boolean;
begin
  Result := false;
  if FQueryGeral.Active then
    FQueryGeral.Close;
  FQueryGeral.SQL.Text := AQuery;
  try
    FQueryGeral.ExecSQL;
    Result := true;
  except
   on e: Exception do begin
     raise Exception.Create(e.Message);
   end;
  end;
end;

end.
