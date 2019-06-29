unit uFrPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uPadraoController, uDmAcessaBanco,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrPadrao = class(TForm)
    pgcPadrao: TPageControl;
    tshPesquisa: TTabSheet;
    tshCadastro: TTabSheet;
    panPesquisa: TPanel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    panBotoesCadastro: TPanel;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnIncluir: TBitBtn;
    lblPesquisar: TLabel;
    dbgPadrao: TDBGrid;
    qryPadrao: TFDQuery;
    dtsPadrao: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgcPadraoChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FPadraoController: TPadraoController;
    procedure AjustaVisibilidadeBotoes();
  public
    FObjetoTela: TObject;
  end;

var
  frPadrao: TfrPadrao;

implementation

{$R *.dfm}

procedure TfrPadrao.AjustaVisibilidadeBotoes;
begin
  btnGravar.Enabled   := pgcPadrao.TabIndex = 1;
  btnCancelar.Enabled := pgcPadrao.TabIndex = 1;
  btnExcluir.Enabled := pgcPadrao.TabIndex = 0;
end;

procedure TfrPadrao.btnCancelarClick(Sender: TObject);
begin
  pgcPadrao.TabIndex := 0;
  AjustaVisibilidadeBotoes();
end;

procedure TfrPadrao.btnExcluirClick(Sender: TObject);
begin
  if not (qryPadrao.FieldByName('CODIGO').AsInteger > 0) then
  begin
    ShowMessage('Selecione um registro para excluir');
    Exit;
  end;
end;

procedure TfrPadrao.btnIncluirClick(Sender: TObject);
begin
  pgcPadrao.TabIndex := 1;
  AjustaVisibilidadeBotoes();
end;

procedure TfrPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Self);
end;

procedure TfrPadrao.FormShow(Sender: TObject);
begin
  AjustaVisibilidadeBotoes();
end;

procedure TfrPadrao.pgcPadraoChange(Sender: TObject);
begin
  AjustaVisibilidadeBotoes();
end;

end.
