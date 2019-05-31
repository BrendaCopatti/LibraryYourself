unit uPadraoDAO;

interface

uses FireDAC.Comp.Client, SysUtils, uBancoModel, Generics.Collections;

type
  TPadraoDAO = class
  private
    FTabela:      TTabela;
    FListaCampos: TObjectList<TCampo>;
  public
    procedure BuscaTabela(var AqryBusca: TFDQuery; ANomeTabela: String);
    procedure BuscaCampos(var AqryBusca: TFDQuery; ANomeTabela: String);
    procedure AtribuiTabelaCampos(ATabela: TTabela; AListaCampos: TObjectList<TCampo>);
    procedure BuscaRegistros(var AqryBusca: TFDQuery; ATabela: TTabela; ACampoFiltro: TCampo = nil; AFiltro: String = '');
  end;

implementation

uses uPadraoSQL, uDmAcessaBanco;

{ TPadraoController }

procedure TPadraoDAO.AtribuiTabelaCampos(ATabela: TTabela;
  AListaCampos: TObjectList<TCampo>);
begin
  FTabela      := ATabela;
  FListaCampos := AListaCampos;
end;

procedure TPadraoDAO.BuscaCampos(var AqryBusca: TFDQuery; ANomeTabela: String);
begin
  AqryBusca.Connection := dmAcessaBanco.fdcAcessoBanco;
  AqryBusca.SQL.Add(SQL_BUSCA_CAMPO);
  AqryBusca.ParamByName('NomeTabela').AsString := ANomeTabela;
  AqryBusca.Open();
end;

procedure TPadraoDAO.BuscaRegistros(var AqryBusca: TFDQuery; ATabela: TTabela; ACampoFiltro: TCampo; AFiltro: String);
var LInformadoFiltro:   Boolean;
    LSQLFiltro:         String;
    LSQLBuscaRegistros: String;
begin
  LInformadoFiltro := Trim(AFiltro) <> '';
  if LInformadoFiltro then
    LSQLFiltro := 'WHERE ' + ACampoFiltro + ' = :' + ACampoFiltro;
  LSQLBuscaRegistros :=
    Format(SQL_BUSCA_REGISTROS,
           [ATabela.Nome, //Nome da tabela
            LSQLFiltro]); //Filtro
  if AqryBusca.Active then
    AqryBusca.Close;
  AqryBusca.SQL.Add(LSQLBuscaRegistros);
  if LInformadoFiltro then
    begin
      if ACampoFiltro.Tipo = 'INTEGER' then
        AqryBusca.ParamByName(ACampoFiltro).AsInteger := StrToIntDef(AFiltro,0)
      else if ACampoFiltro.Tipo = 'NUMERIC' then
        AqryBusca.ParamByName(ACampoFiltro).AsFloat := StrToFloatDef(AFiltro,0)
      else if ACampoFiltro.Tipo = 'VARCHAR' then
        AqryBusca.ParamByName(ACampoFiltro).AsString := AFiltro;
    end;
  AqryBusca.Open();
end;

procedure TPadraoDAO.BuscaTabela(var AqryBusca: TFDQuery; ANomeTabela: String);
begin
  AqryBusca.Connection := dmAcessaBanco.fdcAcessoBanco;
  AqryBusca.SQL.Add(SQL_BUSCA_TABELA);
  AqryBusca.ParamByName('NomeTabela').AsString := ANomeTabela;
  AqryBusca.Open();
end;

end.
