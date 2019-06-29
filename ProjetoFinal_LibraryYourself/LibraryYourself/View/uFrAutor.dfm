inherited frAutor: TfrAutor
  Caption = 'Autor'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPadrao: TPageControl
    ActivePage = tshCadastro
    inherited tshPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 773
      ExplicitHeight = 429
      inherited panPesquisa: TPanel
        inherited lblPesquisar: TLabel
          Left = 5
          Width = 75
          Caption = 'Nome do autor:'
          ExplicitLeft = 5
          ExplicitWidth = 75
        end
        inherited btnPesquisar: TButton
          OnClick = btnPesquisarClick
        end
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
  inherited qryPadrao: TFDQuery
    SQL.Strings = (
      'select * from autor')
  end
end
