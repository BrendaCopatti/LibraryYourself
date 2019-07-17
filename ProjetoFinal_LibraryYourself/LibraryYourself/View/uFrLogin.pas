unit uFrLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmAcessaBanco, uUsuarioModel, Main, uPermissoesModel;

type
  TfrLogin = class(TForm)
    edtCPF: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnEntrar: TButton;
    fdqLogin: TFDQuery;
    procedure btnEntrarClick(Sender: TObject);
  private
    procedure Logar();
    procedure setaPermissoes(ACodigoUsuario: Integer);
  public
    frMain: TFrMain;
  end;

var
  frLogin: TfrLogin;

implementation

{$R *.dfm}

procedure TfrLogin.btnEntrarClick(Sender: TObject);
begin
  Logar();
end;

procedure TfrLogin.Logar;
var LSQL: String;
begin
  frMain.FUsuario.CPF := edtCPF.Text;
  frMain.FUsuario.Senha := edtSenha.Text;
  LSQL :=
    'SELECT * '+
    'FROM USUARIO '           +
    'WHERE (CPF = :cpf' +
    ') AND (SENHA = :senha)';
  fdqLogin.SQL.Text := LSQL;
  fdqLogin.ParamByName('cpf').AsString   := frMain.FUsuario.CPF;
  fdqLogin.ParamByName('senha').AsString := frMain.FUsuario.Senha;
  fdqLogin.Open();
  try
    if fdqLogin.IsEmpty then
      ShowMessage('Usuário ou senha incorretos')
    else
    begin
      frMain.FUsuario.Codigo        := fdqLogin.FieldByName('CODIGO').AsInteger;
      frMain.FUsuario.Administrador := fdqLogin.FieldByName('ADMINISTRADOR').AsBoolean;
      frMain.FUsuario.Celular       := fdqLogin.FieldByName('CELULAR').AsString;
      setaPermissoes(frMain.FUsuario.Codigo);
      ModalResult := mrOk;
    end;
  finally
    fdqLogin.Close;
  end;
end;

procedure TfrLogin.setaPermissoes(ACodigoUsuario: Integer);
var LSQL: String;
begin
  LSQL :=
    'SELECT * '+
    'FROM PERMISSOES ' +
    'WHERE (USUARIO_CODIGO = :usuario_codigo)';
  fdqLogin.SQL.Text := LSQL;
  fdqLogin.ParamByName('usuario_codigo').AsInteger := ACodigoUsuario;
  fdqLogin.Open();
  try
    frMain.FPermissoes.Codigo           := fdqLogin.FieldByName('codigo').AsInteger;
    frMain.FPermissoes.AcessoUsuario    := fdqLogin.FieldByName('acesso_usuario').AsBoolean;
    frMain.FPermissoes.AcessoAutor      := fdqLogin.FieldByName('acesso_autor').AsBoolean;
    frMain.FPermissoes.AcessoEditora    := fdqLogin.FieldByName('acesso_editora').AsBoolean;
    frMain.FPermissoes.AcessoLivro      := fdqLogin.FieldByName('acesso_livro').AsBoolean;
    frMain.FPermissoes.AcessoEmprestimo := fdqLogin.FieldByName('acesso_emprestimo').AsBoolean;
    frMain.FPermissoes.AcessoPermissoes := fdqLogin.FieldByName('acesso_livro').AsBoolean;
  finally
    fdqLogin.Close;
  end;
end;

end.
