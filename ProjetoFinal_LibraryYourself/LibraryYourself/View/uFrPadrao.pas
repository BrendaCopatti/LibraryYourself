unit uFrPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uPadraoController;

type
  TfrPadrao = class(TForm)
    PageControl1: TPageControl;
    tshPesquisa: TTabSheet;
    tshCadastro: TTabSheet;
    panPesquisa: TPanel;
    edtPesquisar: TEdit;
    cbxPesquisar: TComboBox;
    btnPesquisar: TButton;
    panBotoesCadastro: TPanel;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    btnIncluir: TBitBtn;
    lblPesquisarPor: TLabel;
    ListBox1: TListBox;
    procedure FormShow(Sender: TObject);
  private
    FPadraoController: TPadraoController;
  public
    FObjetoTela: TObject;
  end;

var
  frPadrao: TfrPadrao;

implementation

{$R *.dfm}

procedure TfrPadrao.FormShow(Sender: TObject);
begin
  FPadraoController := TPadraoController.Create(FObjetoTela);
end;

end.
