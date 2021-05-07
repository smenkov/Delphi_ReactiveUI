program UI_app;

uses
  Forms,
  MainFormFragment in '..\MainFormFragment.pas' {MainForm},
  LiveData in '..\..\..\ReactiveUI\Core\LiveData.pas',
  MainFormTypes in '..\..\..\Model\DataTypes\MainFormTypes.pas',
  MainFormViewModel in 'MainFormViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
