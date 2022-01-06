object FormAgendamento: TFormAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendamento'
  ClientHeight = 233
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LabelHorario: TLabel
    Left = 11
    Top = 34
    Width = 35
    Height = 13
    Caption = 'Hor'#225'rio'
  end
  object Label2: TLabel
    Left = 11
    Top = 88
    Width = 68
    Height = 13
    Caption = 'Arquivo Wave'
  end
  object Label3: TLabel
    Left = 11
    Top = 115
    Width = 27
    Height = 13
    Caption = 'Frase'
  end
  object LabelAviso: TLabel
    Left = 87
    Top = 157
    Width = 514
    Height = 13
    Caption = 
      'Caso n'#227'o selecione o Arquivo, o wave n'#227'o ser'#225' tocado. Se n'#227'o pre' +
      'encher a Frase, a frase n'#227'o ser'#225' falada'
  end
  object Label4: TLabel
    Left = 87
    Top = 189
    Width = 391
    Height = 13
    Caption = 
      'Caso a pron'#250'ncia da frase fique r'#225'pida demais, use v'#237'rgulas para' +
      ' dar mais pausas'
  end
  object DBCheckBoxSegunda: TDBCheckBox
    Left = 87
    Top = 62
    Width = 63
    Height = 17
    Caption = 'Segunda'
    DataField = 'segunda'
    DataSource = dsAgendamentos
    TabOrder = 1
  end
  object DBCheckBoxTerca: TDBCheckBox
    Left = 164
    Top = 62
    Width = 47
    Height = 17
    Caption = 'Ter'#231'a'
    DataField = 'terca'
    DataSource = dsAgendamentos
    TabOrder = 2
  end
  object DBCheckBoxQuarta: TDBCheckBox
    Left = 241
    Top = 62
    Width = 55
    Height = 17
    Caption = 'Quarta'
    DataField = 'quarta'
    DataSource = dsAgendamentos
    TabOrder = 3
  end
  object DBCheckBoxQuinta: TDBCheckBox
    Left = 318
    Top = 62
    Width = 47
    Height = 17
    Caption = 'Quinta'
    DataField = 'quinta'
    DataSource = dsAgendamentos
    TabOrder = 4
  end
  object DBCheckBoxSexta: TDBCheckBox
    Left = 395
    Top = 62
    Width = 47
    Height = 17
    Caption = 'Sexta'
    DataField = 'sexta'
    DataSource = dsAgendamentos
    TabOrder = 5
  end
  object DBCheckBoxSabado: TDBCheckBox
    Left = 472
    Top = 62
    Width = 55
    Height = 17
    Caption = 'S'#225'bado'
    DataField = 'sabado'
    DataSource = dsAgendamentos
    TabOrder = 6
  end
  object DBCheckBoxDomingo: TDBCheckBox
    Left = 550
    Top = 62
    Width = 60
    Height = 17
    Caption = 'Domingo'
    DataField = 'domingo'
    DataSource = dsAgendamentos
    TabOrder = 7
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 85
    Width = 518
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'arquivo'
    DataSource = dsAgendamentos
    ReadOnly = True
    TabOrder = 8
  end
  object DBEditFrase: TDBEdit
    Left = 87
    Top = 112
    Width = 518
    Height = 21
    DataField = 'frase'
    DataSource = dsAgendamentos
    TabOrder = 10
  end
  object BtnEscolher: TButton
    Left = 614
    Top = 83
    Width = 73
    Height = 25
    Caption = 'Escolher'
    TabOrder = 9
    OnClick = BtnEscolherClick
  end
  object BtnSalvar: TButton
    Left = 720
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 11
    OnClick = BtnSalvarClick
  end
  object BtnCancelar: TButton
    Left = 720
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 12
    OnClick = BtnCancelarClick
  end
  object TimePicker1: TTimePicker
    Left = 87
    Top = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
    Time = 44563.648896296300000000
    TimeFormat = 'hh:mm'
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Wave|*.wav'
    Left = 624
    Top = 125
  end
  object dsAgendamentos: TDataSource
    DataSet = DM1.tbAgendamentos
    Left = 704
    Top = 125
  end
end
