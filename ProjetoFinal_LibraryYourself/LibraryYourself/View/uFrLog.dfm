object frLog: TfrLog
  Left = 0
  Top = 0
  Caption = 'Visualiza'#231#227'o dos logs'
  ClientHeight = 312
  ClientWidth = 771
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPadrao: TDBGrid
    Left = 0
    Top = 49
    Width = 771
    Height = 263
    Align = alClient
    DataSource = dtsLog
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object panPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 771
    Height = 49
    Align = alTop
    TabOrder = 1
    ExplicitLeft = -121
    ExplicitWidth = 773
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
      OnClick = btnPesquisarClick
    end
  end
  object fdqLog: TFDQuery
    Connection = dmAcessaBanco.fdcLYS
    Left = 376
    Top = 160
  end
  object dtsLog: TDataSource
    DataSet = fdqLog
    Left = 416
    Top = 160
  end
end
