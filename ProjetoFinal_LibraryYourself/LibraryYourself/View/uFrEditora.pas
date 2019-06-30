unit uFrEditora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ExtCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, uEditoraController;

type
  TfrEditora = class(TfrPadrao)
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPadraoDblClick(Sender: TObject);
  private
    FEditoraController: TEditoraController;
    procedure LimpaCampos();
    procedure IncluirRegistro();
    function GravarRegistro(): Boolean;
    function ExcluirRegistro(): Boolean;
    procedure PesquisarRegistros();
    function ValidaCampos(): Boolean;
    procedure EditarRegistro();
  public
    { Public declarations }
  end;

var
  frEditora: TfrEditora;

implementation

uses uEditoraModel;

{$R *.dfm}

{ TfrEditora }

procedure TfrEditora.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro();
  PesquisarRegistros();
end;

procedure TfrEditora.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistro();
end;

procedure TfrEditora.btnIncluirClick(Sender: TObject);
begin
  inherited;
  IncluirRegistro();
end;

procedure TfrEditora.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

procedure TfrEditora.dbgPadraoDblClick(Sender: TObject);
begin
  inherited;
  EditarRegistro();
end;

procedure TfrEditora.EditarRegistro;
begin
  if not (qryPadrao.FieldByName('codigo').AsInteger > 0) then
    Exit;
  edtCodigo.Text := qryPadrao.FieldByName('codigo').AsString;
  edtNome.Text   := qryPadrao.FieldByName('nome').AsString;
  pgcPadrao.TabIndex := 1;
  AjustaVisibilidadeBotoes();
end;

function TfrEditora.ExcluirRegistro: Boolean;
begin
  FEditoraController.ExcluirRegistro(qryPadrao.FieldByName('CODIGO').AsInteger);
end;

procedure TfrEditora.FormCreate(Sender: TObject);
begin
  inherited;
  FEditoraController := TEditoraController.Create;
end;

procedure TfrEditora.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FEditoraController);
end;

procedure TfrEditora.FormShow(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

function TfrEditora.GravarRegistro: Boolean;
var LEditora: TEditoraModel;
begin
  if not ValidaCampos() then
    Exit;
  LEditora := TEditoraModel.Create;
  try
    LEditora.Codigo := StrToIntDef(edtCodigo.Text,0);
    LEditora.Nome   := edtNome.Text;

    if FEditoraController.GravarRegistro(LEditora) then
    begin
      LimpaCampos();
      ShowMessage('Registro incluído com sucesso.');
    end;
  finally
    FreeAndNil(LEditora);
  end;
end;

procedure TfrEditora.IncluirRegistro;
begin
  LimpaCampos();
end;

procedure TfrEditora.LimpaCampos;
begin
  edtCodigo.Text := '';
  edtNome.Text   := '';
end;

procedure TfrEditora.PesquisarRegistros;
var LSQL: String;
    LPesquisaComFiltro: Boolean;
begin
  LSQL :=
    'SELECT * FROM EDITORA ';
  LPesquisaComFiltro := Trim(edtPesquisar.Text) <> '';
  if LPesquisaComFiltro then
    LSQL := LSQL + 'WHERE UPPER(NOME) LIKE UPPER(:nome)';
  if qryPadrao.Active then
    qryPadrao.Close;
  qryPadrao.SQL.Text := LSQL;
  if LPesquisaComFiltro then
    qryPadrao.ParamByName('nome').AsString := '%' + edtPesquisar.Text + '%';
  qryPadrao.Open;
end;

function TfrEditora.ValidaCampos: Boolean;
var LCamposPreechidos: Boolean;
begin
  LCamposPreechidos := Trim(edtNome.Text) <> '';
  if not LCamposPreechidos then
    ShowMessage('Preencha o campo nome');
  Result := LCamposPreechidos;
end;

end.
