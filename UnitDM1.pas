unit UnitDM1;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Forms;

type
  TDM1 = class(TDataModule)
    FDConnection1: TFDConnection;
    tbAgendamentos: TFDTable;
    tbAgendamentoshorario: TSQLTimeStampField;
    tbAgendamentossegunda: TBooleanField;
    tbAgendamentosterca: TBooleanField;
    tbAgendamentosquarta: TBooleanField;
    tbAgendamentosquinta: TBooleanField;
    tbAgendamentossexta: TBooleanField;
    tbAgendamentossabado: TBooleanField;
    tbAgendamentosdomingo: TBooleanField;
    tbAgendamentosarquivo: TWideStringField;
    tbAgendamentosfrase: TWideStringField;
    tbAgendamentosseg: TStringField;
    tbAgendamentoster: TStringField;
    tbAgendamentosqua: TStringField;
    tbAgendamentosqui: TStringField;
    tbAgendamentossex: TStringField;
    tbAgendamentossab: TStringField;
    tbAgendamentosdom: TStringField;
    tbAgendamentosid: TFDAutoIncField;
    qryAgendamentos: TFDQuery;
    procedure tbAgendamentosNewRecord(DataSet: TDataSet);
    procedure tbAgendamentosCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM1: TDM1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM1.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Connected := False;
  FDConnection1.Params.Database := ExpandFileName(ExtractFileDir(Application.ExeName)) + '\Som.accdb';
  FDConnection1.Connected := True;
  tbAgendamentos.Open;
end;

procedure TDM1.tbAgendamentosCalcFields(DataSet: TDataSet);
begin
  if tbAgendamentos.FieldByName('segunda').AsBoolean = True then
    tbAgendamentos.FieldByName('seg').AsString := 'S'
  else
    tbAgendamentos.FieldByName('seg').AsString := '';

  if tbAgendamentos.FieldByName('terca').AsBoolean = True then
    tbAgendamentos.FieldByName('ter').AsString := 'S'
  else
    tbAgendamentos.FieldByName('ter').AsString := '';

  if tbAgendamentos.FieldByName('quarta').AsBoolean = True then
    tbAgendamentos.FieldByName('qua').AsString := 'S'
  else
    tbAgendamentos.FieldByName('qua').AsString := '';

  if tbAgendamentos.FieldByName('quinta').AsBoolean = True then
    tbAgendamentos.FieldByName('qui').AsString := 'S'
  else
    tbAgendamentos.FieldByName('qui').AsString := '';

  if tbAgendamentos.FieldByName('sexta').AsBoolean = True then
    tbAgendamentos.FieldByName('sex').AsString := 'S'
  else
    tbAgendamentos.FieldByName('sex').AsString := '';

  if tbAgendamentos.FieldByName('sabado').AsBoolean = True then
    tbAgendamentos.FieldByName('sab').AsString := 'S'
  else
    tbAgendamentos.FieldByName('sab').AsString := '';

  if tbAgendamentos.FieldByName('domingo').AsBoolean = True then
    tbAgendamentos.FieldByName('dom').AsString := 'S'
  else
    tbAgendamentos.FieldByName('dom').AsString := '';
end;

procedure TDM1.tbAgendamentosNewRecord(DataSet: TDataSet);
begin
  tbAgendamentos.FieldByName('horario').AsDateTime := 0;
  tbAgendamentos.FieldByName('segunda').AsBoolean := False;
  tbAgendamentos.FieldByName('terca').AsBoolean := False;
  tbAgendamentos.FieldByName('quarta').AsBoolean := False;
  tbAgendamentos.FieldByName('quinta').AsBoolean := False;
  tbAgendamentos.FieldByName('sexta').AsBoolean := False;
  tbAgendamentos.FieldByName('sabado').AsBoolean := False;
  tbAgendamentos.FieldByName('domingo').AsBoolean := False;
end;

end.
