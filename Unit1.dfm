object Form1: TForm1
  Left = 335
  Top = 175
  Width = 411
  Height = 563
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 24
    Top = 24
    Width = 345
    Height = 417
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 150
    Top = 474
    Width = 117
    Height = 20
    Caption = 'STOP TIMER'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ftp: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 296
    Top = 16
  end
  object Timer_FTP: TTimer
    Interval = 20000
    OnTimer = Timer_FTPTimer
    Left = 256
    Top = 16
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'mvk1:F:\Base\azovstal\AZOVSTAL_WM.GDB'
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=crjhjktnj'
      'lc_ctype=win1251'
      'no_garbage_collect 1')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 56
    Top = 120
  end
  object Timer_BD: TTimer
    Interval = 5000
    OnTimer = Timer_BDTimer
    Left = 56
    Top = 72
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 112
    Top = 120
  end
  object NS3P_500: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NS3P_500_VOL ('
      'ID, '
      '"TIME", '
      'VOLUME, '
      'PRESURE, '
      'SPEED) '
      'VALUES ('
      'NULL,'
      ':DT , '
      ':p623,'
      ':p621, '
      ':p622)')
    Transaction = IBTransaction1
    Left = 112
    Top = 168
  end
  object NS3P_600: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NS3P_600_VOL ('
      'ID, '
      '"TIME", '
      'VOLUME, '
      'PRESURE, '
      'SPEED) '
      'VALUES ('
      'NULL,'
      ':DT , '
      ':p625,'
      ':p1067, '
      ':p624)')
    Transaction = IBTransaction1
    Left = 112
    Top = 216
  end
  object NS2P_500: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NS2P_500_VOL ('
      'ID, '
      '"TIME", '
      'VOLUME, '
      'PRESURE, '
      'SPEED) '
      'VALUES ('
      'NULL,'
      ':DT , '
      ':p229,'
      'NULL, '
      ':p228)')
    Transaction = IBTransaction1
    Left = 112
    Top = 264
  end
  object NS2P_600: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO NS2P_600_VOL ('
      'ID, '
      '"TIME", '
      'VOLUME, '
      'PRESURE, '
      'SPEED) '
      'VALUES ('
      'NULL,'
      ':DT , '
      ':p231,'
      'NULL, '
      ':p230)')
    Transaction = IBTransaction1
    Left = 112
    Top = 312
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    AutoStopAction = saNone
    Left = 176
    Top = 120
  end
  object ins_r500: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'execute procedure ins_rashod_500;')
    Transaction = IBTransaction2
    Left = 176
    Top = 168
  end
  object ins_r600: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'execute procedure ins_rashod_600;')
    Transaction = IBTransaction2
    Left = 176
    Top = 216
  end
  object upd_r500: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'execute procedure upd_rashod_500;')
    Transaction = IBTransaction2
    Left = 176
    Top = 264
  end
  object upd_r600: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'execute procedure upd_rashod_600;')
    Transaction = IBTransaction2
    Left = 176
    Top = 312
  end
end
