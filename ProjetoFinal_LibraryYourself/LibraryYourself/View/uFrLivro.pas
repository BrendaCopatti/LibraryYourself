unit uFrLivro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uLivroController;

type
  TfrLivro = class(TfrPadrao)
    edtCodigo: TLabeledEdit;
    edtTitulo: TLabeledEdit;
    cbxAutor: TComboBox;
    lblAutor: TLabel;
    cbxEditora: TComboBox;
    lblEditora: TLabel;
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPadraoDblClick(Sender: TObject);
  private
    FLivroController: TLivroController;
    procedure LimpaCampos();
    procedure IncluirRegistro();
    function GravarRegistro(): Boolean;
    function ExcluirRegistro(): Boolean;
    procedure PesquisarRegistros();
    function ValidaCampos(): Boolean;
    procedure EditarRegistro();
    procedure AlimentaComboAutores();
    procedure AlimentaComboEditoras();
  public
    { Public declarations }
  end;

var
  frLivro: TfrLivro;

implementation

uses uLivroModel, uAutorModel, uEditoraModel;

{$R *.dfm}

{ TfrLivro }

procedure TfrLivro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro();
end;

procedure TfrLivro.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistro();
end;

procedure TfrLivro.btnIncluirClick(Sender: TObject);
begin
  inherited;
  IncluirRegistro();
end;

procedure TfrLivro.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  PesquisarRegistros();
end;

procedure TfrLivro.AlimentaComboAutores;
begin
  FLivroController.AlimentaComboAutores(cbxAutor);
end;

procedure TfrLivro.AlimentaComboEditoras;
begin
  FLivroController.AlimentaComboEditoras(cbxEditora);
end;

procedure TfrLivro.dbgPadraoDblClick(Sender: TObject);
begin
  inherited;
  EditarRegistro();
end;

procedure TfrLivro.EditarRegistro;
begin
  if not (qryPadrao.FieldByName('codigo').AsInteger > 0) then
    Exit;
  edtCodigo.Text := qryPadrao.FieldByName('codigo').AsString;
  edtTitulo.Text := qryPadrao.FieldByName('titulo').AsString;
  cbxAutor.ItemIndex := cbxAutor.Items.IndexOfObject(
    FLivroController.RetornaObjetoAutor(qryPadrao.FieldByName('autor_codigo').AsInteger));
  cbxEditora.ItemIndex := cbxEditora.Items.IndexOfObject(
    FLivroController.RetornaObjetoEditora(qryPadrao.FieldByName('editora_codigo').AsInteger));
  pgcPadrao.TabIndex := 1;
  AjustaVisibilidadeBotoes();
end;

function TfrLivro.ExcluirRegistro: Boolean;
begin
  FLivroController.frMain := frMain;
  FLivroController.ExcluirRegistro(qryPadrao.FieldByName('CODIGO').AsInteger);
  PesquisarRegistros();
end;

procedure TfrLivro.FormCreate(Sender: TObject);
begin
  inherited;
  FLivroController := TLivroController.Create;
end;

procedure TfrLivro.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FLivroController);
end;

procedure TfrLivro.FormShow(Sender: TObject);
begin
  inherited;
  AlimentaComboAutores();
  AlimentaComboEditoras();
  PesquisarRegistros();
end;

function TfrLivro.GravarRegistro: Boolean;
var LLivro: TLivroModel;
begin
  if not ValidaCampos() then
    Exit;
  LLivro := TLivroModel.Create;
  try
    LLivro.Codigo := StrToIntDef(edtCodigo.Text,0);
    LLivro.Titulo := edtTitulo.Text;
    LLivro.Autor   := TAutorModel(cbxAutor.Items.Objects[cbxAutor.ItemIndex]);
    LLivro.Editora := TEditoraModel(cbxEditora.Items.Objects[cbxEditora.ItemIndex]);
    FLivroController.frMain := frMain;
    if FLivroController.GravarRegistro(LLivro) then
    begin
      LimpaCampos();
      ShowMessage('Registro incluído com sucesso.');
    end;
  finally
    FreeAndNil(LLivro);
  end;
end;

procedure TfrLivro.IncluirRegistro;
begin
  LimpaCampos();
end;

procedure TfrLivro.LimpaCampos;
begin
  edtCodigo.Text := '';
  edtTitulo.Text := '';
  if cbxAutor.Items.Count > 0 then
    cbxAutor.ItemIndex := 0;
  if cbxEditora.Items.Count > 0 then
    cbxEditora.ItemIndex := 0;
end;

procedure TfrLivro.PesquisarRegistros;
var LSQL: String;
    LPesquisaComFiltro: Boolean;
begin
  LSQL :=
    'SELECT * FROM LIVRO ';
  LPesquisaComFiltro := Trim(edtPesquisar.Text) <> '';
  if LPesquisaComFiltro then
    LSQL := LSQL + 'WHERE UPPER(TITULO) LIKE UPPER(:titulo)';
  if qryPadrao.Active then
    qryPadrao.Close;
  qryPadrao.SQL.Text := LSQL;
  if LPesquisaComFiltro then
    qryPadrao.ParamByName('titulo').AsString := '%' + edtPesquisar.Text + '%';
  qryPadrao.Open;
end;

function TfrLivro.ValidaCampos: Boolean;
var LCamposPreechidos: Boolean;
begin
  LCamposPreechidos :=
    (Trim(edtTitulo.Text) <> '') and
    (cbxAutor.ItemIndex >= 0) and
    (cbxEditora.ItemIndex >= 0);
  if not (Trim(edtTitulo.Text) <> '') then
    ShowMessage('Preencha o campo título');
  if not (cbxAutor.ItemIndex >= 0) then
    ShowMessage('Preencha o campo autor');
  if not (cbxEditora.ItemIndex >= 0) then
    ShowMessage('Preencha o campo editora');
  Result := LCamposPreechidos;
end;

end.
