unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAutorModel, RTTI,
  Vcl.Menus, uFrAutor;

type
  TfrMain = class(TForm)
    mnMenu: TMainMenu;
    mniCadastro: TMenuItem;
    mniAutor: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure mniAutorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frMain: TfrMain;

implementation

{$R *.dfm}

procedure TfrMain.Button1Click(Sender: TObject);
var Autor: TAutorModel;

  ctxRtti : TRttiContext;
  typRtti : TRttiType;
  metRtti : TRttiMethod;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(TAutorModel);

//    for metRtti in typRtti.GetMethods do
//      pMemo.Lines.Add(metRtti.Name);

    metRtti := typRtti.GetMethod('CLOSE'); //Apenas para constar
  finally
    ctxRtti.Free;
  end;

end;

procedure TfrMain.mniAutorClick(Sender: TObject);
var frAutor: TFrAutor;
begin
  Application.CreateForm(TFrAutor, frAutor);
  frAutor.show();
end;

end.
