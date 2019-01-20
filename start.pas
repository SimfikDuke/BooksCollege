unit start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Spin, ExtCtrls, Buttons, comobj,
  Menus;
var
Tablizza, BookSQL : String;  // Объявление переменных "Tablizza" и "BookSQL" типа String
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
 var proverka:Integer;   // Объявление переменной "proverka" типа Integer
  var SortAZ : BOOL;    // Объявление переменной "SortAZ" типа BOOL
procedure TForm1.FormCreate(Sender: TObject);
begin                                  // При старте формы:
    Tablizza:='книги';                 // Указываем, что при старте подгружается основная таблица "книги" в переменной "Tablizza"
    BookSQL:= 'select * from книги';   // Присваиваем переменной "BookSQL" SQL запрос
    proverka:=0;                       // Присваиваем переменной proverka  0
    SortAZ:=True;                      // Указываем, что изначально сортировка от А до Я
    ADOQuery2.Active:=True;            // Активируем компонент ADOQuery2
    ADOQuery2.Recordset.MoveFirst;     // Перемещаем указатель рекордсета на первую позицию
while not ADOQuery2.Recordset.EOF do   // Объявлем цикл "Пока не закончелись записи в рекордсете"
begin
    ComboBox1.Items.Add(ADOQuery2.Recordset.Fields[0].Value); // Присваиваем ComboBox'а соответствуюшую запись в рекордсете
    ADOQuery2.Recordset.MoveNext;                             // Перемещаем указатель на следующую запись рекордсета
end;

end;

procedure TForm1.Button1Click(Sender: TObject);

begin
    ADOQuery1.SQL.Text:=BookSQL;       // Присваиваем SQL-запросу переменную запроса
    ADOQuery1.Active:=True;            // Активируем компонент ADOQuery1
end;
  var Poisk : string;   // Объявление переменной "Poisk" типа string
  var IfPoiskActive : integer;    // Объявление переменной "IfPoiskActive"  типа integer



procedure TForm1.BitBtn2Click(Sender: TObject);  
begin  //Блок поиска
            IfPoiskActive :=0;    // Указываем, что изначально поиск не активен
           if Edit1.Text<>'' then // Если поле Edit1.Text было измененно
           begin
             if IfPoiskActive=0 then   // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where автор LIKE'+chr(39)+'%'+edit1.Text+'%'+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else    // Если поиск уже активен, то:
             begin
               Poisk:=Poisk + ' AND автор LIKE'+chr(39)+'%'+edit1.Text+'%'+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;
           end;
           if Edit2.Text<>'' then  // Если поле Edit2.Text было измененно
           begin
             if IfPoiskActive=0 then // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where название LIKE'+chr(39)+'%'+edit2.Text+'%'+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else   // Если поиск уже активен, то:
             begin
               Poisk:=Poisk + ' AND название LIKE'+chr(39)+'%'+edit2.Text+'%'+chr(39);   // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;
           end;

           if Edit3.Text<>'' then  // Если поле Edit3.Text было измененно
           begin
             if IfPoiskActive=0 then  // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where ISBN LIKE'+chr(39)+'%'+edit3.Text+'%'+chr(39); // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else   // Если поиск уже активен, то:
             begin
               Poisk:=Poisk + ' AND ISBN LIKE'+chr(39)+'%'+edit3.Text+'%'+chr(39); // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;
           end;

           if Edit4.Text<>'' then // Если поле Edit4.Text было измененно
           begin
             if IfPoiskActive=0 then  // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where год LIKE'+chr(39)+'%'+edit4.Text+'%'+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else  // Если поиск уже активен, то:
             begin
               Poisk:=Poisk + ' AND год LIKE'+chr(39)+'%'+edit4.Text+'%'+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;
           end;

            if ComboBox1.Text <> '-' then  // Если поле ComboBox1.Text было измененно
           begin
             if IfPoiskActive=0 then // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where жанр LIKE '+chr(39)+'%'+ComboBox1.Text+'%'+chr(39); // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else   // Если поиск уже активен, то:
             begin
              Poisk := Poisk + 'AND жанр LIKE ' +chr(39)+ComboBox1.Text+chr(39);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;
           end;


             if IfPoiskActive=0 then  // Если поиск еще не активен, то
             begin
             Poisk := BookSQL +' where цена BETWEEN '+IntToStr(SpinEdit1.Value)+' AND '+IntToStr(SpinEdit2.Value);  // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             IfPoiskActive:=1; // Указываем в переменной, что поиск теперь активен
             end
             else  // Если поиск уже активен, то:
             begin
              Poisk := Poisk + 'AND цена BETWEEN '+IntToStr(SpinEdit1.Value)+' AND '+IntToStr(SpinEdit2.Value);   // Присваиваем переменной "Poisk" соответствующеий SQL-запрос
             end;


           if IfPoiskActive<>0 then // Если поиск активен, то :
           begin
           ADOQuery1.SQL.Text:=Poisk; // Присваиваем SQL-запросу текст из переменной Poisk
           end
           else                    // Если нет, то :
           begin
            ADOQuery1.SQL.Text:=BookSQL;  // Возвращаем "чистый" запрос на таблицу
           end;
           ADOQuery1.Active:=True; // Активируем компонент ADOQuery1

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin           //Описываем действие при нажатии кнопки "Все книги"
    Tablizza:='книги'; // Присваиваем переменной "Tablizza" значение "книги"
    BookSQL:='select * from книги'; // Присваиваем переменной "BookSQL" запрос на вывод книг, которые сейчас в наличии
    ADOQuery1.SQL.Text:=BookSQL; // Присваиваем SQL-запросу текст из переменной "BookSQL"
    ADOQuery1.Active:=True;      // Активируем компонент ADOQuery1
    BitBtn4.Caption:='Купить    '; // Меняем надпись на кнопке
    lbl2.Caption:='Все книги:'; // Меняем метку, которая указывает название активной таблицы
    BitBtn4.Glyph.LoadFromFile('buy.bmp'); // Меняем иконку на кнопке "Купить"
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Form2.Tag:=1;      //
                       // Форма №2 откроется с тегом 1
    Form2.ShowModal;   //
end;
procedure TForm1.Btn2Click(Sender: TObject);
begin
    Form2.Tag:=2;      //
                       // Форма №2 откроется с тегом 2
    Form2.ShowModal;   //
end;


procedure TForm1.BitBtn4Click(Sender: TObject);

begin
if Tablizza = 'книги' then  // Если сейчас выведенна таблица "книги", то:
begin
    Form4.Tag:=1; // Тег формы №4 = 1
end
else // Если нет, то:
begin
    Form4.Tag:=2; // Тег формы №4 = 2
end;
    Form4.ShowModal;// Модальное открытие формы №4
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    Form5.ShowModal;   // Модальное открытие формы №5
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if proverka<>1 then
  begin
      Form5.ShowModal;// Модальное открытие формы №5
      proverka:=1;  // Присваиваем переменной "Проверка" значение 1
  end;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var StrokaSortirovki,Zapros : string;  // Объявление переменных "StrokaSortirovki" , "Zapros" типа string
begin  //Блок сортировки записей в таблице по одной из колонок
 if SortAZ=True then  // Если мы сортируем по алфавиту от А до Я, то
 begin
     StrokaSortirovki:= Column.FieldName; // Переменная "StrokaSortirovki" будет содержать название (титл) колонки
     SortAZ:=false; // Сортировка от А до Я выключена, т.е сортировка будет от Я до А
 end
 else
 begin
     SortAZ:=True;   // Включаем сортировку по алфавиту от А до Я
     StrokaSortirovki:= Column.FieldName+ ' DESC';  // Переменная "StrokaSortirovki" будет содержать название (титл) колонки и параметр "DESC", что обеспечит сортировку в обратном порядке
 end;

Zapros:=ADOQuery1.SQL[0]; // Переменная "Zapros" будет содержать верхнюю запись SQL-запроса
  with ADOQuery1 do //Следующие действия будут проходить с компонентом "ADOQuery1"
  begin
     Close; // Закрыть
     SQL.Clear; // Очистить запрос
     SQL.Add(Zapros); // Добавить в запрос текст из переменной "Zapros"
     SQL.Add('ORDER BY '+StrokaSortirovki); // Добавить в запрос "ORDER BY " и текст из переменной "StrokaSortirovki"
     Open; //Открыть
  end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var num_rows, num_columns , i, j: Integer; // Объявление переменных "num_rows" , "num_columns" , "i", "j" типа Integer
var table, word, doc: OleVariant; // Объявление переменных "table", "word", "doc" типа OleVariant

begin
    ADOQuery1.Active:=False; //
                             // Перезапускаем компонент ADOQuery1
    ADOQuery1.Active:=True;  //
    num_rows:=DBGrid1.DataSource.DataSet.RecordCount;   // Присваиваем переменной "num_rows" количество записей в выведенной таблице
    num_columns:=DBGrid1.DataSource.DataSet.FieldCount; // Присваиваем переменной "num_columns" количество полей в выведенной таблице
try
      word := CreateOleObject('Word.Application'); // Создаем OleObject - приложение MS Word и присваиваем это переменной "word"
   except
      ShowMessage('Не возможно открыть MS Word!'+#13#10+'Проверьте, установлен ли он!'); // При невозможности открытия MS Word будет выведена ошибка, которая это сообщает
   end;


          word.Documents.Add;             // Создание нового документа MS Word
          doc:=word.Documents.Item(1);    // doc - обращение к первому элементу документа
          doc.Tables.Add(doc.Range, NumRows:=num_rows+1,NumColumns:=num_columns); // Добавляем новую таблицу
          doc.Tables.Item(1).Style:='Сетка таблицы';  // Указываем стиль таблицы
          table:=word.activedocument.tables.item(1);  // table - активный элемент таблицы

 for j:=0 to num_columns-1 do // Цикл создания названий колонок в таблице
       begin
        table.cell(0, j+1).range.text:=DBGrid1.Columns[j].Title.caption;
        table.cell(0, j+1).range.Font.Bold:=1;
       end;
    table.cell(0, 0).range.text:='Код';
    table.cell(0, 0).range.Font.Bold:=1;

i:=2;
    table:=word.activedocument.tables.item(1); // table - активный элемент таблицы
    while not (DBGrid1.DataSource.DataSet.eof) do  // Цикл добавления записей в таблицу
     begin
      for j:=0 to num_columns-1 do
       begin
        table.cell(i, j+1).range.text:=DBGrid1.DataSource.DataSet.Fields[j].asstring;
       end;
       DBGrid1.DataSource.DataSet.next;
       inc(i);
     end;
    table.Columns.Item(1).SetWidth(30,'wdAdjustNone');    //        
    table.Columns.Item(2).SetWidth(105,'wdAdjustNone');   //        Задаем
    table.Columns.Item(3).SetWidth(80,'wdAdjustNone');    //        каждому
    table.Columns.Item(4).SetWidth(98,'wdAdjustNone');    //        столбцу
    table.Columns.Item(5).SetWidth(35,'wdAdjustNone');    //        нужную
    table.Columns.Item(6).SetWidth(47,'wdAdjustNone');    //        ширину
    table.Columns.Item(7).SetWidth(100,'wdAdjustNone');   //        полей
    table.Columns.Item(8).SetWidth(43,'wdAdjustNone');    //
    table.Columns.Item(9).SetWidth(35,'wdAdjustNone');    //
  word.activedocument.Pagesetup.LeftMargin:=20;  // Задаем отступ слева - 20 pt

word.Visible:=True;      // Делаем документ видимым
end;



procedure TForm1.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
    DBGrid1.Columns[0].Width:=22;     //
    DBGrid1.Columns[4].Width:=35;     //
    DBGrid1.Columns[5].Width:=45;     //  После открытия ADOQuery1 задаем ширину колонок
    DBGrid1.Columns[7].Width:=36;     //
    DBGrid1.Columns[8].Width:=28;     //

end;




procedure TForm1.btn1Click(Sender: TObject);
begin
    Tablizza:='архив';                        // Указываем в переменной "Tablizza", что сейчас активна таблица "архив"
    BookSQL:='select * from архив';           // Помещаем в переменную "BookSQL" SQL-запрос на вывод таблицы архива
    ADOQuery1.SQL.Text:=BookSQL;              // Присваиваем SQL-запросу текст из переменной "BookSQL"
    ADOQuery1.Active:=True;                   // Активируем компонент ADOQuery1

    BitBtn4.Caption:='Удалить  ';             // Изменяем надпись на кнопке
    lbl2.Caption:='Архив:';                   // Меняем метку, которая указывает название активной таблицы
    BitBtn4.Glyph.LoadFromFile('del.bmp');    // Меняем иконку на кнопке "Удалить"
    
    DBGrid1.Columns[8].Width:=76;             //
    DBGrid1.Columns[9].Width:=52;             //  Задаем ширину колонок
    DBGrid1.Columns[10].Width:=36;            //
    DBGrid1.Columns[3].Width:=150;            //
end;

procedure TForm1.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var P: TPoint;  // Объявление переменной "P" типа TPoint (точка)
begin // Блок, отвечающий за открытие PopupMenu по нажатию на запись в таблице
  P:=GetClientOrigin;
  if Button = mbRight then
    pm1.Popup(X+P.X+DBGrid1.Left, Y+P.Y+DBGrid1.Top);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
    btn2.Click;    // Задаем кнопку, которая нажимается по нажатию компонента в PopupMenu
end;

procedure TForm1.N2Click(Sender: TObject);
begin
    BitBtn4.Click; // Задаем кнопку, которая нажимается по нажатию компонента в PopupMenu
end;

end.  // Завершение программы
