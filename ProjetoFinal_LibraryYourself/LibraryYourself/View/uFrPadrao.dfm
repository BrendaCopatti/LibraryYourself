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
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPadrao: TPageControl
    Left = 0
    Top = 40
    Width = 781
    Height = 455
    ActivePage = tshPesquisa
    Align = alClient
    MultiLine = True
    TabOrder = 0
    TabPosition = tpBottom
    OnChange = pgcPadraoChange
    object tshPesquisa: TTabSheet
      Caption = 'Pesquisar'
      object panPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 49
        Align = alTop
        TabOrder = 0
        object lblPesquisar: TLabel
          Left = 11
          Top = 11
          Width = 69
          Height = 13
          Caption = 'Pesquisar por:'
        end
        object edtPesquisar: TEdit
          Left = 86
          Top = 8
          Width = 597
          Height = 21
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 688
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object dbgPadrao: TDBGrid
        Left = 0
        Top = 49
        Width = 773
        Height = 380
        Align = alClient
        DataSource = dtsPadrao
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tshCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      Left = 151
      Top = 1
      Width = 50
      Height = 38
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnCancelar: TBitBtn
      Left = 101
      Top = 1
      Width = 50
      Height = 38
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnGravar: TBitBtn
      Left = 51
      Top = 1
      Width = 50
      Height = 38
      Align = alLeft
      Caption = 'Gravar'
      TabOrder = 2
    end
    object btnIncluir: TBitBtn
      Left = 1
      Top = 1
      Width = 50
      Height = 38
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 3
      OnClick = btnIncluirClick
    end
  end
  object qryPadrao: TFDQuery
    Connection = dmAcessaBanco.fdcLYS
    Left = 384
    Top = 256
  end
  object dtsPadrao: TDataSource
    DataSet = qryPadrao
    Left = 448
    Top = 256
  end
end
