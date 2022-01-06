program Som;

uses
  Vcl.Forms, Windows,
  UnitAgendamento in 'UnitAgendamento.pas' {FormAgendamento},
  UnitDM1 in 'UnitDM1.pas' {DM1: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  CreateMutex(nil, False, 'X11APP');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    SendMessage(HWND_BROADCAST,
    RegisterWindowMessage('X11APP'), 0, 0);
    Halt(0);
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormAgendamento, FormAgendamento);
  Application.Run;
end.
