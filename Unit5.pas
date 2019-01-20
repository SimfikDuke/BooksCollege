unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, start, ADODB, DB, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    Button2: TButton;
    ds1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var Login, Password: string;
var
  Form5: TForm5;

implementation

uses Unit7;

{$R *.dfm}
var proverka: Integer;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Login:=Edit1.Text;                // �������� ������������� �����
  Password:=Edit2.Text;             // � ������ � ��������������� ����������
ADOQuery1.Recordset.MoveFirst;           // ������������� ��������� ���������� �� ������ �������
while not ADOQuery1.Recordset.EOF do
begin
  if (Login=ADOQuery1.Recordset.Fields[0].Value) and (Password=ADOQuery1.Recordset.Fields[1].Value) then   
  begin                                               //  ���� ����� � ������ ����������,
    proverka:=1;                                      //  ���������, ��� �������� ������
    Form1.lbl1.Caption:='����������, '+Login+'!';     //  ������ ����� �� ����� � ������������.
  end;                                                //
ADOQuery1.Recordset.MoveNext;         // ������������� ��������� ���������� �� ��������� �������
end;
if proverka=1 then                                   // ���� �������� ������, ��:
begin
Form5.Close;                                         // ����� �����������
end
else                                                 // �����:
begin
  ShowMessage('������������ ����� �/��� ������');    // ��������� ������
end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
proverka:=0;                                   
ADOQuery1.Active:=True;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if proverka<>1 then       // ���� �������� �� ���������, � ���� ����������� �������, ��
begin                     //
  Form1.Close;            // ��������� � ������� ����
end;
end;
procedure TForm5.FormShow(Sender: TObject);
begin
proverka:=0;      // �������� ���������� �� ���������
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
Form7.ShowModal;  // ������� ����� �����������
end;



procedure TForm5.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=13 then    // ��� ������� ������ ENTER
begin             // � ���� ����� ������
Button1.Click;    // ���������� ������ "����"
end;
end;

end.
