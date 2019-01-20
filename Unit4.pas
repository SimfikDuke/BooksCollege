unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, start, StdCtrls, DB, Mask, DBCtrls, ADODB, Spin;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    qry1: TADOQuery;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    dbedt3: TDBEdit;
    dbedt4: TDBEdit;
    dbedt5: TDBEdit;
    dbedtISBN: TDBEdit;
    dbedt7: TDBEdit;
    dbedt8: TDBEdit;
    dbedt9: TDBEdit;
    ds1: TDataSource;
    dbedt6: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    se1: TSpinEdit;
    dbedt10: TDBEdit;
    dbedt11: TDBEdit;
    dbedt12: TDBEdit;
    dbedt13: TDBEdit;
    dbedt14: TDBEdit;
    dbedtISBN1: TDBEdit;
    dbedt16: TDBEdit;
    dbedt17: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses
  Unit5;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var id: string;         // �������� ����������
var today : TDateTime;  //
begin
  if Tablizza='�����' then                  // ���� ������� �� ������� "�����", ��:
  begin
  if StrToInt(Form1.ADOQuery1.Fields[7].AsString) = se1.Value then  // ���� ���������� �������� ���� = ������ ���������� ����, ��:
  begin
  id:=Form1.ADOQuery1.Fields[0].AsString;                        //
Form1.ADOQuery1.Active:=False;                                   //
Form1.ADOQuery1.SQL.Text:='select * FROM ����� WHERE id='+id;    //
Form1.ADOQuery1.Active:=True;                                    //
today:= Time;                                                    //
qry1.Insert;                                                     //  ���� �������� ����� ������ � ������� "�����",
dbedt1.Text:=Form1.ADOQuery1.Fields[1].AsString;                 //  ����� ������ ����� ��������� ������ ��
dbedt2.Text:=Form1.ADOQuery1.Fields[2].AsString;                 //  ������ ������, � ����������� ����� ��������
dbedt3.Text:=Form1.ADOQuery1.Fields[3].AsString;                 //  � ���� �������.
dbedt4.Text:=Form1.ADOQuery1.Fields[4].AsString;                 //
dbedt5.Text:=Form1.ADOQuery1.Fields[5].AsString;                 //
dbedtISBN.Text:=Form1.ADOQuery1.Fields[6].AsString;              //
dbedt7.Text:=Form1.ADOQuery1.Fields[8].AsString;                 //
dbedt6.Text:=Form1.ADOQuery1.Fields[7].AsString;                 //
dbedt8.Text:=DateToStr(Date);                                    //
dbedt9.Text:=Unit5.Login;                                        //
qry1.Post;                                                       //

Form1.ADOQuery3.close;                                         //
Form1.ADOQuery3.SQL.Text:='DELETE FROM ����� WHERE id='+id;    // �������� ������ �� ������� "�����"
Form1.ADOQuery3.execSQL;                                       //


 Form1.ADOQuery1.SQL.Text:=BookSQL;                       // ������� ��� ����� ����� ��������
 Form1.ADOQuery1.Active:=True;                            // �������� ADOQuery
 end
 else                                        // ���� ���������� ��������� ���� ������ ������, ��:
 begin
    id:=Form1.ADOQuery1.Fields[0].AsString;                                         //
    Form1.ADOQuery1.Active:=False;                                                  //
    Form1.ADOQuery1.SQL.Text:='select * FROM ����� WHERE id='+id;                   //
    Form1.ADOQuery1.Active:=True;                                                   //
    Form1.ADOQuery1.Edit;                                                           //
    dbedt10.Text:=Form1.ADOQuery1.Fields[1].AsString;                               // ����������� ������ ��������,
    dbedt11.Text:=Form1.ADOQuery1.Fields[2].AsString;                               // ��������� ���������� ����
    dbedt12.Text:=Form1.ADOQuery1.Fields[3].AsString;                               // �� �������� �������������.
    dbedt13.Text:=Form1.ADOQuery1.Fields[4].AsString;                               //
    dbedt14.Text:=Form1.ADOQuery1.Fields[5].AsString;                               //
    dbedtISBN1.Text:=Form1.ADOQuery1.Fields[6].AsString;                            //
    dbedt16.Text:=IntToStr(StrToInt(Form1.ADOQuery1.Fields[7].AsString)-se1.Value); //
    dbedt17.Text:=Form1.ADOQuery1.Fields[8].AsString;                               //
    Form1.ADOQuery1.Post;                                                           //
    Form1.ADOQuery1.SQL.Text:=BookSQL;                                              //   ������� ������� ����� ��������
    Form1.ADOQuery1.Active:=True;                                                   //
 end;
 end
 else    // ���� ������������ �������� �� ������, ��:
 begin
  id:=Form1.ADOQuery1.Fields[0].AsString;                     //
 Form1.ADOQuery1.Active:=False;                               //  �������� ���������
Form1.ADOQuery3.close;                                        //  ������ �� ������� "�����"
Form1.ADOQuery3.SQL.Text:='DELETE FROM ����� WHERE id='+id;   //
Form1.ADOQuery3.execSQL;                                      //
Form1.ADOQuery1.Active:=True;                                 //
 end;
Form4.Close;                                 // �������� ���� �������/��������
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
Form4.Close;                                 // �������� ���� �������/��������
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  if Tag=1 then                                 // ����������� ����� � ����� ��� �������
  begin
   Label1.Caption:='�� ������ ������ �����:';
   lbl2.Visible:=True;
   lbl3.Visible:=True;
   se1.Visible:=True;
   se1.Value:=1;
   se1.MaxValue:= StrToInt(Form1.ADOQuery1.Fields[7].AsString);

  end
  else                                      // ����������� ����� � ����� ��� ��������
  begin
  Label1.Caption:='�� ����� ������ ������� �����:';
   lbl2.Visible:=False;
   lbl3.Visible:=False;
   se1.Visible:=False;
  end;
 lbl1.Caption:=chr(34) +Form1.ADOQuery1.Fields[1].AsString +chr(34) +' ?';  // ������ ������� �� �����
end;

end.
