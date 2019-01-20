object Form5: TForm5
  Left = 698
  Top = 356
  Width = 221
  Height = 277
  BorderIcons = [biSystemMenu]
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 102
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 88
    Width = 112
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 64
    Top = 144
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 40
    Top = 56
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 40
    Top = 112
    Width = 129
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    OnKeyDown = Edit2KeyDown
  end
  object Button2: TButton
    Left = 52
    Top = 184
    Width = 97
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080)
    Left = 104
    Top = 240
  end
  object ADOTable1: TADOTable
    Connection = Form1.ADOConnection1
    Left = 160
    Top = 240
  end
  object ds1: TDataSource
    DataSet = ADOQuery1
    Left = 104
    Top = 296
  end
end
