object frLogin: TfrLogin
  Left = 0
  Top = 0
  Caption = 'Library Yourself'
  ClientHeight = 204
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object edtCPF: TLabeledEdit
    Left = 24
    Top = 48
    Width = 241
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = 'CPF'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object edtSenha: TLabeledEdit
    Left = 24
    Top = 88
    Width = 241
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = False
    TabOrder = 1
  end
  object btnEntrar: TButton
    Left = 104
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btnEntrarClick
  end
  object fdqLogin: TFDQuery
    Connection = dmAcessaBanco.fdcLYS
    Left = 232
    Top = 128
  end
end
