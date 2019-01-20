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

    Form1.ADOQuery2.Active:=True;            // Активация рекордсета для
    Form1.ADOQuery2.Recordset.MoveFirst;     // заполнения списка жанров

while not Form1.ADOQuery2.Recordset.EOF do                           //
begin                                                                //
    ComboBox1.Items.Add(Form1.ADOQuery2.Recordset.Fields[0].Value);  //  Заполнение списка жанров
    Form1.ADOQuery2.Recordset.MoveNext;                              //  из базы данных
end;                                                                 //
ComboBox1.ItemIndex:=0;                 // Установка первого компонента в списке жанров
end;
 
procedure TForm2.BitBtn2Click(Sender: TObject);

begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '')  then  // Если нужные поля заполнены, то:
  begin
if Tag=1 then                       // Если Тег формы = 1 , то добавление
 begin
      Form1.ADOQuery1.Insert;        //  Подача команды добавления в базу данных
      DBEdit1.Text:=Edit1.Text;         //
      DBEdit3.Text:=Edit2.Text;         //   
      DBEdit5.Text:=Edit3.Text;         //
      DBEdit2.Text:=ComboBox1.Text;     //   Заполнение полей базы данных
      DBEdit4.Text:=SpinEdit1.Text;     //   из полей для ввода
      DBEdit6.Text:=SpinEdit2.Text;     //
      DBEdit7.Text:=SpinEdit3.Text;     //
      dbedt1.Text:=se1.Text;            //
      Form1.ADOQuery1.Post;          //   Отправка новой записи в базу данных
 end else                      // Если Тег формы не равен 1 , то редактирование
 begin
      Form1.ADOQuery1.Edit;          //  Подача команды добавления в базу данных
      DBEdit1.Text:=Edit1.Text;         //
      DBEdit3.Text:=Edit2.Text;         //
      DBEdit5.Text:=Edit3.Text;         //
      DBEdit2.Text:=ComboBox1.Text;     //   Заполнение полей базы данных
      DBEdit4.Text:=SpinEdit1.Text;     //   из полей для ввода
      DBEdit6.Text:=SpinEdit2.Text;     //
      DBEdit7.Text:=SpinEdit3.Text;     //
      dbedt1.Text:=se1.Text;            //
      Form1.ADOQuery1.Post;          //   Отправка отредактированной записи в базу данных
      Form2.Close;
 end;
 end else
 ShowMessage('Одно или несколько полей не заполнено!');  // Если возникает ошибка, то выводится оповещение о ней
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
    Form3.ShowModal;        // По нажатию кнопки "Добавление жанра" - модальное открытие окна добавления жанра
end;

procedure TForm2.FormShow(Sender: TObject);     // При появлении окна добавления/изменения
begin
if Tag=1 then      // Если Тег формы = 1 , то:
begin
      BitBtn2.Caption:='Добавить';              //  Меняем текст на кнопках и
      Form2.Caption:='Добавление новой книги';  //  название формы на "Добавление".
      Edit1.Text:='';                           //  Опустошаем все поля
      Edit2.Text:='';                           //
      Edit3.Text:='';                           //
      ComboBox1.Text:='-';                      //
      SpinEdit1.Text:='2015';                   //
      SpinEdit2.Text:='1';                      //
      SpinEdit3.Text:='1';                      //
end;
if Tag=2 then      // Если Тег формы = 2 , то:
begin
      BitBtn2.Caption:='Изменить';       //  Меняем текст на кнопках и
      Form2.Caption:='Изменение книги';  //  название формы на "Изменение".
      Edit1.Text:=DBEdit1.Text;      //
      Edit2.Text:=DBEdit3.Text;      //
      Edit3.Text:=DBEdit5.Text;      //  Заполняем все поля
      ComboBox1.Text:=DBEdit2.Text;  //  данными об записи,
      SpinEdit1.Text:=DBEdit4.Text;  //  которую собераемся
      SpinEdit2.Text:=DBEdit6.Text;  //  изменить
      SpinEdit3.Text:=DBEdit7.Text;  //
      se1.Text:=dbedt1.Text;         //
end;

end;

end.
