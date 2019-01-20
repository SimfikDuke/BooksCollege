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
  Login:=Edit1.Text;                // Помещаем потенциальный логин
  Password:=Edit2.Text;             // и пароль в соответствующие переменные
ADOQuery1.Recordset.MoveFirst;           // Устанавливаем указатель рекордсета на первую позицию
while not ADOQuery1.Recordset.EOF do
begin
  if (Login=ADOQuery1.Recordset.Fields[0].Value) and (Password=ADOQuery1.Recordset.Fields[1].Value) then   
  begin                                               //  Если логин и пароль правильные,
    proverka:=1;                                      //  указываем, что проверка прошла
    Form1.lbl1.Caption:='Здравствуй, '+Login+'!';     //  меняем текст на метке с приветствием.
  end;                                                //
ADOQuery1.Recordset.MoveNext;         // Устанавливаем указатель рекордсета на следующую позицию
end;
if proverka=1 then                                   // Если проверка прошло, то:
begin
Form5.Close;                                         // Форма закрывается
end
else                                                 // иначе:
begin
  ShowMessage('Неправильный логин и/или пароли');    // Выводится ошибка
end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
proverka:=0;                                   
ADOQuery1.Active:=True;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if proverka<>1 then       // Если проверка не пройденна, а окно авторизации закрыто, то
begin                     //
  Form1.Close;            // закрываем и главное окно
end;
end;
procedure TForm5.FormShow(Sender: TObject);
begin
proverka:=0;      // Проверка изначально не пройденна
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
Form7.ShowModal;  // Выводим форму регистрации
end;



procedure TForm5.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=13 then    // При нажатии кнопки ENTER
begin             // в поле ввода пароля
Button1.Click;    // нажимается кнопка "Вход"
end;
end;

end.
