object Form7: TForm7
  Left = 919
  Top = 354
  Width = 272
  Height = 262
  BorderIcons = [biSystemMenu]
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  Color = clBtnFace
  Constraints.MaxHeight = 362
  Constraints.MaxWidth = 372
  Constraints.MinHeight = 262
  Constraints.MinWidth = 272
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 133
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096' '#1083#1086#1075#1080#1085':'
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 143
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1074#1072#1096' '#1087#1072#1088#1086#1083#1100':'
  end
  object lbl1: TLabel
    Left = 40
    Top = 120
    Width = 171
    Height = 16
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100' '#1077#1097#1077' '#1088#1072#1079':'
  end
  object edt1: TEdit
    Left = 40
    Top = 48
    Width = 177
    Height = 24
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 40
    Top = 96
    Width = 177
    Height = 24
    PasswordChar = '*'
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 40
    Top = 144
    Width = 177
    Height = 24
    PasswordChar = '*'
    TabOrder = 2
  end
  object dbedt1: TDBEdit
    Left = 80
    Top = 232
    Width = 121
    Height = 24
    DataField = #1048#1084#1103
    DataSource = Form5.ds1
    TabOrder = 3
    Visible = False
  end
  object dbedt2: TDBEdit
    Left = 80
    Top = 272
    Width = 121
    Height = 24
    DataField = #1055#1072#1088#1086#1083#1100
    DataSource = Form5.ds1
    TabOrder = 4
    Visible = False
  end
  object btn1: TButton
    Left = 72
    Top = 176
    Width = 113
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 5
    OnClick = btn1Click
  end
end
