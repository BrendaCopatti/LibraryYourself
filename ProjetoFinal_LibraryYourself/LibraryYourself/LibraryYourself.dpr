program LibraryYourself;

uses
  Vcl.Forms,
  uUsuarioModel in 'Model\uUsuarioModel.pas',
  uTelaModel in 'Model\uTelaModel.pas',
  uAutorModel in 'Model\uAutorModel.pas',
  uEditoraModel in 'Model\uEditoraModel.pas',
  uLivroModel in 'Model\uLivroModel.pas',
  uAutorLivroModel in 'Model\uAutorLivroModel.pas',
  uEmprestimoModel in 'Model\uEmprestimoModel.pas',
  uFrPadrao in 'View\uFrPadrao.pas' {frPadrao},
  uCustomAttributesEntity in 'Frameworks\Persistencia\uCustomAttributesEntity.pas',
  uGenericEntity in 'Frameworks\Persistencia\uGenericEntity.pas',
  uDmAcessaBanco in 'DAO\uDmAcessaBanco.pas' {dmAcessaBanco: TDataModule},
  uPadraoDAO in 'DAO\uPadraoDAO.pas',
  uPadraoController in 'Controller\uPadraoController.pas',
  uBancoModel in 'Model\uBancoModel.pas',
  uPadraoSQL in 'SQLs\uPadraoSQL.pas',
  uFrAutor in 'View\uFrAutor.pas' {frAutor},
  uAutorController in 'Controller\uAutorController.pas',
  Main in 'Main.pas' {frMain},
  uFrEditora in 'View\uFrEditora.pas' {frEditora},
  uEditoraController in 'Controller\uEditoraController.pas',
  uFrUsuario in 'View\uFrUsuario.pas' {frUsuario},
  uUsuarioController in 'Controller\uUsuarioController.pas',
  uFrLivro in 'View\uFrLivro.pas' {frLivro},
  uLivroController in 'Controller\uLivroController.pas',
  uFrEmprestimo in 'View\uFrEmprestimo.pas' {frEmprestimo},
  uEmprestimoController in 'Controller\uEmprestimoController.pas',
  uFrLogin in 'View\uFrLogin.pas' {frLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmAcessaBanco, dmAcessaBanco);
  Application.CreateForm(TfrMain, frMain);
  Application.CreateForm(TfrLogin, frLogin);
  Application.Run;
end.
