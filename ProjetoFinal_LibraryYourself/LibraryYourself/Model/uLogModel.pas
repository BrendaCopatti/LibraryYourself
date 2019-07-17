unit uLogModel;

interface

uses uUsuarioModel;

type
  TLogModel = class
  private
    FHorario:   TDateTime;
    FDescricao: String;
    FCodigo:    Integer;
    FUsuario:   TUsuarioModel;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetHorario(const Value: TDateTime);
    procedure SetUsuario(const Value: TUsuarioModel);
  published
    property Codigo:    Integer       read FCodigo    write SetCodigo;
    property Usuario:   TUsuarioModel read FUsuario   write SetUsuario;
    property Descricao: String        read FDescricao write SetDescricao;
    property Horario:   TDateTime     read FHorario   write SetHorario;
  end;

implementation

{ TLogModel }

procedure TLogModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TLogModel.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TLogModel.SetHorario(const Value: TDateTime);
begin
  FHorario := Value;
end;

procedure TLogModel.SetUsuario(const Value: TUsuarioModel);
begin
  FUsuario := Value;
end;

end.
