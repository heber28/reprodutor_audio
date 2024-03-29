object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Reprodutor de Som'
  ClientHeight = 529
  ClientWidth = 977
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LabelHora: TLabel
      Left = 288
      Top = 16
      Width = 42
      Height = 19
      Caption = '00:00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BtnNovo: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = BtnNovoClick
    end
    object BtnEditar: TButton
      Left = 105
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TButton
      Left = 186
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 55
    Width = 977
    Height = 474
    Align = alClient
    DataSource = FormAgendamento.dsAgendamentos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'horario'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seg'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ter'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qua'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qui'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sab'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dom'
        Width = 20
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'arquivo'
        Width = 365
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'frase'
        Width = 365
        Visible = True
      end>
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 352
    Top = 8
  end
  object SpVoice1: TSpVoice
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 400
    Top = 8
  end
end
