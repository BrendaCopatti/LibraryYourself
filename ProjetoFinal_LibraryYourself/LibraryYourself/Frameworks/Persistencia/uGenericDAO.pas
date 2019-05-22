unit uGenericDAO;

interface

Uses Db, Rtti, uCustomAttributesEntity, TypInfo, SysUtils;

type
  TGenericDAO = class
    private
      class function GetTableName<T: class>(Obj: T): String;
    public
      //procedimentos para o crud
      class function Insert<T: class>(AObject: T):boolean;
      class function GetAll<T: class>(AObject: T): TDataSet;
  end;


implementation

class function TGenericDAO.GetTableName<T>(Obj: T): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo: TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
    if Atributo is TableName then
      Exit(TableName(Atributo).Name);
  end;
end;


//funções para manipular as entidades
class function TGenericDAO.Insert<T>(AObject: T):boolean;
var
  LContexto:                 TRttiContext;
  LTypeObject:               TRttiType;
  LProperty:                 TRttiProperty;
  LInsert, LFields, LValues: String;
  LAtributo:                 TCustomAttribute;

begin
  LInsert := '';
  LFields := '';
  LValues := '';

  LInsert := 'INSERT INTO ' + GetTableName(AObject);

  LContexto   := TRttiContext.Create;
  LTypeObject := LContexto.GetType(TObject(AObject).ClassInfo);

  for LProperty in LTypeObject.GetProperties do
  begin
    for LAtributo in LProperty.GetAttributes do
    begin
      if LAtributo is FieldName then
      begin
        LFields := LFields + FieldName(LAtributo).Name  + ',';
        case LProperty.GetValue(TObject(AObject)).Kind of
          tkWChar, tkLString, tkWString, tkString, tkChar, tkUString:
            LValues := LValues +
                       QuotedStr(LProperty.GetValue(TObject(AObject)).AsString) + ',';

          tkInteger, tkInt64:
            LValues := LValues +
                       IntToStr(LProperty.GetValue(TObject(AObject)).AsInteger) + ',';

          tkFloat:
            LValues := LValues +
                       FloatToStr(LProperty.GetValue(TObject(AObject)).AsExtended) + ',';
          else
            raise Exception.Create('Tipo não suportado');
          end;
       end;
     end;
  end;
  LFields := Copy(LFields, 1, Length(LFields) - 1);
  LValues := Copy(LValues, 1, Length(LValues) - 1);
  LInsert := LInsert + ' ( ' + LFields + ' )  VALUES ( ' + LValues + ' )';

  Result := DSServerModuleBaseDados.execSql(LInsert);
end;


class function TGenericDAO.GetAll<T>(AObject: T): TDataSet;
begin
  Result :=
    DSServerModuleBaseDados.getDataSet('SELECT T1.* FROM ' + GetTableName(AObject) + ' T1' );
end;


end.
