inherited frLivro: TfrLivro
  Caption = 'Livro'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPadrao: TPageControl
    ActivePage = tshCadastro
    inherited tshPesquisa: TTabSheet
      inherited panPesquisa: TPanel
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
      end
      inherited dbgPadrao: TDBGrid
        OnDblClick = dbgPadraoDblClick
      end
    end
    inherited tshCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 773
      ExplicitHeight = 429
      object lblAutor: TLabel
        Left = 16
        Top = 109
        Width = 27
        Height = 13
        Caption = 'Autor'
      end
      object lblEditora: TLabel
        Left = 16
        Top = 165
        Width = 34
        Height = 13
        Caption = 'Editora'
      end
      object edtCodigo: TLabeledEdit
        Left = 16
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtTitulo: TLabeledEdit
        Left = 16
        Top = 72
        Width = 745
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'T'#237'tulo'
        TabOrder = 1
      end
      object cbxAutor: TComboBox
        Left = 16
        Top = 128
        Width = 745
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
      object cbxEditora: TComboBox
        Left = 16
        Top = 184
        Width = 745
        Height = 21
        Style = csDropDownList
        TabOrder = 3
      end
    end
  end
  inherited panBotoesCadastro: TPanel
    inherited btnGravar: TBitBtn
      OnClick = btnGravarClick
    end
  end
end
