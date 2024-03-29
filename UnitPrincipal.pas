unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.OleServer, SpeechLib_TLB, MMSystem, ShellApi, DateUtils;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnExcluir: TButton;
    LabelHora: TLabel;
    Timer1: TTimer;
    SpVoice1: TSpVoice;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure Silenciar;
    procedure Tocar;
    procedure TocarWave(arquivo: string);
    procedure Narrar(frase: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;
  MyMsg: LongInt;
  OldWindowProc: Pointer;
  function NewWindowProc(WH: hWnd; Msg, PW, PL: LongInt): LongInt stdcall;

implementation

{$R *.dfm}

uses UnitDM1, UnitAgendamento;

function NewWindowProc(WH: hWnd; Msg, PW, PL: LongInt): LongInt stdcall;
begin
  if Msg = MyMsg then
  begin
    SendMessage(Application.Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
    SetForegroundWindow(Application.Handle);
    Result := 0;
    exit;
  end;
  Result := CallWindowProc(OldWindowProc, WH, Msg, PW, PL);
end;

{ TFormPrincipal }

procedure TFormPrincipal.BtnEditarClick(Sender: TObject);
begin
  if DM1.tbAgendamentos.IsEmpty = False then
    FormAgendamento.ShowModal;
end;

procedure TFormPrincipal.BtnExcluirClick(Sender: TObject);
begin
if DM1.tbAgendamentos.IsEmpty = False then
  if (MessageBox(0, PChar('Tem certeza que deseja excluir esse registro?'), PChar('Aten��o'), MB_ICONWARNING or MB_YESNO or MB_TOPMOST or MB_SYSTEMMODAL or MB_DEFBUTTON2) = mrYes) then
    DM1.tbAgendamentos.Delete;
end;

procedure TFormPrincipal.BtnNovoClick(Sender: TObject);
begin
  DM1.tbAgendamentos.Append;
  FormAgendamento.ShowModal;
end;

procedure TFormPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  if DM1.tbAgendamentos.IsEmpty = False then
    FormAgendamento.ShowModal;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
var segundos: smallint;
begin
  MyMsg := RegisterWindowMessage('X11APP');
  OldWindowProc := Pointer(SetWindowLong(Handle, GWL_WNDPROC,
  LongInt(@NewWindowProc)));
  LabelHora.Caption := FormatDateTime('hh:nn', Now);
  Timer1.Enabled := False;
  segundos := 60 - strtoint(FormatDateTime('ss', Now));
  Timer1.Interval := segundos * 1000;
  Timer1.Enabled := True;
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_WNDPROC, LongInt(OldWindowProc));
end;

procedure TFormPrincipal.Narrar(frase: string);
const
  SVSFDefault = 0;
  SVSFlagsAsync = 0;
  SVSFPurgeBeforeSpeak = 2;
begin
  SpVoice1.Speak(frase, SVSFlagsAsync {or SVSFPurgeBeforeSpeak});
end;


procedure TFormPrincipal.Silenciar;
var
  sCmd, s: string;
begin
  s := ExpandFileName(ExtractFileDir(Application.ExeName)) + '\SoundVolumeView.exe';
  sCmd := Pwidechar(' /mute "Chrome.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /mute "Firefox.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /mute "Edge.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /mute "Opera.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /mute "Spotify.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /mute "wmplayer.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
var segundos: smallint;
  function SqlDoDiaDaSemana: string;
  begin
    case DayOfTheWeek(Now) of
      1: Result := 'and segunda = TRUE';
      2: Result := 'and terca = TRUE';
      3: Result := 'and quarta = TRUE';
      4: Result := 'and quinta = TRUE';
      5: Result := 'and sexta = TRUE';
      6: Result := 'and sabado = TRUE';
      7: Result := 'and domingo = TRUE';
    end;
  end;
begin
  LabelHora.Caption := FormatDateTime('hh:nn', Now);
  Timer1.Enabled := False;
  DM1.qryAgendamentos.Close;
  DM1.qryAgendamentos.SQL[2] := SqlDoDiaDaSemana;
  DM1.qryAgendamentos.ParamByName('horario').AsTime := TimeOf(Now);
  DM1.qryAgendamentos.Open;
  while DM1.qryAgendamentos.Eof = False do
  begin
    if DM1.qryAgendamentos.FieldByName('arquivo').AsString <> '' then
    begin
      Silenciar;
      TocarWave(DM1.qryAgendamentos.FieldByName('arquivo').AsString);
      Sleep(250);
    end;
    if DM1.qryAgendamentos.FieldByName('frase').AsString <> '' then
    begin
      Silenciar;
      Narrar(DM1.qryAgendamentos.FieldByName('frase').AsString);
    end;
    Tocar;
    DM1.qryAgendamentos.Next;
  end;
  segundos := 60 - strtoint(FormatDateTime('ss', Now));
  Timer1.Interval := segundos * 1000;
  Timer1.Enabled := True;
end;

procedure TFormPrincipal.Tocar;
var
  sCmd, s: string;
begin
  s := ExpandFileName(ExtractFileDir(Application.ExeName)) + '\SoundVolumeView.exe';
  sCmd := Pwidechar(' /unmute "chrome.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /unmute "firefox.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /unmute "edge.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /unmute "opera.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /unmute "spotify.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
  sCmd := Pwidechar(' /unmute "wmplayer.exe"');
  ShellExecute(application.handle, 'open', Pwidechar(s), PChar(sCmd), nil, SW_MAXIMIZE);
end;

procedure TFormPrincipal.TocarWave(arquivo: string);
begin
  if FileExists(arquivo) then
    SndPlaySound(PWideChar(arquivo), SND_NODEFAULT or SND_SYNC);
end;

end.
