inherited frEditora: TfrEditora
  Caption = 'Editora'
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
      object edtNome: TLabeledEdit
        Left = 16
        Top = 72
        Width = 745
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
    end
  end
  inherited panBotoesCadastro: TPanel
    inherited btnGravar: TBitBtn
      OnClick = btnGravarClick
    end
  end
end
