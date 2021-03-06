unit uDmAcessaBanco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TdmAcessaBanco = class(TDataModule)
    fdpLYS: TFDPhysPgDriverLink;
    fdcLYS: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAcessaBanco: TdmAcessaBanco;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
