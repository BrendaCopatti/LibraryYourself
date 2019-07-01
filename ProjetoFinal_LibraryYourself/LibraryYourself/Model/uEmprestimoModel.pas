unit uEmprestimoModel;

interface

uses uGenericEntity, uLivroModel, uUsuarioModel;

type
  TEmprestimoModel = class(TGenericEntity)
  private
    FCodigo: Integer;
    FDataVencimento: TDate;
    FDataDevolucao: TDate;
    FDataRetirada: TDate;
    FUsuario: TUsuarioModel;
    FLivro: TLivroModel;
    procedure SetCodigo(const Value: Integer);
    procedure SetDataDevolucao(const Value: TDate);
    procedure SetDataRetirada(const Value: TDate);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetLivro(const Value: TLivroModel);
    procedure SetUsuario(const Value: TUsuarioModel);

  public
    property Codigo:         Integer read FCodigo write SetCodigo;
    property Livro:          TLivroModel read FLivro write SetLivro;
    property Usuario:        TUsuarioModel read FUsuario write SetUsuario;
    property DataRetirada:   TDate read FDataRetirada write SetDataRetirada;
    property DataVencimento: TDate read FDataVencimento write SetDataVencimento;
    property DataDevolucao:  TDate read FDataDevolucao write SetDataDevolucao;
	end;

implementation

uses SysUtils;

{ TEmprestimoModel }

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

procedure TEmprestimoModel.SetUsuario(const Value: TUsuarioModel);
begin
  FUsuario := Value;
end;

end.
