program UI_app;

uses
  Forms,
  MainFormFragment in 'Forms\MainForm\MainFormFragment.pas' {MainForm},
  LiveData in 'ReactiveUI\Core\LiveData.pas',
  MainFormTypes in 'Model\DataTypes\MainFormTypes.pas',
  MainFormViewModel in 'Forms\MainForm\ViewModels\MainFormViewModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
