object Form3: TForm3
  Left = 660
  Top = 395
  Width = 328
  Height = 185
  BorderIcons = [biSystemMenu]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1078#1072#1085#1088#1072
  Color = clBtnFace
  Constraints.MaxHeight = 185
  Constraints.MaxWidth = 328
  Constraints.MinHeight = 185
  Constraints.MinWidth = 328
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 283
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1078#1072#1085#1088#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 40
    Top = 48
    Width = 217
    Height = 29
    Constraints.MaxHeight = 29
    Constraints.MaxWidth = 217
    Constraints.MinHeight = 29
    Constraints.MinWidth = 217
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 152
    Width = 121
    Height = 21
    DataField = #1078#1072#1085#1088
    DataSource = DataSource1
    TabOrder = 1
    Visible = False
  end
  object Button1: TButton
    Left = 80
    Top = 88
    Width = 137
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Constraints.MaxHeight = 33
    Constraints.MaxWidth = 137
    Constraints.MinHeight = 33
    Constraints.MinWidth = 137
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 152
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#1078#1072#1085#1088#1099
      'ORDER BY id')
    Left = 96
    Top = 176
  end
end
