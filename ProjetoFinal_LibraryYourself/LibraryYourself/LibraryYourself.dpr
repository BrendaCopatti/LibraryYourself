program LibraryYourself;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
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
  uPadraoSQL in 'SQLs\uPadraoSQL.pas';

//uGenericDAO in 'Frameworks\Persistencia\uGenericDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrPadrao, frPadrao);
  Application.CreateForm(TdmAcessaBanco, dmAcessaBanco);
  Application.Run;
end.
