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
if Edit1.Text<>'' then          // Есле поле ввода заполненно, то
begin
  try
ADOQuery1.Insert;                       //
DBEdit1.Text:=Edit1.Text;               //  Добавляем новый жанр
ADOQuery1.Post;                         //  в базу данных
ADOQuery1.Active:=False;                   //  Перезагружаем
ADOQuery1.Active:=True;                    //  ADOQuery
ShowMessage('Новый жанр успешно добавлен!');   // Выводим оповещение об успешном добавлении
ADOQuery1.Recordset.MoveLast;
Form2.ComboBox1.Items.Add(ADOQuery1.Recordset.Fields[1].Value);  // Добавляем новый жанр в список жанров
Form3.Close;                                  // Закрываем форму
except
  ShowMessage('Форма неверно заполненна!');   // При возникновении ошибки выводим оповещение о ней
end;
end;
end;

end.
