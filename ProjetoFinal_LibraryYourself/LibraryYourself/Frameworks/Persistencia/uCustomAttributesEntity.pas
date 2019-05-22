unit uCustomAttributesEntity;

interface

type
  TableName = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;

    constructor Create(AName: String);
  end;

type
  KeyField = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;

    constructor Create(AName: String);
  end;

type
  FieldName = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;

    constructor Create(AName: String);
  end;

type
  ForeignKey = class(TCustomAttribute)
  private
    FName: String;
    FReferenceFieldName: String;
    FReferenceTableName: String;
    procedure SetName(const Value: String);
    procedure SetReferenceFieldName(const Value: String);
    procedure SetReferenceTableName(const Value: String);
  public
    property Name: String read FName write SetName;
    property ReferenceFieldName: String read FReferenceFieldName write SetReferenceFieldName;
    property ReferenceTableName: String read FReferenceTableName write SetReferenceTableName;
    constructor Create(AName, AReferenceFieldName, AReferenceTableName: String);
  end;

implementation

constructor TableName.Create(AName: String);
begin
  FName := AName
end;

constructor KeyField.Create(AName: String);
begin
  FName := AName;
end;

constructor FieldName.Create(AName: String);
begin
  FName    := AName;
end;

{ ForeignKey }

constructor ForeignKey.Create(AName, AReferenceFieldName,
  AReferenceTableName: String);
begin
  FName               := AName;
  FReferenceFieldName := AReferenceFieldName;
  FReferenceTableName := AReferenceTableName;
end;

procedure ForeignKey.SetName(const Value: String);
begin
  FName := Value;
end;

procedure ForeignKey.SetReferenceFieldName(const Value: String);
begin
  FReferenceFieldName := Value;
end;

procedure ForeignKey.SetReferenceTableName(const Value: String);
begin
  FReferenceTableName := Value;
end;

end.
