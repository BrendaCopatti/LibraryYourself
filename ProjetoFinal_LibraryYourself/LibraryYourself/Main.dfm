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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mnMenu: TMainMenu
    Left = 248
    Top = 192
    object mniCadastros: TMenuItem
      Caption = 'Cadastro'
      object mniAutor: TMenuItem
        Caption = 'Autor'
        OnClick = mniAutorClick
      end
      object mniEditora: TMenuItem
        Caption = 'Editora'
        OnClick = mniEditoraClick
      end
      object mniUsuario: TMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = mniUsuarioClick
      end
      object mniLivro: TMenuItem
        Caption = 'Livro'
        OnClick = mniLivroClick
      end
      object mniEmprestimo: TMenuItem
        Caption = 'Emprestimo'
        OnClick = mniEmprestimoClick
      end
    end
    object mniRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
  end
end
