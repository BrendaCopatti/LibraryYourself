unit uFrLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmAcessaBanco, uUsuarioModel, Main;

type
  TfrLogin = class(TForm)
    edtCPF: TLabeledEdit;
    edtSenha: TLabeledEdit;
    btnEntrar: TButton;
    fdqLogin: TFDQuery;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FUsuario: TUsuarioModel;
    procedure Logar();
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

procedure TfrLogin.FormCreate(Sender: TObject);
begin
  FUsuario := TUsuarioModel.Create();
end;

procedure TfrLogin.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUsuario);
end;

procedure TfrLogin.Logar;
var sSQL: String;
begin
  FUsuario.CPF := edtCPF.Text;
  FUsuario.Senha := edtSenha.Text;
  sSQL :=
    'SELECT * '+
    'FROM USUARIO '           +
    'WHERE (CPF = :cpf' +
    ') AND (SENHA = :senha)';
  fdqLogin.SQL.Text := sSQL;
  fdqLogin.ParamByName('cpf').AsString   := FUsuario.CPF;
  fdqLogin.ParamByName('senha').AsString := FUsuario.Senha;
  fdqLogin.Open();
  try
    if fdqLogin.IsEmpty then
      ShowMessage('Usuário ou senha incorretos')
    else
    begin
      FUsuario.Codigo        := fdqLogin.FieldByName('CODIGO').AsInteger;
      FUsuario.Administrador := fdqLogin.FieldByName('ADMINISTRADOR').AsBoolean;
      FUsuario.Celular       := fdqLogin.FieldByName('CELULAR').AsString;
      ModalResult := mrOk;
    end;
  finally
    fdqLogin.Close;
  end;
end;

end.
