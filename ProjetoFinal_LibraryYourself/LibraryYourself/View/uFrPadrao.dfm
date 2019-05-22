object frPadrao: TfrPadrao
  Left = 0
  Top = 0
  Caption = 'frPadrao'
  ClientHeight = 495
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 40
    Width = 781
    Height = 455
    ActivePage = tshPesquisa
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    object tshPesquisa: TTabSheet
      Caption = 'Pesquisar'
      object panPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 49
        Align = alTop
        TabOrder = 0
        object lblPesquisarPor: TLabel
          Left = 11
          Top = 11
          Width = 69
          Height = 13
          Caption = 'Pesquisar por:'
        end
        object edtPesquisar: TEdit
          Left = 224
          Top = 8
          Width = 459
          Height = 21
          TabOrder = 0
        end
        object cbxPesquisar: TComboBox
          Left = 82
          Top = 8
          Width = 136
          Height = 21
          TabOrder = 1
          Text = 'cbxPesquisar'
        end
        object btnPesquisar: TButton
          Left = 688
          Top = 6
          Width = 75
          Height = 25
          Caption = 'btnPesquisar'
          TabOrder = 2
        end
      end
      object ListBox1: TListBox
        Left = 0
        Top = 49
        Width = 773
        Height = 380
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object tshCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 469
    end
  end
  object panBotoesCadastro: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 40
    Align = alTop
    TabOrder = 1
    object btnExcluir: TBitBtn
      Left = 121
      Top = 1
      Width = 40
      Height = 38
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 0
    end
    object btnCancelar: TBitBtn
      Left = 81
      Top = 1
      Width = 40
      Height = 38
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
    end
    object btnGravar: TBitBtn
      Left = 41
      Top = 1
      Width = 40
      Height = 38
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 2
    end
    object btnIncluir: TBitBtn
      Left = 1
      Top = 1
      Width = 40
      Height = 38
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 3
    end
  end
end
