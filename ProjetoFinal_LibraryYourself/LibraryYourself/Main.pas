unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAutorModel, RTTI,
  Vcl.Menus, uUsuarioModel,
  uPermissoesModel, uLogController;

type
  TfrMain = class(TForm)
    mnMenu: TMainMenu;
    mniCadastros: TMenuItem;
    mniAutor: TMenuItem;
    mniEditora: TMenuItem;
    mniUsuario: TMenuItem;
    mniLivro: TMenuItem;
    mniEmprestimo: TMenuItem;
    mniRelatorios: TMenuItem;
    procedure mniAutorClick(Sender: TObject);
    procedure mniEditoraClick(Sender: TObject);
    procedure mniUsuarioClick(Sender: TObject);
    procedure mniLivroClick(Sender: TObject);
    procedure mniEmprestimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    FUsuario: TUsuarioModel;
    FPermissoes: TPermissoesModel;
    FLogController: TLogController;
  end;

var
  frMain: TfrMain;

implementation

uses uFrLogin, uFrAutor, uFrEditora, uFrUsuario, uFrLivro, uFrEmprestimo;

{$R *.dfm}

procedure TfrMain.FormCreate(Sender: TObject);
begin
  FUsuario       := TUsuarioModel.Create();
  FPermissoes    := TPermissoesModel.Create();
end;

procedure TfrMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FPermissoes);
  FreeAndNil(FLogController);
end;

procedure TfrMain.FormShow(Sender: TObject);
var frLogin: TfrLogin;
begin
  FLogController := TLogController.Create;
  frLogin := TfrLogin.Create(Self);
  frLogin.frMain := Self;
  if not (frLogin.ShowModal = mrOk) then
    Application.Terminate;
  FLogController.Usuario := FUsuario;
  FLogController.GravaLog('Usuario logou');
end;

procedure TfrMain.mniAutorClick(Sender: TObject);
var frAutor: TFrAutor;
begin
  if not FPermissoes.AcessoAutor then
  begin
    ShowMessage('Você não tem privilégio para acessar essa tela.');
    exit;
  end;

  Application.CreateForm(TFrAutor, frAutor);
  frAutor.frMain := Self;
  frAutor.show();
end;

procedure TfrMain.mniEditoraClick(Sender: TObject);
var frEditora: TFrEditora;
begin
  if not FPermissoes.AcessoEditora then
  begin
    ShowMessage('Você não tem privilégio para acessar essa tela.');
    exit;
  end;

  Application.CreateForm(TFrEditora, frEditora);
  frEditora.frMain := Self;
  frEditora.show();
end;

procedure TfrMain.mniUsuarioClick(Sender: TObject);
var frUsuario: TFrEditora;
begin
  if not FPermissoes.AcessoUsuario then
  begin
    ShowMessage('Você não tem privilégio para acessar essa tela.');
    exit;
  end;

  Application.CreateForm(TfrUsuario, frUsuario);
  frUsuario.frMain := Self;
  frUsuario.show();
end;

procedure TfrMain.mniLivroClick(Sender: TObject);
var frLivro: TfrLivro;
begin
  if not FPermissoes.AcessoLivro then
  begin
    ShowMessage('Você não tem privilégio para acessar essa tela.');
    exit;
  end;

  Application.CreateForm(TfrLivro, frLivro);
  frLivro.frMain := Self;
  frLivro.show();
end;

procedure TfrMain.mniEmprestimoClick(Sender: TObject);
var frEmprestimo: TfrEmprestimo;
begin
  if not FPermissoes.AcessoEmprestimo then
  begin
    ShowMessage('Você não tem privilégio para acessar essa tela.');
    exit;
  end;

  Application.CreateForm(TfrEmprestimo, frEmprestimo);
  frEmprestimo.frMain := Self;
  frEmprestimo.show();
end;

end.
