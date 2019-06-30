unit uFrUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uUsuarioController;

type
  TfrUsuario = class(TfrPadrao)
    edtNome: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    edtCPF: TLabeledEdit;
    edtSenha: TLabeledEdit;
    edtCelular: TLabeledEdit;
    cbxAdministrador: TCheckBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPadraoDblClick(Sender: TObject);
  private
    FUsuarioController: TUsuarioController;
    procedure LimpaCampos();
    procedure IncluirRegistro();
    function GravarRegistro(): Boolean;
    function ExcluirRegistro(): Boolean;
    procedure PesquisarRegistros();
    function ValidaCampos(): Boolean;
    procedure EditarRegistro();
  public
  end;

var
  frUsuario: TfrUsuario;

implementation

uses uUsuarioModel;

{$R *.dfm}

{ TfrUsuario }

procedure TfrUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro();
  PesquisarRegistros();
end;

procedure TfrUsuario.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistro();
end;

procedure TfrUsuario.btnIncluirClick(Sender: TObject);
begin
  inherited;
  IncluirRegistro();
end;

procedure TfrUsuario.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

procedure TfrUsuario.dbgPadraoDblClick(Sender: TObject);
begin
  inherited;
  EditarRegistro();
end;

procedure TfrUsuario.EditarRegistro;
begin
  if not (qryPadrao.FieldByName('codigo').AsInteger > 0) then
    Exit;
  edtCodigo.Text  := qryPadrao.FieldByName('codigo').AsString;
  edtNome.Text    := qryPadrao.FieldByName('nome').AsString;
  edtCPF.Text     := qryPadrao.FieldByName('cpf').AsString;
  edtSenha.Text   := qryPadrao.FieldByName('senha').AsString;
  edtCelular.Text := qryPadrao.FieldByName('celular').AsString;
  cbxAdministrador.Checked := qryPadrao.FieldByName('administrador').AsBoolean;
  pgcPadrao.TabIndex := 1;
  AjustaVisibilidadeBotoes();
end;

function TfrUsuario.ExcluirRegistro: Boolean;
begin
  FUsuarioController.ExcluirRegistro(qryPadrao.FieldByName('CODIGO').AsInteger);
end;

procedure TfrUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  FUsuarioController := TUsuarioController.Create;
end;

procedure TfrUsuario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FUsuarioController);
end;

procedure TfrUsuario.FormShow(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

function TfrUsuario.GravarRegistro: Boolean;
var LUsuario: TUsuarioModel;
begin
  if not ValidaCampos() then
    Exit;
  LUsuario := TUsuarioModel.Create;
  try
    LUsuario.Codigo  := StrToIntDef(edtCodigo.Text,0);
    LUsuario.Nome    := edtNome.Text;
    LUsuario.CPF     := edtCPF.Text;
    LUsuario.Senha   := edtSenha.Text;
    LUsuario.Celular := edtCelular.Text;
    LUsuario.Administrador := cbxAdministrador.Checked;

    if FUsuarioController.GravarRegistro(LUsuario) then
    begin
      LimpaCampos();
      ShowMessage('Registro incluído com sucesso.');
    end;
  finally
    FreeAndNil(LUsuario);
  end;
end;

procedure TfrUsuario.IncluirRegistro;
begin
  LimpaCampos();
end;

procedure TfrUsuario.LimpaCampos;
begin
  edtCodigo.Text  := '';
  edtNome.Text    := '';
  edtCPF.Text     := '';
  edtSenha.Text   := '';
  edtCelular.Text := '';
  cbxAdministrador.Checked := False;
end;

procedure TfrUsuario.PesquisarRegistros;
var LSQL: String;
    LPesquisaComFiltro: Boolean;
begin
  LSQL :=
    'SELECT * FROM USUARIO ';
  LPesquisaComFiltro := Trim(edtPesquisar.Text) <> '';
  if LPesquisaComFiltro then
    LSQL := LSQL + 'WHERE UPPER(NOME) LIKE UPPER(:nome)';
  if qryPadrao.Active then
    qryPadrao.Close;
  qryPadrao.SQL.Text := LSQL;
  if LPesquisaComFiltro then
    qryPadrao.ParamByName('nome').AsString := '%' + edtPesquisar.Text + '%';
  qryPadrao.Open;
  qryPadrao.FieldByName('senha').Visible         := false;
  qryPadrao.FieldByName('administrador').Visible := false;
end;

function TfrUsuario.ValidaCampos: Boolean;
var LCamposPreechidos: Boolean;
begin
  LCamposPreechidos :=
    (Trim(edtNome.Text) <> '') and
    (Trim(edtCPF.Text) <> '') and
    (Trim(edtSenha.Text) <> '');
  if not (Trim(edtNome.Text) <> '') then
    ShowMessage('Preencha o campo nome');
  if not (Trim(edtCPF.Text) <> '') then
    ShowMessage('Preencha o campo CPF');
  if not (Trim(edtSenha.Text) <> '') then
    ShowMessage('Preencha o campo senha');
  Result := LCamposPreechidos;
end;

end.
