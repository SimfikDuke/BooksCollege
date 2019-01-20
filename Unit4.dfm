object Form4: TForm4
  Left = 617
  Top = 384
  Width = 420
  Height = 232
  BorderIcons = [biSystemMenu]
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1082#1085#1080#1075#1080
  Color = clBtnFace
  Constraints.MaxHeight = 260
  Constraints.MaxWidth = 420
  Constraints.MinHeight = 230
  Constraints.MinWidth = 375
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 311
    Height = 23
    Caption = #1042#1099' '#1090#1086#1095#1085#1086' '#1093#1086#1090#1080#1090#1077' '#1091#1076#1072#1083#1080#1090#1100' '#1082#1085#1080#1075#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 64
    Top = 64
    Width = 36
    Height = 23
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 100
    Width = 87
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 168
    Top = 100
    Width = 22
    Height = 16
    Caption = #1096#1090'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 64
    Top = 136
    Width = 91
    Height = 33
    Caption = #1044#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 136
    Width = 91
    Height = 33
    Caption = #1053#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object dbedt1: TDBEdit
    Left = 64
    Top = 208
    Width = 121
    Height = 21
    DataField = #1085#1072#1079#1074#1072#1085#1080#1077
    DataSource = ds1
    TabOrder = 2
    Visible = False
  end
  object dbedt2: TDBEdit
    Left = 64
    Top = 232
    Width = 121
    Height = 21
    DataField = #1078#1072#1085#1088
    DataSource = ds1
    TabOrder = 3
    Visible = False
  end
  object dbedt3: TDBEdit
    Left = 64
    Top = 256
    Width = 121
    Height = 21
    DataField = #1072#1074#1090#1086#1088
    DataSource = ds1
    TabOrder = 4
    Visible = False
  end
  object dbedt4: TDBEdit
    Left = 64
    Top = 280
    Width = 121
    Height = 21
    DataField = #1075#1086#1076
    DataSource = ds1
    TabOrder = 5
    Visible = False
  end
  object dbedt5: TDBEdit
    Left = 64
    Top = 304
    Width = 121
    Height = 21
    DataField = #1086#1073#1098#1077#1084
    DataSource = ds1
    TabOrder = 6
    Visible = False
  end
  object dbedtISBN: TDBEdit
    Left = 200
    Top = 192
    Width = 121
    Height = 21
    DataField = 'ISBN'
    DataSource = ds1
    TabOrder = 7
    Visible = False
  end
  object dbedt7: TDBEdit
    Left = 200
    Top = 216
    Width = 121
    Height = 21
    DataField = #1094#1077#1085#1072
    DataSource = ds1
    TabOrder = 8
    Visible = False
  end
  object dbedt8: TDBEdit
    Left = 200
    Top = 240
    Width = 121
    Height = 21
    DataField = #1076#1072#1090#1072' '#1087#1088#1086#1076#1072#1078#1080
    DataSource = ds1
    TabOrder = 9
    Visible = False
  end
  object dbedt9: TDBEdit
    Left = 200
    Top = 264
    Width = 121
    Height = 21
    DataField = #1087#1088#1086#1076#1072#1074#1077#1094
    DataSource = ds1
    TabOrder = 10
    Visible = False
  end
  object dbedt6: TDBEdit
    Left = 208
    Top = 296
    Width = 121
    Height = 21
    DataField = #1082#1086#1083'-'#1074#1086
    DataSource = ds1
    TabOrder = 11
    Visible = False
  end
  object se1: TSpinEdit
    Left = 112
    Top = 96
    Width = 49
    Height = 22
    MaxValue = 10
    MinValue = 1
    TabOrder = 12
    Value = 1
  end
  object dbedt10: TDBEdit
    Left = 384
    Top = 8
    Width = 121
    Height = 21
    DataField = #1085#1072#1079#1074#1072#1085#1080#1077
    DataSource = Form1.DataSource1
    TabOrder = 13
    Visible = False
  end
  object dbedt11: TDBEdit
    Left = 384
    Top = 24
    Width = 121
    Height = 21
    DataField = #1078#1072#1085#1088
    DataSource = Form1.DataSource1
    TabOrder = 14
    Visible = False
  end
  object dbedt12: TDBEdit
    Left = 384
    Top = 40
    Width = 121
    Height = 21
    DataField = #1072#1074#1090#1086#1088
    DataSource = Form1.DataSource1
    TabOrder = 15
    Visible = False
  end
  object dbedt13: TDBEdit
    Left = 384
    Top = 56
    Width = 121
    Height = 21
    DataField = #1075#1086#1076
    DataSource = Form1.DataSource1
    TabOrder = 16
    Visible = False
  end
  object dbedt14: TDBEdit
    Left = 384
    Top = 72
    Width = 121
    Height = 21
    DataField = #1086#1073#1098#1077#1084
    DataSource = Form1.DataSource1
    TabOrder = 17
    Visible = False
  end
  object dbedtISBN1: TDBEdit
    Left = 384
    Top = 88
    Width = 121
    Height = 21
    DataField = 'ISBN'
    DataSource = Form1.DataSource1
    TabOrder = 18
    Visible = False
  end
  object dbedt16: TDBEdit
    Left = 384
    Top = 104
    Width = 121
    Height = 21
    DataField = #1082#1086#1083'-'#1074#1086
    DataSource = Form1.DataSource1
    TabOrder = 19
    Visible = False
  end
  object dbedt17: TDBEdit
    Left = 384
    Top = 120
    Width = 121
    Height = 21
    DataField = #1094#1077#1085#1072
    DataSource = Form1.DataSource1
    TabOrder = 20
    Visible = False
  end
  object qry1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#1072#1088#1093#1080#1074)
    Left = 8
    Top = 168
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 8
    Top = 216
  end
end
