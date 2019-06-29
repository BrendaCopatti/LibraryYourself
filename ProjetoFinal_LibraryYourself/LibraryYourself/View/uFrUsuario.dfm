inherited frUsuario: TfrUsuario
  Caption = 'Usu'#225'rio'
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
      object edtNome: TLabeledEdit
        Left = 16
        Top = 72
        Width = 745
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 70
        TabOrder = 0
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
        TabOrder = 1
      end
      object edtCPF: TLabeledEdit
        Left = 16
        Top = 120
        Width = 200
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'CPF'
        MaxLength = 11
        TabOrder = 2
      end
      object edtSenha: TLabeledEdit
        Left = 16
        Top = 168
        Width = 200
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        MaxLength = 12
        PasswordChar = '*'
        TabOrder = 3
      end
      object edtCelular: TLabeledEdit
        Left = 16
        Top = 216
        Width = 200
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Celular'
        MaxLength = 11
        TabOrder = 4
      end
      object cbxAdministrador: TCheckBox
        Left = 147
        Top = 24
        Width = 134
        Height = 17
        Caption = 'Usu'#225'rio administrador'
        TabOrder = 5
      end
    end
  end
  inherited panBotoesCadastro: TPanel
    inherited btnGravar: TBitBtn
      OnClick = btnGravarClick
    end
  end
end
