unit uPadraoController;

interface

uses SysUtils, Classes, Vcl.ExtCtrls, StdCtrls,
     uBancoModel, Generics.Collections, uPadraoDAO, dialogs, FireDAC.Comp.Client;

type
  TPadraoController = class
  private
    FObjeto: TObject;
    FPadraoDAO: TPadraoDAO;

    FTabela:     TTabela;
    FListaCampos: TObjectList<TCampo>;
    procedure SetListaCampos(const Value: TObjectList<TCampo>);
    procedure SetTabela(const Value: TTabela);

    function BuscaCampoPeloNome(ANomeCampo: String): TCampo;
    function AlimentaListaCampos(AqryBusca: TFDQuery): TObjectList<TCampo>;

    procedure BuscaTabela();
    procedure BuscaCampos();

    procedure BuscaRegistros(var AqryBusca: TFDQuery; ACampoFiltro: TCampo; AFiltro: String = '');
  published
    property Tabela:      TTabela             read FTabela      write SetTabela;
    property ListaCampos: TObjectList<TCampo> read FListaCampos write SetListaCampos;

  public
    procedure PreencheComboFiltro(var AComboFiltro: TComboBox);
    procedure CarregaRegistro(var AContainer: TComponent);
    constructor Create(AObjeto: TObject);
  end;

implementation

{ TPadraoController }

function TPadraoController.AlimentaListaCampos(AqryBusca: TFDQuery): TObjectList<TCampo>;
var LCampo: TCampo;
    LListaCampos: TObjectList<TCampo>;
begin
  LListaCampos := TObjectList<TCampo>.Create;
  AqryBusca.First;
  while not AqryBusca.Eof do
  begin
    LCampo := TCampo.Create;
    LCampo.Tabela    := FTabela;
    LCampo.Nome      := AqryBusca.FieldByName('NOME').AsString;
    LCampo.Descricao := AqryBusca.FieldByName('DESCRICAO').AsString;
    LCampo.Tipo      := AqryBusca.FieldByName('TIPO').AsString;
    LCampo.CampoPK   := AqryBusca.FieldByName('CAMPOPK').AsString;
    LCampo.TabelaFK  := AqryBusca.FieldByName('TABELAFK').AsString;
    LCampo.CampoFK   := AqryBusca.FieldByName('CAMPOFK').AsString;
    LListaCampos.Add(LCampo);
  end;
  Result := LListaCampos;
end;

function TPadraoController.BuscaCampoPeloNome(ANomeCampo: String): TCampo;
var I: Integer;
    LCampo: TCampo;
begin
  LCampo := nil;
  for I := 0 to FListaCampos.Count -1 do
  begin
    if FListaCampos[I].Nome = ANomeCampo then
      LCampo := FListaCampos[I];
  end;
  Result := LCampo;
end;

procedure TPadraoController.BuscaCampos;
var LqryBusca:    TFDQuery;
    LNomeTabela: String;
begin
  LNomeTabela := UpperCase(FObjeto.ClassName);
  LqryBusca := TFDQuery.Create;
  try
    FPadraoDAO.BuscaCampos(LqryBusca, LNomeTabela);
    if LqryBusca.IsEmpty then
      raise Exception.Create('Não foram encontrados campos para essa tabela.')
    else
      Self.ListaCampos := Self.AlimentaListaCampos(LqryBusca);
  finally
    FreeAndNil(LqryBusca);
  end;
end;

procedure TPadraoController.BuscaRegistros(var AqryBusca: TFDQuery;
  ACampoFiltro: TCampo; AFiltro: String);
begin
  FPadraoDAO.BuscaRegistros(AqryBusca,FTabela,ACampoFiltro,AFiltro);
end;

procedure TPadraoController.BuscaTabela;
var LqryBusca:    TFDQuery;
    LNomeTabela: String;
begin
  LNomeTabela := UpperCase(FObjeto.ClassName);
  LqryBusca := TFDQuery.Create;
  try
    FPadraoDAO.BuscaTabela(LqryBusca, LNomeTabela);
    if LqryBusca.IsEmpty then
      raise Exception.Create('Tabela não encontrada.')
    else
      FTabela := TTabela.Create(LqryBusca.FieldByName('NOME').AsString);
  finally
    FreeAndNil(LqryBusca);
  end;
end;

procedure TPadraoController.CarregaRegistro(var AContainer: TComponent; AObjeto: TObject);
var i: Integer;
    LAttribute: TCustomAttribute;
begin
//  for i := 0  to AContainer.ComponentCount -1 do
//  begin
//    if (AContainer.Components[0].ClassType in [TLabeledEdit, TEdit]) then
//      TEdit(AContainer.Components[0]).Text := AObjeto.fiel
//
//  end;
end;

constructor TPadraoController.Create(AObjeto: TObject);
begin
  FObjeto    := AObjeto;
  FPadraoDAO := TPadraoDAO.Create;
  Self.BuscaTabela();
  Self.BuscaCampos();
end;

procedure TPadraoController.PreencheComboFiltro(var AComboFiltro: TComboBox);
var I: Integer;
begin
  AComboFiltro.Clear;
  for I := 0 to FListaCampos.Count -1 do
    AComboFiltro.AddItem(FListaCampos[I].Descricao, FListaCampos[I]);
end;

procedure TPadraoController.SetListaCampos(const Value: TObjectList<TCampo>);
begin
  FListaCampos := Value;
end;

procedure TPadraoController.SetTabela(const Value: TTabela);
begin
  FTabela := Value;
end;

end.
