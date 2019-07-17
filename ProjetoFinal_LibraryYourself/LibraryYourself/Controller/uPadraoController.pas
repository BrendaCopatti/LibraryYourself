unit uPadraoController;

interface

uses SysUtils, Classes, Vcl.ExtCtrls, StdCtrls,
     uBancoModel, Generics.Collections, uPadraoDAO, dialogs, FireDAC.Comp.Client,
     uDmAcessaBanco, Main;

type
  TPadraoController = class
  public
    frMain: TFrMain;
    FQuery: TFDQuery;
    function RetornaPrimaryKey(ACampoCodigo, ATabela: String): Integer;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TPadraoController }


constructor TPadraoController.Create;
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := DmAcessaBanco.fdcLYS;
end;

destructor TPadraoController.Destroy;
begin
  FreeAndNil(FQuery);
end;

function TPadraoController.RetornaPrimaryKey(ACampoCodigo,
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

end.
