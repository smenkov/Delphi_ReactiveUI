Unit MainFormFragment;

Interface

Uses 
Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
Dialogs, StdCtrls, ExtCtrls, Grids, LiveData, MainFormViewModel, MainFormTypes;

Type
  TViewStatesObserver = Class(TInterfacedObject, TIObserver)
    Private
      { Private declarations }
    Public 
      { Public declarations }
      procedure Update(ChangedSubject: TObject); //override;
  End;
  ////////////////////////////////
  TViewActionsObserver = Class(TInterfacedObject, TIObserver)
    Private
      { Private declarations }
    Public 
      { Public declarations }
      procedure Update(ChangedSubject: TObject); //override;
  End;
  ////////////////////////////////
  TMainForm = Class(TForm)
    SetupPanel: TPanel;
    InputPanel: TPanel;
    ResultPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StartInputBtn: TButton;
    EditInputBtn: TButton;
    SubmitInputBtn: TButton;
    Label4: TLabel;
    ScalarValueEt: TEdit;
    ClearAllBtn: TButton;
    InputGrid: TStringGrid;
    ResultGrid: TStringGrid;
    LengthEt: TEdit;
    BEt: TEdit;
    CEt: TEdit;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    InputSidePanel: TPanel;
    ResultSidePanel: TPanel;
    //Procedure ApplyUiState(NewUiState: TUiState);
    Procedure StartInputBtnClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure SubmitInputBtnClick(Sender: TObject);
    Procedure EditInputBtnClick(Sender: TObject);
    Procedure ClearAllBtnClick(Sender: TObject);
    Private 
      { Private declarations }
    Public 
      ViewModel: TMainFormViewModel;
      ViewStatesObserver: TIObserver;
      ViewActionsObserver: TIObserver;
      { Public declarations }
  End;

Var
  MainForm: TMainForm;
  
Implementation

{$R *.dfm}




// INIT UI FRAGMENT //


// Initial onDisplay form method
Procedure TMainForm.FormShow(Sender: TObject);
Begin
  // Init view models for current form
  ViewModel := TMainFormViewModel.Create('MainFormViewModel');
  // Init LiveData observers
  ViewStatesObserver := TViewStatesObserver.Create;
  ViewActionsObserver := TViewActionsObserver.Create;
  // Subscribe on LiveData fields from view models
  (ViewModel.ViewStatesLiveData as TObservable).Add(ViewStatesObserver);
  (ViewModel.ViewActionsLiveData as TObservable).Add(ViewActionsObserver);
  //ViewModel.TestLiveData.SetValue(TString.Create('New Data'));
End;






// OBSERVATION PROCEDURES //


// ReactiveUI callback procedure
Procedure TViewStatesObserver.Update(ChangedSubject : TObject);
Var
  i: Integer;
Begin
  if ChangedSubject is TMainFormUIState Then begin
    With ChangedSubject as TMainFormUIState do begin
      if State = InputParamState Then begin
          ///// Reset to initial state
          With MainForm do begin
              SetupPanel.Visible:=True;
              LengthEt.Enabled:=True;
              BEt.Enabled:=True;
              CEt.Enabled:=True;
              StartInputBtn.Enabled:=True;

              if Data = nil Then begin 
                LengthEt.Text:='';
                BEt.Text:='';
                CEt.Text:='';
              end else if Data is TMainFormArrayDto Then begin
                With Data as TMainFormArrayDto do begin
                  LengthEt.Text:=floattostr(Nx);
                  BEt.Text:=floattostr(B);
                  CEt.Text:=floattostr(C);
                end;
              end;
              LengthEt.SetFocus;
              
              InputPanel.Visible:=False;
              ResultPanel.Visible:=False;
              Height:=SetupPanel.Height + 46;
          end;
          /////
      end else if State = InputArrayState Then begin
        if Data is TMainFormArrayDto Then begin
          With Data as TMainFormArrayDto do begin
          ///// Wait for X array input
            With MainForm do begin
              InputPanel.Visible:=True;
              InputGrid.Options:=InputGrid.Options+[goEditing];
              EditInputBtn.Enabled:=True;
              SubmitInputBtn.Enabled:=True;
              Height:=SetupPanel.Height + Splitter3.MinSize + 46;
              InputGrid.ColCount:= Nx;
              for i:=0 to Nx-1 do begin
                InputGrid.Cells[i,0]:='x('+floattostr(i)+')';
                InputGrid.Cells[i,1]:='';
              end;

              LengthEt.Enabled:=False;
              BEt.Enabled:=False;
              CEt.Enabled:=False;
              StartInputBtn.Enabled:=False;
            end;
          /////
          end;
        end;
      end else if State = ShowResultState Then begin
        if Data is TMainFormArrayDto Then begin
          With Data as TMainFormArrayDto do begin
          ///// Show calculated results
            With MainForm do begin
              ResultPanel.Visible:=True;
              Height:=SetupPanel.Height + InputPanel.Height + Splitter3.MinSize + 60;
              ResultGrid.ColCount:=length(Y);
              for i:=0 to high (Y) do begin
                ResultGrid.Cells[i,0]:='y('+floattostr(i)+')';
                ResultGrid.Cells[i,1]:=floattostr(Y[i]);
              end;

              EditInputBtn.Enabled:=False;
              SubmitInputBtn.Enabled:=False;
              InputGrid.Options:=InputGrid.Options-[goEditing];
            end;
          /////
          end;
        end;
      end else ShowMessage('Invalid State Type!!!');
    end;
  end else ShowMessage('Invalid ChangedSubject Type!!!');
End;

// ReactiveUI callback procedure
Procedure TViewActionsObserver.Update(ChangedSubject : TObject);
Begin
  if ChangedSubject is TDataValidState Then begin

  end else if ChangedSubject is TDataErrorState Then begin
    ShowMessage('Error State!');
    ShowMessage('msg: '+ (ChangedSubject as TDataErrorState).ErrorMessage);
  end else ShowMessage('Invalid Message State Type!!!');
End;







// EVENT TRIGGERS //


// Handle start input button click
Procedure TMainForm.StartInputBtnClick(Sender: TObject);
Begin
  ViewModel.SubmitParamsInput(StrToInt(LengthEt.Text), StrToFloat(BEt.Text), StrToFloat(CEt.Text));
End;


// Handle submit input array button click
Procedure TMainForm.SubmitInputBtnClick(Sender: TObject);
var
  InputArray: TArrayOfReal;
  i: Integer;
Begin
  SetLength(InputArray, InputGrid.ColCount);
  for i:=0 to high (InputArray) do
    InputArray[i] := strtofloat(InputGrid.Cells[i,1]);
  ViewModel.Calculate(InputArray);
End;


// Handle edit initial data button click
Procedure TMainForm.EditInputBtnClick(Sender: TObject);
Begin
  ViewModel.EditInputParams();
End;


//Handle clearAll button click
Procedure TMainForm.ClearAllBtnClick(Sender: TObject);
Begin
  ViewModel.ClearAll();
End;














// Additional procedures
Procedure Delay (dwMilliseconds: Longint);
Var 
  iStart, iStop: DWORD;
Begin
  iStart := GetTickCount;
  Repeat
    iStop := GetTickCount;
    Sleep(1);
    Application.ProcessMessages;
  Until (iStop - iStart) >= dwMilliseconds;
End;

// UI state change reaction
(*Procedure TMainForm.ApplyUiState(NewUiState: TUiState);
Var 
  optHeight: Integer;
Begin
  UiState := NewUiState;
  InputPanel.Visible := False;
  ResultPanel.Visible := False;

  If UiState = InitialState Then
    Begin
      MainForm.ClientHeight := 100;
      ShowMessage(ViewModel.Tag);
    End
  Else If UiState = InputState Then
         Begin
           InputPanel.Visible := True;
           MainForm.ClientHeight := SetupPanel.Height + (InputGrid.RowCount+1) *
                                    InputGrid.DefaultRowHeight;
           ShowMessage('InputState OK');
         End
  Else
    Begin
      InputPanel.Visible := True;
      ResultPanel.Visible := True;
      optHeight := (ResultGrid.RowCount+1) * ResultGrid.DefaultRowHeight;
      If optHeight < ResultSidePanel.Constraints.MinHeight Then
        optHeight := ResultSidePanel.Constraints.MinHeight;
      MainForm.ClientHeight := SetupPanel.Height + InputPanel.Height + optHeight;
      ResultPanel.Height := optHeight;
      ShowMessage('ResultState OK');
    End;
End;*)

End.
