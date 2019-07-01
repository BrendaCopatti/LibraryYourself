inherited frEmprestimo: TfrEmprestimo
  Caption = 'Emprestimo'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPadrao: TPageControl
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
      object lblLivro: TLabel
        Left = 16
        Top = 53
        Width = 23
        Height = 13
        Caption = 'Livro'
      end
      object lblUsuario: TLabel
        Left = 16
        Top = 109
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
      object lblDataRetirada: TLabel
        Left = 16
        Top = 165
        Width = 64
        Height = 13
        Caption = 'Data retirada'
      end
      object lblDataVencimento: TLabel
        Left = 16
        Top = 229
        Width = 81
        Height = 13
        Caption = 'Data vencimento'
      end
      object lblDataDevolucao: TLabel
        Left = 16
        Top = 293
        Width = 75
        Height = 13
        Caption = 'Data devolucao'
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
      object cbxLivro: TComboBox
        Left = 16
        Top = 72
        Width = 745
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
      object cbxUsuario: TComboBox
        Left = 16
        Top = 128
        Width = 745
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
      object edtDataRetirada: TMaskEdit
        Left = 16
        Top = 184
        Width = 147
        Height = 21
        EditMask = '00/00/0000'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
      end
      object edtDataVencimento: TMaskEdit
        Left = 16
        Top = 248
        Width = 149
        Height = 21
        EditMask = '00/00/0000'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
      end
      object edtDataDevolucao: TMaskEdit
        Left = 16
        Top = 312
        Width = 147
        Height = 21
        EditMask = '99/99/9999'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
      end
    end
  end
  inherited panBotoesCadastro: TPanel
    inherited btnGravar: TBitBtn
      OnClick = btnGravarClick
    end
  end
  inherited qryPadrao: TFDQuery
    Left = 488
    Top = 232
  end
  inherited dtsPadrao: TDataSource
    Left = 544
    Top = 232
  end
end
