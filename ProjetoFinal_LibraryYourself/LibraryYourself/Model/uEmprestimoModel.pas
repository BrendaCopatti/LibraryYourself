unit uEmprestimoModel;

interface

uses uGenericEntity, uLivroModel, uUsuarioModel;

type
  [TableName('emprestimo')]
  TEmprestimoModel = class(TGenericEntity)
  private
    FCodigo: Integer;
    FDataVencimento: TDate;
    FMulta: Double;
    FDataDevolucao: TDate;
    FDataRetirada: TDate;
    FUsuario: TUsuarioModel;
    FLivro: TLivroModel;
    procedure SetCodigo(const Value: Integer);
    procedure SetDataDevolucao(const Value: TDate);
    procedure SetDataRetirada(const Value: TDate);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetLivro(const Value: TLivroModel);
    procedure SetMulta(const Value: Double);
    procedure SetUsuario(const Value: TUsuarioModel);
    
  public
  	[KeyField('codigo')]
    [FieldName('codigo')]
    property Codigo:         Integer read FCodigo write SetCodigo;
    [FieldName('livro_codigo')]
    [ForeignKey('livro_codigo', 'codigo', 'livro')]
    property Livro:          TLivroModel read FLivro write SetLivro;
    [FieldName('usuario_codigo')]
    [ForeignKey('usuario_codigo', 'codigo', 'usuario')]
    property Usuario:        TUsuarioModel read FUsuario write SetUsuario;
    [FieldName('data_retirada')]
    property DataRetirada:   TDate read FDataRetirada write SetDataRetirada;
    [FieldName('data_vencimento')]
    property DataVencimento: TDate read FDataVencimento write SetDataVencimento;
    [FieldName('data_devolucao')]
    property DataDevolucao:  TDate read FDataDevolucao write SetDataDevolucao;
    [FieldName('multa')]
    property Multa:          Double read FMulta write SetMulta;

    function GetDataRetirada(): String;
    function GetDataVencimento(): String;
    function GetDataDevolucao(): String;

    function ToString(): String; override;
	end;

implementation

uses SysUtils;

{ TEmprestimoModel }


{ TEmprestimoModel }

function TEmprestimoModel.GetDataDevolucao: String;
begin
  Result := GetDataFormatada(Self.FDataDevolucao);
end;

function TEmprestimoModel.GetDataRetirada: String;
begin
  Result := GetDataFormatada(Self.FDataRetirada);
end;

function TEmprestimoModel.GetDataVencimento: String;
begin
  Result := GetDataFormatada(Self.FDataVencimento);
end;

procedure TEmprestimoModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TEmprestimoModel.SetDataDevolucao(const Value: TDate);
begin
  FDataDevolucao := Value;
end;

procedure TEmprestimoModel.SetDataRetirada(const Value: TDate);
begin
  FDataRetirada := Value;
end;

procedure TEmprestimoModel.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TEmprestimoModel.SetLivro(const Value: TLivroModel);
begin
  FLivro := Value;
end;

procedure TEmprestimoModel.SetMulta(const Value: Double);
begin
  FMulta := Value;
end;

procedure TEmprestimoModel.SetUsuario(const Value: TUsuarioModel);
begin
  FUsuario := Value;
end;

function TEmprestimoModel.ToString: String;
begin
  Result := Self.FCodigo.ToString + ' - ' +
            Self.FUsuario.Nome    + ' - ' +
            Self.FLivro.Titulo    + ' - ' +
            Self.GetDataRetirada  + ' - ' +
            Self.GetDataVencimento;
end;

end.
