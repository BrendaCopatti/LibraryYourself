unit uTelaModel;

interface

uses uGenericEntity;

type
  [TableName('tela')]
  TTelaModel = class(TGenericEntity)
  private
    FCodigo:	      Integer;
    FNomeclasse:    String;
    FDescricaoTela: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricaoTela(const Value: String);
    procedure SetNomeclasse(const Value: String);
  public
    [KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo:	      Integer read FCodigo        write SetCodigo;
    [FieldName('nome_classe')]
    property Nomeclasse:    String  read FNomeclasse    write SetNomeclasse;
    [FieldName('descricao_tela')]
    property DescricaoTela: String  read FDescricaoTela write SetDescricaoTela;

    function ToString(): String; override;
  end;

implementation

uses SysUtils;

{ TTelaModel }

procedure TTelaModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTelaModel.SetDescricaoTela(const Value: String);
begin
  FDescricaoTela := Value;
end;

procedure TTelaModel.SetNomeclasse(const Value: String);
begin
  FNomeclasse := Value;
end;

function TTelaModel.ToString: String;
begin
  Result := Self.FCodigo.ToString + ' ' +
            Self.FDescricaoTela;
end;

end.
