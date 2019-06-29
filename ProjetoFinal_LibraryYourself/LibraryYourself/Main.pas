unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAutorModel, RTTI,
  Vcl.Menus, uFrAutor, uFrEditora, uFrUsuario, uFrLivro;

type
  TfrMain = class(TForm)
    mnMenu: TMainMenu;
    mniCadastro: TMenuItem;
    mniAutor: TMenuItem;
    mniEditora: TMenuItem;
    mniUsuario: TMenuItem;
    mniLivro: TMenuItem;
    procedure mniAutorClick(Sender: TObject);
    procedure mniEditoraClick(Sender: TObject);
    procedure mniUsuarioClick(Sender: TObject);
    procedure mniLivroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.dfm}

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

end.
