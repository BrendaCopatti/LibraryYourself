unit uBancoModel;

interface

type
  TTabela = class
  public
  private
    FNome: String;
    procedure SetNome(const Value: String);
  published
    property Nome: String read FNome write SetNome;
  public
      constructor Create(ANome: String);
  end;

  TCampo = class
  private
    FCampoFK:   String;
    FDescricao: String;
    FTabela:    TTabela;
    FCampoPK:   Boolean;
    FTabelaFK:  String;
    FNome:      String;
    FTipo:      String;
    procedure SetCampoFK(const Value: String);
    procedure SetCampoPK(const Value: Boolean);
    procedure SetDescricao(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetTabela(const Value: TTabela);
    procedure SetTabelaFK(const Value: String);
    procedure SetTipo(const Value: String);

  published
    property Tabela:    TTabela read FTabela    write SetTabela;
    property Nome:      String   read FNome      write SetNome;
    property Descricao: String   read FDescricao write SetDescricao;
    property Tipo:      String   read FTipo      write SetTipo;
    property CampoPK:   Boolean  read FCampoPK   write SetCampoPK;
    property CampoFK:   String   read FCampoFK   write SetCampoFK;
    property TabelaFK:  String   read FTabelaFK  write SetTabelaFK;
  end;

implementation

{ TTabelas }

constructor TTabela.Create(ANome: String);
begin
  FNome := ANome;
end;

procedure TTabela.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TCampos }

procedure TCampo.SetCampoFK(const Value: String);
begin
  FCampoFK := Value;
end;

procedure TCampo.SetCampoPK(const Value: Boolean);
begin
  FCampoPK := Value;
end;

procedure TCampo.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TCampo.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCampo.SetTabela(const Value: TTabela);
begin
  FTabela := Value;
end;

procedure TCampo.SetTabelaFK(const Value: String);
begin
  FTabelaFK := Value;
end;

procedure TCampo.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
