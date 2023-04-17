unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, math, MMSystem;

type

  { TForm1 }

  TForm1 = class(TForm)
    Clear: TBitBtn;
    Calculate: TButton;
    out_1: TMemo;
    out_2: TMemo;
    Sum_in: TEdit;
    Percent_in: TEdit;
    Time_in: TEdit;

    Sum: TLabel;
    Percent: TLabel;
    Time: TLabel;
    simple_percentage: TLabel;
    compound_percentage: TLabel;
    procedure CalculateClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure out_1Change(Sender: TObject);
    procedure Percent_inChange(Sender: TObject);
    procedure Percent_inKeyPress(Sender: TObject; var Key: char);
    procedure Sum_inChange(Sender: TObject);
    procedure Sum_inKeyPress(Sender: TObject; var Key: char);
    procedure Time_inChange(Sender: TObject);
    procedure Time_inKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Sum_inChange(Sender: TObject);
begin

end;

procedure TForm1.Sum_inKeyPress(Sender: TObject; var Key: char);
begin
 case Key of
  '0'..'9': key:=key;
  #8: key:=key;
  else key:=#0;
end;
end;

procedure TForm1.Time_inChange(Sender: TObject);
begin

end;

procedure TForm1.Time_inKeyPress(Sender: TObject; var Key: char);
begin
  case Key of
  '0'..'9': key:=key;
  #8: key:=key;
  else key:=#0;
end;
end;

procedure TForm1.CalculateClick(Sender: TObject);
var a, b, c: integer;
  simple_percentage_out, compound_percentage_out: real;
begin
sndPlaySound('windows-xp-startup.wav', SND_NODEFAULT or SND_ASYNC);
if (Sum_in.Text = '') and (Percent_in.Text = '') and (Time_in.Text = '') then begin
   ShowMessage('Вы не ввели значения, хотите прдолжить?');
   exit
end;
if (Sum_in.Text = '') and (Percent_in.Text = '') then begin
   ShowMessage('Вы не ввели начальную сумму, а также процентную ставку, хотите заполнить поле?');
   exit
end
else if (Sum_in.Text = '') and (Time_in.Text = '') then begin
   ShowMessage('Вы не ввели начальную сумму, а также количество периодов, хотите заполнить поле?');
   exit
end
else if (Percent_in.Text = '') and (Time_in.Text = '') then begin
   ShowMessage('Вы не ввели количество периодов, а также процентную ставку, хотите заполнить поле?');
   exit
end
else if (Sum_in.Text = '') then begin
   ShowMessage('Вы не ввели начальную сумму, хотите заполнить поле?');
   exit
end
else if (Percent_in.Text = '') then begin
   ShowMessage('Вы не ввели процентную ставку, хотите заполнить поле?');
   exit
end
else if (Time_in.Text = '') then begin
   ShowMessage('Вы не ввели количество периодов, хотите заполнить поле?');
   exit
end;


  a:= StrToInt(Sum_in.Text);
  b:= StrToInt(Percent_in.Text);
  c:= StrToInt(Time_in.Text);

  simple_percentage_out:= a + (a*(b / 100)*c);
  compound_percentage_out:= a*power((1 + b / 100), c);

  out_1.text:= FloatToStr(simple_percentage_out);
  out_2.text:= FloatToStr(compound_percentage_out);
end;

procedure TForm1.ClearClick(Sender: TObject);
begin
sndPlaySound('windows-xp-shutdown.wav', SND_NODEFAULT or SND_ASYNC);
Sum_in.Text:= '';
  Percent_in.Text:= '';
  Time_in.Text:= '';
  out_1.text:= '';
  out_2.text:= '';
  Sum_in.setfocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.out_1Change(Sender: TObject);
begin

end;

procedure TForm1.Percent_inChange(Sender: TObject);
begin

end;

procedure TForm1.Percent_inKeyPress(Sender: TObject; var Key: char);
begin
 case Key of
  '0'..'9': key:=key;
  #8: key:=key;
  else key:=#0;
end;
end;

end.

