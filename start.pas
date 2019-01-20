unit start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Spin, ExtCtrls, Buttons, comobj,
  Menus;
var
Tablizza, BookSQL : String;  // ���������� ���������� "Tablizza" � "BookSQL" ���� String
type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    ADOQuery2: TADOQuery;
    ADOTable1: TADOTable;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ADOQuery3: TADOQuery;
    BitBtn5: TBitBtn;
    btn1: TBitBtn;
    lbl1: TLabel;
    btn2: TBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure btn1Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2, Unit4, Unit5;

{$R *.dfm}
 var proverka:Integer;   // ���������� ���������� "proverka" ���� Integer
  var SortAZ : BOOL;    // ���������� ���������� "SortAZ" ���� BOOL
procedure TForm1.FormCreate(Sender: TObject);
begin                                  // ��� ������ �����:
    Tablizza:='�����';                 // ���������, ��� ��� ������ ������������ �������� ������� "�����" � ���������� "Tablizza"
    BookSQL:= 'select * from �����';   // ����������� ���������� "BookSQL" SQL ������
    proverka:=0;                       // ����������� ���������� proverka  0
    SortAZ:=True;                      // ���������, ��� ���������� ���������� �� � �� �
    ADOQuery2.Active:=True;            // ���������� ��������� ADOQuery2
    ADOQuery2.Recordset.MoveFirst;     // ���������� ��������� ���������� �� ������ �������
while not ADOQuery2.Recordset.EOF do   // �������� ���� "���� �� ����������� ������ � ����������"
begin
    ComboBox1.Items.Add(ADOQuery2.Recordset.Fields[0].Value); // ����������� ComboBox'� ��������������� ������ � ����������
    ADOQuery2.Recordset.MoveNext;                             // ���������� ��������� �� ��������� ������ ����������
end;

end;

procedure TForm1.Button1Click(Sender: TObject);

begin
    ADOQuery1.SQL.Text:=BookSQL;       // ����������� SQL-������� ���������� �������
    ADOQuery1.Active:=True;            // ���������� ��������� ADOQuery1
end;
  var Poisk : string;   // ���������� ���������� "Poisk" ���� string
  var IfPoiskActive : integer;    // ���������� ���������� "IfPoiskActive"  ���� integer



procedure TForm1.BitBtn2Click(Sender: TObject);  
begin  //���� ������
            IfPoiskActive :=0;    // ���������, ��� ���������� ����� �� �������
           if Edit1.Text<>'' then // ���� ���� Edit1.Text ���� ���������
           begin
             if IfPoiskActive=0 then   // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where ����� LIKE'+chr(39)+'%'+edit1.Text+'%'+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else    // ���� ����� ��� �������, ��:
             begin
               Poisk:=Poisk + ' AND ����� LIKE'+chr(39)+'%'+edit1.Text+'%'+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             end;
           end;
           if Edit2.Text<>'' then  // ���� ���� Edit2.Text ���� ���������
           begin
             if IfPoiskActive=0 then // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where �������� LIKE'+chr(39)+'%'+edit2.Text+'%'+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else   // ���� ����� ��� �������, ��:
             begin
               Poisk:=Poisk + ' AND �������� LIKE'+chr(39)+'%'+edit2.Text+'%'+chr(39);   // ����������� ���������� "Poisk" ���������������� SQL-������
             end;
           end;

           if Edit3.Text<>'' then  // ���� ���� Edit3.Text ���� ���������
           begin
             if IfPoiskActive=0 then  // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where ISBN LIKE'+chr(39)+'%'+edit3.Text+'%'+chr(39); // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else   // ���� ����� ��� �������, ��:
             begin
               Poisk:=Poisk + ' AND ISBN LIKE'+chr(39)+'%'+edit3.Text+'%'+chr(39); // ����������� ���������� "Poisk" ���������������� SQL-������
             end;
           end;

           if Edit4.Text<>'' then // ���� ���� Edit4.Text ���� ���������
           begin
             if IfPoiskActive=0 then  // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where ��� LIKE'+chr(39)+'%'+edit4.Text+'%'+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else  // ���� ����� ��� �������, ��:
             begin
               Poisk:=Poisk + ' AND ��� LIKE'+chr(39)+'%'+edit4.Text+'%'+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             end;
           end;

            if ComboBox1.Text <> '-' then  // ���� ���� ComboBox1.Text ���� ���������
           begin
             if IfPoiskActive=0 then // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where ���� LIKE '+chr(39)+'%'+ComboBox1.Text+'%'+chr(39); // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else   // ���� ����� ��� �������, ��:
             begin
              Poisk := Poisk + 'AND ���� LIKE ' +chr(39)+ComboBox1.Text+chr(39);  // ����������� ���������� "Poisk" ���������������� SQL-������
             end;
           end;


             if IfPoiskActive=0 then  // ���� ����� ��� �� �������, ��
             begin
             Poisk := BookSQL +' where ���� BETWEEN '+IntToStr(SpinEdit1.Value)+' AND '+IntToStr(SpinEdit2.Value);  // ����������� ���������� "Poisk" ���������������� SQL-������
             IfPoiskActive:=1; // ��������� � ����������, ��� ����� ������ �������
             end
             else  // ���� ����� ��� �������, ��:
             begin
              Poisk := Poisk + 'AND ���� BETWEEN '+IntToStr(SpinEdit1.Value)+' AND '+IntToStr(SpinEdit2.Value);   // ����������� ���������� "Poisk" ���������������� SQL-������
             end;


           if IfPoiskActive<>0 then // ���� ����� �������, �� :
           begin
           ADOQuery1.SQL.Text:=Poisk; // ����������� SQL-������� ����� �� ���������� Poisk
           end
           else                    // ���� ���, �� :
           begin
            ADOQuery1.SQL.Text:=BookSQL;  // ���������� "������" ������ �� �������
           end;
           ADOQuery1.Active:=True; // ���������� ��������� ADOQuery1

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin           //��������� �������� ��� ������� ������ "��� �����"
    Tablizza:='�����'; // ����������� ���������� "Tablizza" �������� "�����"
    BookSQL:='select * from �����'; // ����������� ���������� "BookSQL" ������ �� ����� ����, ������� ������ � �������
    ADOQuery1.SQL.Text:=BookSQL; // ����������� SQL-������� ����� �� ���������� "BookSQL"
    ADOQuery1.Active:=True;      // ���������� ��������� ADOQuery1
    BitBtn4.Caption:='������    '; // ������ ������� �� ������
    lbl2.Caption:='��� �����:'; // ������ �����, ������� ��������� �������� �������� �������
    BitBtn4.Glyph.LoadFromFile('buy.bmp'); // ������ ������ �� ������ "������"
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Form2.Tag:=1;      //
                       // ����� �2 ��������� � ����� 1
    Form2.ShowModal;   //
end;
procedure TForm1.Btn2Click(Sender: TObject);
begin
    Form2.Tag:=2;      //
                       // ����� �2 ��������� � ����� 2
    Form2.ShowModal;   //
end;


procedure TForm1.BitBtn4Click(Sender: TObject);

begin
if Tablizza = '�����' then  // ���� ������ ��������� ������� "�����", ��:
begin
    Form4.Tag:=1; // ��� ����� �4 = 1
end
else // ���� ���, ��:
begin
    Form4.Tag:=2; // ��� ����� �4 = 2
end;
    Form4.ShowModal;// ��������� �������� ����� �4
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Form5.ShowModal;   // ��������� �������� ����� �5
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if proverka<>1 then
  begin
      Form5.ShowModal;// ��������� �������� ����� �5
      proverka:=1;  // ����������� ���������� "��������" �������� 1
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var StrokaSortirovki,Zapros : string;  // ���������� ���������� "StrokaSortirovki" , "Zapros" ���� string
begin  //���� ���������� ������� � ������� �� ����� �� �������
 if SortAZ=True then  // ���� �� ��������� �� �������� �� � �� �, ��
 begin
     StrokaSortirovki:= Column.FieldName; // ���������� "StrokaSortirovki" ����� ��������� �������� (����) �������
     SortAZ:=false; // ���������� �� � �� � ���������, �.� ���������� ����� �� � �� �
 end
 else
 begin
     SortAZ:=True;   // �������� ���������� �� �������� �� � �� �
     StrokaSortirovki:= Column.FieldName+ ' DESC';  // ���������� "StrokaSortirovki" ����� ��������� �������� (����) ������� � �������� "DESC", ��� ��������� ���������� � �������� �������
 end;

Zapros:=ADOQuery1.SQL[0]; // ���������� "Zapros" ����� ��������� ������� ������ SQL-�������
  with ADOQuery1 do //��������� �������� ����� ��������� � ����������� "ADOQuery1"
  begin
     Close; // �������
     SQL.Clear; // �������� ������
     SQL.Add(Zapros); // �������� � ������ ����� �� ���������� "Zapros"
     SQL.Add('ORDER BY '+StrokaSortirovki); // �������� � ������ "ORDER BY " � ����� �� ���������� "StrokaSortirovki"
     Open; //�������
  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var num_rows, num_columns , i, j: Integer; // ���������� ���������� "num_rows" , "num_columns" , "i", "j" ���� Integer
var table, word, doc: OleVariant; // ���������� ���������� "table", "word", "doc" ���� OleVariant

begin
    ADOQuery1.Active:=False; //
                             // ������������� ��������� ADOQuery1
    ADOQuery1.Active:=True;  //
    num_rows:=DBGrid1.DataSource.DataSet.RecordCount;   // ����������� ���������� "num_rows" ���������� ������� � ���������� �������
    num_columns:=DBGrid1.DataSource.DataSet.FieldCount; // ����������� ���������� "num_columns" ���������� ����� � ���������� �������
try
      word := CreateOleObject('Word.Application'); // ������� OleObject - ���������� MS Word � ����������� ��� ���������� "word"
   except
      ShowMessage('�� �������� ������� MS Word!'+#13#10+'���������, ���������� �� ��!'); // ��� ������������� �������� MS Word ����� �������� ������, ������� ��� ��������
   end;


          word.Documents.Add;             // �������� ������ ��������� MS Word
          doc:=word.Documents.Item(1);    // doc - ��������� � ������� �������� ���������
          doc.Tables.Add(doc.Range, NumRows:=num_rows+1,NumColumns:=num_columns); // ��������� ����� �������
          doc.Tables.Item(1).Style:='����� �������';  // ��������� ����� �������
          table:=word.activedocument.tables.item(1);  // table - �������� ������� �������

 for j:=0 to num_columns-1 do // ���� �������� �������� ������� � �������
       begin
        table.cell(0, j+1).range.text:=DBGrid1.Columns[j].Title.caption;
        table.cell(0, j+1).range.Font.Bold:=1;
       end;
    table.cell(0, 0).range.text:='���';
    table.cell(0, 0).range.Font.Bold:=1;

i:=2;
    table:=word.activedocument.tables.item(1); // table - �������� ������� �������
    while not (DBGrid1.DataSource.DataSet.eof) do  // ���� ���������� ������� � �������
     begin
      for j:=0 to num_columns-1 do
       begin
        table.cell(i, j+1).range.text:=DBGrid1.DataSource.DataSet.Fields[j].asstring;
       end;
       DBGrid1.DataSource.DataSet.next;
       inc(i);
     end;
    table.Columns.Item(1).SetWidth(30,'wdAdjustNone');    //        
    table.Columns.Item(2).SetWidth(105,'wdAdjustNone');   //        ������
    table.Columns.Item(3).SetWidth(80,'wdAdjustNone');    //        �������
    table.Columns.Item(4).SetWidth(98,'wdAdjustNone');    //        �������
    table.Columns.Item(5).SetWidth(35,'wdAdjustNone');    //        ������
    table.Columns.Item(6).SetWidth(47,'wdAdjustNone');    //        ������
    table.Columns.Item(7).SetWidth(100,'wdAdjustNone');   //        �����
    table.Columns.Item(8).SetWidth(43,'wdAdjustNone');    //
    table.Columns.Item(9).SetWidth(35,'wdAdjustNone');    //
  word.activedocument.Pagesetup.LeftMargin:=20;  // ������ ������ ����� - 20 pt

word.Visible:=True;      // ������ �������� �������
end;



procedure TForm1.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
    DBGrid1.Columns[0].Width:=22;     //
    DBGrid1.Columns[4].Width:=35;     //
    DBGrid1.Columns[5].Width:=45;     //  ����� �������� ADOQuery1 ������ ������ �������
    DBGrid1.Columns[7].Width:=36;     //
    DBGrid1.Columns[8].Width:=28;     //

end;




procedure TForm1.btn1Click(Sender: TObject);
begin
    Tablizza:='�����';                        // ��������� � ���������� "Tablizza", ��� ������ ������� ������� "�����"
    BookSQL:='select * from �����';           // �������� � ���������� "BookSQL" SQL-������ �� ����� ������� ������
    ADOQuery1.SQL.Text:=BookSQL;              // ����������� SQL-������� ����� �� ���������� "BookSQL"
    ADOQuery1.Active:=True;                   // ���������� ��������� ADOQuery1

    BitBtn4.Caption:='�������  ';             // �������� ������� �� ������
    lbl2.Caption:='�����:';                   // ������ �����, ������� ��������� �������� �������� �������
    BitBtn4.Glyph.LoadFromFile('del.bmp');    // ������ ������ �� ������ "�������"
    
    DBGrid1.Columns[8].Width:=76;             //
    DBGrid1.Columns[9].Width:=52;             //  ������ ������ �������
    DBGrid1.Columns[10].Width:=36;            //
    DBGrid1.Columns[3].Width:=150;            //
end;

procedure TForm1.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var P: TPoint;  // ���������� ���������� "P" ���� TPoint (�����)
begin // ����, ���������� �� �������� PopupMenu �� ������� �� ������ � �������
  P:=GetClientOrigin;
  if Button = mbRight then
    pm1.Popup(X+P.X+DBGrid1.Left, Y+P.Y+DBGrid1.Top);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
    btn2.Click;    // ������ ������, ������� ���������� �� ������� ���������� � PopupMenu
end;

procedure TForm1.N2Click(Sender: TObject);
begin
    BitBtn4.Click; // ������ ������, ������� ���������� �� ������� ���������� � PopupMenu
end;

end.  // ���������� ���������
