unit uPermissoesModel;

interface

uses uUsuarioModel;

type
  TPermissoesModel = class
  private
    FAcessoEmprestimo: Boolean;
    FCodigo:           Integer;
    FAcessoUsuario:    Boolean;
    FAcessoLivro:      Boolean;
    FAcessoEditora:    Boolean;
    FAcessoPermissoes: Boolean;
    FAcessoAutor:      Boolean;
    FUsuario:          TUsuarioModel;
    procedure SetAcessoAutor(const Value: Boolean);
    procedure SetAcessoEditora(const Value: Boolean);
    procedure SetAcessoEmprestimo(const Value: Boolean);
    procedure SetAcessoLivro(const Value: Boolean);
    procedure SetAcessoPermissoes(const Value: Boolean);
    procedure SetAcessoUsuario(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetUsuario(const Value: TUsuarioModel);
  public
    property Codigo:           Integer       read FCodigo           write SetCodigo;
    property Usuario:          TUsuarioModel read FUsuario          write SetUsuario;
    property AcessoUsuario:    Boolean       read FAcessoUsuario    write SetAcessoUsuario;
    property AcessoAutor:      Boolean       read FAcessoAutor      write SetAcessoAutor;
    property AcessoEditora:    Boolean       read FAcessoEditora    write SetAcessoEditora;
    property AcessoLivro:      Boolean       read FAcessoLivro      write SetAcessoLivro;
    property AcessoEmprestimo: Boolean       read FAcessoEmprestimo write SetAcessoEmprestimo;
    property AcessoPermissoes: Boolean       read FAcessoPermissoes write SetAcessoPermissoes;
  end;

implementation

{ TPermissoesModel }

procedure TPermissoesModel.SetAcessoAutor(const Value: Boolean);
begin
  FAcessoAutor := Value;
end;

procedure TPermissoesModel.SetAcessoEditora(const Value: Boolean);
begin
  FAcessoEditora := Value;
end;

procedure TPermissoesModel.SetAcessoEmprestimo(const Value: Boolean);
begin
  FAcessoEmprestimo := Value;
end;

procedure TPermissoesModel.SetAcessoLivro(const Value: Boolean);
begin
  FAcessoLivro := Value;
end;

procedure TPermissoesModel.SetAcessoPermissoes(const Value: Boolean);
begin
  FAcessoPermissoes := Value;
end;

procedure TPermissoesModel.SetAcessoUsuario(const Value: Boolean);
begin
  FAcessoUsuario := Value;
end;

procedure TPermissoesModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPermissoesModel.SetUsuario(const Value: TUsuarioModel);
begin
  FUsuario := Value;
end;

end.
