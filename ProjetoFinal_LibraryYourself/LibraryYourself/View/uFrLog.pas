unit uFrLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDmAcessaBanco;

type
  TfrLog = class(TForm)
    dbgPadrao: TDBGrid;
    panPesquisa: TPanel;
    lblPesquisar: TLabel;
    edtPesquisar: TEdit;
    btnPesquisar: TButton;
    fdqLog: TFDQuery;
    dtsLog: TDataSource;
    procedure btnPesquisarClick(Sender: TObject);
  private
    procedure BuscarLogs();
  public
    { Public declarations }
  end;

var
  frLog: TfrLog;

implementation

uses StrUtils;

{$R *.dfm}

procedure TfrLog.btnPesquisarClick(Sender: TObject);
begin
  BuscarLogs();
end;

procedure TfrLog.BuscarLogs;
begin
  if fdqLog.Active then
    fdqLog.Close;
  fdqLog.SQL.Text :=
    'SELECT * FROM LOG '+
    IfThen(Trim(edtPesquisar.Text) <> '',
           'WHERE USUARIO_CODIGO = :usuario_codigo')+
    'ORDER BY HORARIO DESC';
  if Trim(edtPesquisar.Text) <> '' then
    fdqLog.ParamByName('usuario_codigo').AsInteger :=
      StrToIntDef(edtPesquisar.Text,0);
  fdqLog.Open();
end;

end.
