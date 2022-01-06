unit UnitAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Sic, Vcl.WinXPickers, DateUtils;

type
  TFormAgendamento = class(TForm)
    LabelHorario: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBCheckBoxSegunda: TDBCheckBox;
    DBCheckBoxTerca: TDBCheckBox;
    DBCheckBoxQuarta: TDBCheckBox;
    DBCheckBoxQuinta: TDBCheckBox;
    DBCheckBoxSexta: TDBCheckBox;
    DBCheckBoxSabado: TDBCheckBox;
    DBCheckBoxDomingo: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBEditFrase: TDBEdit;
    BtnEscolher: TButton;
    OpenDialog1: TOpenDialog;
    LabelAviso: TLabel;
    Label4: TLabel;
    dsAgendamentos: TDataSource;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    TimePicker1: TTimePicker;
    procedure tbAgendamentosAfterOpen(DataSet: TDataSet);
    procedure BtnEscolherClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgendamento: TFormAgendamento;

implementation

{$R *.dfm}

uses UnitDM1;

{ TFormSom }

procedure TFormAgendamento.tbAgendamentosAfterOpen(DataSet: TDataSet);
begin
  //FitGrid(DbGrid1);
end;

procedure TFormAgendamento.BtnCancelarClick(Sender: TObject);
begin
  if DM1.tbAgendamentos.State in dsEditModes then
    DM1.tbAgendamentos.Cancel;
  Close;
end;

procedure TFormAgendamento.BtnEscolherClick(Sender: TObject);
var path: string;
begin
  path := ExpandFileName(ExtractFileDir(Application.ExeName)); // Exe folder
  OpenDialog1.InitialDir := path;
  if OpenDialog1.Execute then
  begin
    if DM1.tbAgendamentos.State in dsEditModes = False then
      DM1.tbAgendamentos.Edit;
    DM1.tbAgendamentos.FieldByName('arquivo').AsString := OpenDialog1.FileName;
  end;
end;

procedure TFormAgendamento.BtnSalvarClick(Sender: TObject);
begin
  if DM1.tbAgendamentos.State in dsEditModes = False then
    DM1.tbAgendamentos.Edit;
  DM1.tbAgendamentos.FieldByName('horario').AsDateTime := TimePicker1.Time;
  DM1.tbAgendamentos.Post;
  Close;
end;

procedure TFormAgendamento.FormActivate(Sender: TObject);
begin
  TimePicker1.Time := TimeOf(DM1.tbAgendamentos.FieldByName('horario').AsDateTime);
end;

procedure TFormAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM1.tbAgendamentos.State in dsEditModes then
    DM1.tbAgendamentos.Cancel;
end;

end.
