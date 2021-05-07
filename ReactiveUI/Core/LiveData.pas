Unit LiveData;

Interface

Uses 
SysUtils, Classes, Dialogs;

Type
  // Observer definition
  TIObserver = interface
    ['{B7F6F015-88A6-47AC-9176-87B6E313962D}'] //GUID
    procedure Update(ChangedSubject: TObject);
  end;

  // Observable definition
  TObservable = class(TObject)
    procedure Add(Observer: TIObserver); virtual; abstract;
    procedure Remove(Observer: TIObserver); virtual; abstract;
    procedure Notify; virtual; abstract;
  end;

  // Define LiveData class
  TLiveData = Class(TObservable)
    Private
      { Private declarations } 
      mValue : TObject;
      mTag : String;
      mObservers : TInterfaceList;
    Published
      { RTTI declarations }
      // LiveData properties
      property Tag : String read mTag;
      // LiveData functions
      Procedure SetValue(Value : TObject);
      Function GetValue() : TObject;
      // LiveData constructor
      constructor Create(Tag : String);  
    Public 
      { Public declarations }
      procedure Notify; override;
      procedure Add(Observer: TIObserver); override;
      procedure Remove(Observer: TIObserver); override;
  End;

Implementation

constructor TLiveData.Create(Tag : String);
begin inherited Create;
  mObservers := TInterfaceList.Create;
  mTag := Tag;
end;

procedure TLiveData.Notify;
var
  i: Integer;
begin
  for i:= 0 to pred(mObservers.Count) do
    TIObserver(mObservers.Items[i]).Update(Self.mValue);
end;

Procedure TLiveData.Add(Observer: TIObserver);
Begin
  mObservers.Add(Observer);
  Observer.Update(Self.mValue);
End;

Procedure TLiveData.Remove(Observer: TIObserver);
Begin
  mObservers.Remove(Observer);
End;

Function TLiveData.GetValue : TObject;
Begin
  Result := mValue;
End;

Procedure TLiveData.SetValue(Value : TObject);
Begin
  If Value <> Nil Then Begin
    self.mValue := Value;
    self.Notify;
  End;
End;

End.
