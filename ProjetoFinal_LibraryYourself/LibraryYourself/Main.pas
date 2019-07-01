unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAutorModel, RTTI,
  Vcl.Menus, uFrAutor, uFrEditora, uFrUsuario, uFrLivro, uFrEmprestimo;

type
  TfrMain = class(TForm)
    mnMenu: TMainMenu;
    mniCadastro: TMenuItem;
    mniAutor: TMenuItem;
    mniEditora: TMenuItem;
    mniUsuario: TMenuItem;
    mniLivro: TMenuItem;
    mniEmprestimo: TMenuItem;
    procedure mniAutorClick(Sender: TObject);
    procedure mniEditoraClick(Sender: TObject);
    procedure mniUsuarioClick(Sender: TObject);
    procedure mniLivroClick(Sender: TObject);
    procedure mniEmprestimoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

uses uFrLogin;

{$R *.dfm}

procedure TfrMain.FormShow(Sender: TObject);
var frLogin: TfrLogin;
begin
  frLogin := TfrLogin.Create(Self);
  frLogin.frMain := Self;
  if not (frLogin.ShowModal = mrOk) then
    Application.Terminate;
end;

procedure TfrMain.mniAutorClick(Sender: TObject);
var frAutor: TFrAutor;
begin
  Application.CreateForm(TFrAutor, frAutor);
  frAutor.show();
end;

procedure TfrMain.mniEditoraClick(Sender: TObject);
var frEditora: TFrEditora;
begin
  Application.CreateForm(TFrEditora, frEditora);
  frEditora.show();
end;

procedure TfrMain.mniUsuarioClick(Sender: TObject);
var frUsuario: TFrEditora;
begin
  Application.CreateForm(TfrUsuario, frUsuario);
  frUsuario.show();
end;

procedure TfrMain.mniLivroClick(Sender: TObject);
var frLivro: TfrLivro;
begin
  Application.CreateForm(TfrLivro, frLivro);
  frLivro.show();
end;

procedure TfrMain.mniEmprestimoClick(Sender: TObject);
var frEmprestimo: TfrEmprestimo;
begin
  Application.CreateForm(TfrEmprestimo, frEmprestimo);
  frEmprestimo.show();
end;

end.
