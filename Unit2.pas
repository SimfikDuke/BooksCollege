unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, start, Mask, DBCtrls, Spin, Unit3;

type
  TForm2 = class(TForm)
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    BitBtn1: TBitBtn;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    SpinEdit3: TSpinEdit;
    se1: TSpinEdit;
    lbl1: TLabel;
    dbedt1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin

    Form1.ADOQuery2.Active:=True;            // ��������� ���������� ���
    Form1.ADOQuery2.Recordset.MoveFirst;     // ���������� ������ ������

while not Form1.ADOQuery2.Recordset.EOF do                           //
begin                                                                //
    ComboBox1.Items.Add(Form1.ADOQuery2.Recordset.Fields[0].Value);  //  ���������� ������ ������
    Form1.ADOQuery2.Recordset.MoveNext;                              //  �� ���� ������
end;                                                                 //
ComboBox1.ItemIndex:=0;                 // ��������� ������� ���������� � ������ ������
end;
 
procedure TForm2.BitBtn2Click(Sender: TObject);

begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '')  then  // ���� ������ ���� ���������, ��:
  begin
if Tag=1 then                       // ���� ��� ����� = 1 , �� ����������
 begin
      Form1.ADOQuery1.Insert;        //  ������ ������� ���������� � ���� ������
      DBEdit1.Text:=Edit1.Text;         //
      DBEdit3.Text:=Edit2.Text;         //   
      DBEdit5.Text:=Edit3.Text;         //
      DBEdit2.Text:=ComboBox1.Text;     //   ���������� ����� ���� ������
      DBEdit4.Text:=SpinEdit1.Text;     //   �� ����� ��� �����
      DBEdit6.Text:=SpinEdit2.Text;     //
      DBEdit7.Text:=SpinEdit3.Text;     //
      dbedt1.Text:=se1.Text;            //
      Form1.ADOQuery1.Post;          //   �������� ����� ������ � ���� ������
 end else                      // ���� ��� ����� �� ����� 1 , �� ��������������
 begin
      Form1.ADOQuery1.Edit;          //  ������ ������� ���������� � ���� ������
      DBEdit1.Text:=Edit1.Text;         //
      DBEdit3.Text:=Edit2.Text;         //
      DBEdit5.Text:=Edit3.Text;         //
      DBEdit2.Text:=ComboBox1.Text;     //   ���������� ����� ���� ������
      DBEdit4.Text:=SpinEdit1.Text;     //   �� ����� ��� �����
      DBEdit6.Text:=SpinEdit2.Text;     //
      DBEdit7.Text:=SpinEdit3.Text;     //
      dbedt1.Text:=se1.Text;            //
      Form1.ADOQuery1.Post;          //   �������� ����������������� ������ � ���� ������
      Form2.Close;
 end;
 end else
 ShowMessage('���� ��� ��������� ����� �� ���������!');  // ���� ��������� ������, �� ��������� ���������� � ���
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
    Form3.ShowModal;        // �� ������� ������ "���������� �����" - ��������� �������� ���� ���������� �����
end;

procedure TForm2.FormShow(Sender: TObject);     // ��� ��������� ���� ����������/���������
begin
if Tag=1 then      // ���� ��� ����� = 1 , ��:
begin
      BitBtn2.Caption:='��������';              //  ������ ����� �� ������� �
      Form2.Caption:='���������� ����� �����';  //  �������� ����� �� "����������".
      Edit1.Text:='';                           //  ���������� ��� ����
      Edit2.Text:='';                           //
      Edit3.Text:='';                           //
      ComboBox1.Text:='-';                      //
      SpinEdit1.Text:='2015';                   //
      SpinEdit2.Text:='1';                      //
      SpinEdit3.Text:='1';                      //
end;
if Tag=2 then      // ���� ��� ����� = 2 , ��:
begin
      BitBtn2.Caption:='��������';       //  ������ ����� �� ������� �
      Form2.Caption:='��������� �����';  //  �������� ����� �� "���������".
      Edit1.Text:=DBEdit1.Text;      //
      Edit2.Text:=DBEdit3.Text;      //
      Edit3.Text:=DBEdit5.Text;      //  ��������� ��� ����
      ComboBox1.Text:=DBEdit2.Text;  //  ������� �� ������,
      SpinEdit1.Text:=DBEdit4.Text;  //  ������� ����������
      SpinEdit2.Text:=DBEdit6.Text;  //  ��������
      SpinEdit3.Text:=DBEdit7.Text;  //
      se1.Text:=dbedt1.Text;         //
end;

end;

end.
