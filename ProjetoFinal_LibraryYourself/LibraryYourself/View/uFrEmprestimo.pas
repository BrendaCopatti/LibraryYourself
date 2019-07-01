unit uFrEmprestimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.Mask, uEmprestimoController;

type
  TfrEmprestimo = class(TfrPadrao)
    edtCodigo: TLabeledEdit;
    cbxLivro: TComboBox;
    cbxUsuario: TComboBox;
    lblLivro: TLabel;
    lblUsuario: TLabel;
    edtDataRetirada: TMaskEdit;
    edtDataVencimento: TMaskEdit;
    lblDataRetirada: TLabel;
    lblDataVencimento: TLabel;
    edtDataDevolucao: TMaskEdit;
    lblDataDevolucao: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPadraoDblClick(Sender: TObject);
  private
    FEmprestimoController: TEmprestimoController;
    procedure LimpaCampos();
    procedure IncluirRegistro();
    function GravarRegistro(): Boolean;
    function ExcluirRegistro(): Boolean;
    procedure PesquisarRegistros();
    function ValidaCampos(): Boolean;
    procedure EditarRegistro();
    procedure AlimentaComboUsuarios();
    procedure AlimentaComboLivros();
  public
    { Public declarations }
  end;

var
  frEmprestimo: TfrEmprestimo;

implementation

uses uEmprestimoModel, uUsuarioModel, uLivroModel;

{$R *.dfm}

{ TfrEmprestimo }

procedure TfrEmprestimo.AlimentaComboLivros;
begin
  FEmprestimoController.AlimentaComboLivros(cbxLivro);
end;

procedure TfrEmprestimo.AlimentaComboUsuarios;
begin
  FEmprestimoController.AlimentaComboUsuarios(cbxUsuario);
end;

procedure TfrEmprestimo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro();
end;

procedure TfrEmprestimo.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistro();
end;

procedure TfrEmprestimo.btnIncluirClick(Sender: TObject);
begin
  inherited;
  IncluirRegistro();
end;

procedure TfrEmprestimo.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

procedure TfrEmprestimo.dbgPadraoDblClick(Sender: TObject);
begin
  inherited;
  EditarRegistro();
end;

procedure TfrEmprestimo.EditarRegistro;
begin
  if not (qryPadrao.FieldByName('codigo').AsInteger > 0) then
    Exit;
  edtCodigo.Text := qryPadrao.FieldByName('codigo').AsString;
  edtDataRetirada.Text   := qryPadrao.FieldByName('dataretirada').AsString;
  edtDataVencimento.Text := qryPadrao.FieldByName('datavencimento').AsString;
  edtDataDevolucao.Text  := qryPadrao.FieldByName('datadevolucao').AsString;
  cbxLivro.ItemIndex := cbxLivro.Items.IndexOfObject(
    FEmprestimoController.RetornaObjetoLivro(qryPadrao.FieldByName('livro_codigo').AsInteger));
  cbxUsuario.ItemIndex := cbxUsuario.Items.IndexOfObject(
    FEmprestimoController.RetornaObjetoUsuario(qryPadrao.FieldByName('usuario_codigo').AsInteger));
  pgcPadrao.TabIndex := 1;
  AjustaVisibilidadeBotoes();
end;

function TfrEmprestimo.ExcluirRegistro: Boolean;
begin
  FEmprestimoController.ExcluirRegistro(qryPadrao.FieldByName('CODIGO').AsInteger);
  PesquisarRegistros();
end;

procedure TfrEmprestimo.FormCreate(Sender: TObject);
begin
  inherited;
  FEmprestimoController := TEmprestimoController.Create;
end;

function TfrEmprestimo.GravarRegistro: Boolean;
var LEmprestimo: TEmprestimoModel;
begin
  if not ValidaCampos() then
    Exit;
  LEmprestimo := TEmprestimoModel.Create;
  try
    LEmprestimo.Codigo := StrToIntDef(edtCodigo.Text,0);
    LEmprestimo.Livro   := TLivroModel(cbxLivro.Items.Objects[cbxLivro.ItemIndex]);
    LEmprestimo.Usuario := TUsuarioModel(cbxUsuario.Items.Objects[cbxUsuario.ItemIndex]);
    LEmprestimo.DataRetirada := StrToDateDef(edtDataRetirada.Text,0);
    LEmprestimo.DataVencimento := StrToDateDef(edtDataVencimento.Text,0);
    LEmprestimo.DataDevolucao := StrToDateDef(edtDataDevolucao.Text,0);
    if FEmprestimoController.GravarRegistro(LEmprestimo) then
    begin
      LimpaCampos();
      ShowMessage('Registro incluído com sucesso.');
    end;
  finally
    FreeAndNil(LEmprestimo);
  end;
end;

procedure TfrEmprestimo.IncluirRegistro;
begin
  LimpaCampos();
end;

procedure TfrEmprestimo.LimpaCampos;
begin
  edtCodigo.Text := '';
  if cbxUsuario.Items.Count > 0 then
    cbxUsuario.ItemIndex := 0;
  if cbxLivro.Items.Count > 0 then
    cbxLivro.ItemIndex := 0;
  edtDataRetirada.Text := '';
  edtDataVencimento.Text := '';
  edtDataDevolucao.Text := '';
end;

procedure TfrEmprestimo.PesquisarRegistros;
var LSQL: String;
    LPesquisaComFiltro: Boolean;
begin
  LSQL :=
    'SELECT * FROM EMPRESTIMO '+
    'INNER JOIN USUARIO ON (USUARIO.CODIGO = EMPRESTIMO.USUARIO_CODIGO) ';
  LPesquisaComFiltro := Trim(edtPesquisar.Text) <> '';
  if LPesquisaComFiltro then
    LSQL := LSQL + 'WHERE UPPER(USUARIO.NOME) LIKE UPPER(:usuario_nome)';
  if qryPadrao.Active then
    qryPadrao.Close;
  qryPadrao.SQL.Text := LSQL;
  if LPesquisaComFiltro then
    qryPadrao.ParamByName('usuario_nome').AsString := '%' + edtPesquisar.Text + '%';
  qryPadrao.Open;
end;

function TfrEmprestimo.ValidaCampos: Boolean;
var LCamposPreechidos: Boolean;
begin
  LCamposPreechidos :=
    (Trim(edtDataRetirada.Text) <> '') and
    (Trim(edtDataVencimento.Text) <> '') and
    (cbxLivro.ItemIndex >= 0) and
    (cbxUsuario.ItemIndex >= 0);
  if not (Trim(edtDataRetirada.Text) <> '') then
    ShowMessage('Preencha o campo data retirada');
  if not (Trim(edtDataVencimento.Text) <> '') then
    ShowMessage('Preencha o campo data vencimento');
  if not (cbxLivro.ItemIndex >= 0) then
    ShowMessage('Preencha o campo livro');
  if not (cbxUsuario.ItemIndex >= 0) then
    ShowMessage('Preencha o campo usuario');
  Result := LCamposPreechidos;
end;

procedure TfrEmprestimo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FEmprestimoController);
end;

procedure TfrEmprestimo.FormShow(Sender: TObject);
begin
  inherited;
  AlimentaComboUsuarios();
  AlimentaComboLivros();
  PesquisarRegistros();
end;

end.
