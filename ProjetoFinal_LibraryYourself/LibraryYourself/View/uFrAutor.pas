unit uFrAutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrPadrao, Data.DB, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uAutorController;

type
  TfrAutor = class(TfrPadrao)
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FAutorController: TAutorController;
    procedure LimpaCampos();
    procedure IncluirRegistro();
    function GravarRegistro(): Boolean;
    function ExcluirRegistro(): Boolean;
    procedure PesquisarAutor();
    function ValidaCampos(): Boolean;
  public
  end;

var
  frAutor: TfrAutor;

implementation

uses uAutorModel;

{$R *.dfm}

procedure TfrAutor.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos();
end;

procedure TfrAutor.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ExcluirRegistro();
end;

procedure TfrAutor.btnGravarClick(Sender: TObject);
begin
  inherited;
  GravarRegistro();
end;

procedure TfrAutor.btnIncluirClick(Sender: TObject);
begin
  inherited;
  IncluirRegistro();
end;

procedure TfrAutor.btnPesquisarClick(Sender: TObject);
begin
  PesquisarAutor();
end;

function TfrAutor.ExcluirRegistro: Boolean;
begin
  FAutorController.ExcluirRegistro(qryPadrao.FieldByName('CODIGO').AsInteger);
end;

procedure TfrAutor.FormCreate(Sender: TObject);
begin
  inherited;
  FAutorController := TAutorController.Create;
end;

procedure TfrAutor.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FAutorController);
end;

procedure TfrAutor.FormShow(Sender: TObject);
begin
  inherited;
  PesquisarAutor();
end;

function TfrAutor.GravarRegistro: Boolean;
var LAutor: TAutorModel;
begin
  if not ValidaCampos() then
    Exit;
  LAutor := TAutorModel.Create;
  try
    LAutor.Codigo := StrToIntDef(edtCodigo.Text,0);
    LAutor.Nome   := edtNome.Text;

    if FAutorController.GravarRegistro(LAutor) then
    begin
      LimpaCampos();
      ShowMessage('Registro incluído com sucesso.');
    end;
  finally
    FreeAndNil(LAutor);
  end;
end;

procedure TfrAutor.IncluirRegistro;
begin
  LimpaCampos();
end;

procedure TfrAutor.LimpaCampos;
begin
  edtCodigo.Text := '';
  edtNome.Text   := '';
end;

procedure TfrAutor.PesquisarAutor;
var LSQL: String;
    LPesquisaComFiltro: Boolean;
begin
  LSQL :=
    'SELECT * FROM AUTOR ';
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

function TfrAutor.ValidaCampos: Boolean;
var LCamposPreechidos: Boolean;
begin
  LCamposPreechidos := Trim(edtNome.Text) <> '';
  if not LCamposPreechidos then
    ShowMessage('Preencha o campo nome');
  Result := LCamposPreechidos;
end;

end.
