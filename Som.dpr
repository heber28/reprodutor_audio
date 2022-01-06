program Som;

uses
  Vcl.Forms,
  UnitAgendamento in 'UnitAgendamento.pas' {FormAgendamento},
  UnitDM1 in 'UnitDM1.pas' {DM1: TDataModule},
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormAgendamento, FormAgendamento);
  Application.Run;
end.
