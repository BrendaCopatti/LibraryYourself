object frMain: TfrMain
  Left = 0
  Top = 0
  Caption = 'Library Yourself'
  ClientHeight = 847
  ClientWidth = 1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mnMenu: TMainMenu
    Left = 552
    Top = 432
    object mniCadastro: TMenuItem
      Caption = 'Cadastro'
      object mniAutor: TMenuItem
        Caption = 'Autor'
        OnClick = mniAutorClick
      end
    end
  end
end