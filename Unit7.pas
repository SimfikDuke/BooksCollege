unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lbl1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    dbedt1: TDBEdit;
    dbedt2: TDBEdit;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
begin
if (edt2.Text = edt3.Text) and (edt1.Text<>'') and (edt1.Text<>'') then  // Если оба поля заполнены и поля
begin                                                                    // ввода паролей совпадают, то:
Form5.ADOQuery1.Insert;                                                  //
dbedt1.Text:= edt1.Text;                                                 //
dbedt2.Text:= edt2.Text;                                                 // Добавляем в базу данных
Form5.ADOQuery1.Post;                                                    // нового пользователя
ShowMessage('Новый пользователь успешно добавлен!');                     //
Form7.Close;                                                             //
end                                                                      //
else                                                                     // Иначе:
begin                                                                    //
   ShowMessage('Пароли не совпадают либо одна из форм пуста!');          // Выводим ошибку.
end;

end;

end.
