unit uGenericEntity;

interface

uses RTTI;

type
  TGenericEntity = class(TObject)
  public
    function GetDataFormatada(AData: TDate): String;
  end;

implementation

uses SysUtils;

{ TGenericEntity }

function TGenericEntity.GetDataFormatada(AData: TDate): String;
begin
  Result := FormatDateTime('dd/mm/yyyy', AData);
end;

end.
