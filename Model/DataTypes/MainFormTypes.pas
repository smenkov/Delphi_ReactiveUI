Unit MainFormTypes;

Interface

Uses 
SysUtils, Classes;

Type
  TString = Class(TObject)
    Private 
      fStr: String;
    Public 
      constructor Create(Const AStr: String) ;
      property Str: String read FStr write FStr;
  End;
  ////////////////////////////////
  TarrayOfReal = array of Real;
  ////////////////////////////////
  TMainFormArrayDto = Class(TObject)
    Private
      { Private declarations }
      mB, mC, mDivElem : Real;
      mNx : Integer; 
    Published
      { RTTI declarations }
      property B : Real read mB write mB;
      property C : Real read mC write mC;
      property Nx : Integer read mNx write mNx;
      property DivElem : Real read mDivElem write mDivElem;
    Public
      { Public declarations }
      X : TarrayOfReal;
      Y : TarrayOfReal;
  End;
  ////////////////////////////////
  TDataValidState = Class(TObject)
    Private
      { Private declarations }
      mData : TObject;
    Published
      { RTTI declarations }
      property Data : TObject read mData;
      constructor Create(Data : TObject);
    Public 
      { Public declarations }
  End;
  ////////////////////////////////
  TDataErrorState = Class(TObject)
    Private
      { Private declarations }
      mErrorMessage : String;
      mData : TObject;
    Published
      { RTTI declarations }
      property ErrorMessage : String read mErrorMessage;
      property Data : TObject read mData;
    Public
      { Public declarations }
      constructor Create(ErrorMessage : String); overload;
      constructor Create(ErrorMessage : String; Data : TObject); overload;
  End;

Implementation


constructor TString.Create(Const AStr: String);
Begin
  inherited Create;
  FStr := AStr;
End;

constructor TDataValidState.Create(Data : TObject);
begin
  mData := Data;
end;

constructor TDataErrorState.Create(ErrorMessage : String);
begin
  mErrorMessage := ErrorMessage;
end;

constructor TDataErrorState.Create(ErrorMessage : String; Data : TObject);
begin
  mData := Data;
  mErrorMessage := ErrorMessage;
end;


end.