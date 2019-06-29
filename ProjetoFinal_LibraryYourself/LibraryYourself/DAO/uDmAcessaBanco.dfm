object dmAcessaBanco: TdmAcessaBanco
  OldCreateOrder = False
  Height = 150
  Width = 215
  object fdpLYS: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\brend\Documents\GitHub\LibraryYourself\ProjetoFinal_Lib' +
      'raryYourself\LibraryYourself\libpq.dll'
    Left = 72
    Top = 56
  end
  object fdcLYS: TFDConnection
    Params.Strings = (
      'Database=LibraryYourself'
      'User_Name=postgres'
      'Password=12345'
      'DriverID=PG')
    Connected = True
    Left = 72
    Top = 8
  end
end
