object Form1: TForm1
  Left = 208
  Top = 146
  Width = 1305
  Height = 675
  ActiveControl = dbgrd1
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 632
    Top = 48
    Width = 497
    Height = 217
    DataSource = ds1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=kn;Data Source=DUKE-PC\DUKE'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 56
  end
  object tbl1: TADOTable
    Active = True
    Connection = con1
    CursorType = ctStatic
    TableName = 'books'
    Left = 96
    Top = 136
  end
  object ds1: TDataSource
    DataSet = tbl1
    Left = 32
    Top = 272
  end
end
