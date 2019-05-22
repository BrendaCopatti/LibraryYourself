unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uAutorModel, RTTI;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
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

end.
