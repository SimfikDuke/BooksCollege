unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, start, DB, ADODB;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
if Edit1.Text<>'' then          // ���� ���� ����� ����������, ��
begin
  try
ADOQuery1.Insert;                       //
DBEdit1.Text:=Edit1.Text;               //  ��������� ����� ����
ADOQuery1.Post;                         //  � ���� ������
ADOQuery1.Active:=False;                   //  �������������
ADOQuery1.Active:=True;                    //  ADOQuery
ShowMessage('����� ���� ������� ��������!');   // ������� ���������� �� �������� ����������
ADOQuery1.Recordset.MoveLast;
Form2.ComboBox1.Items.Add(ADOQuery1.Recordset.Fields[1].Value);  // ��������� ����� ���� � ������ ������
Form3.Close;                                  // ��������� �����
except
  ShowMessage('����� ������� ����������!');   // ��� ������������� ������ ������� ���������� � ���
end;
end;
end;

end.
