inherited frUsuario: TfrUsuario
  Caption = 'Usu'#225'rio'
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
      object gbxPermissoes: TGroupBox
        Left = 16
        Top = 243
        Width = 749
        Height = 106
        Caption = 'Permiss'#245'es'
        TabOrder = 5
        object cbxUsuario: TCheckBox
          Left = 28
          Top = 25
          Width = 57
          Height = 17
          Caption = 'Usu'#225'rio'
          TabOrder = 0
        end
        object cbxAutor: TCheckBox
          Left = 28
          Top = 48
          Width = 57
          Height = 17
          Caption = 'Autor'
          TabOrder = 1
        end
        object cbxEmprestimo: TCheckBox
          Left = 128
          Top = 48
          Width = 76
          Height = 17
          Caption = 'Emprestimo'
          TabOrder = 2
        end
        object cbxEditora: TCheckBox
          Left = 28
          Top = 71
          Width = 57
          Height = 17
          Caption = 'Editora'
          TabOrder = 3
        end
        object cbxLivro: TCheckBox
          Left = 128
          Top = 25
          Width = 57
          Height = 17
          Caption = 'Livro'
          TabOrder = 4
        end
        object cbxPermissoes: TCheckBox
          Left = 128
          Top = 71
          Width = 76
          Height = 17
          Caption = 'Permiss'#245'es'
          TabOrder = 5
        end
      end
    end
  end
  inherited panBotoesCadastro: TPanel
    inherited btnGravar: TBitBtn
      OnClick = btnGravarClick
    end
  end
  inherited qryPadrao: TFDQuery
    Left = 456
    Top = 56
  end
  inherited dtsPadrao: TDataSource
    Left = 520
    Top = 56
  end
  object qryPermissoes: TFDQuery
    Connection = dmAcessaBanco.fdcLYS
    Left = 344
    Top = 272
  end
end
