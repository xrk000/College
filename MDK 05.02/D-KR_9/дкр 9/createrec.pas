unit createRec;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TcreateRec }

  TcreateRec = class(TForm)
    mCancel: TBitBtn;
    mSave: TBitBtn;
    eColor: TComboBox;
    ePower: TEdit;
    ePetrol: TCheckBox;
    eYear: TEdit;
    eName: TEdit;
    motocolor: TLabel;
    motopower: TLabel;
    petrol: TLabel;
    year: TLabel;
    moto: TLabel;
    procedure ePowerKeyPress(Sender: TObject; var Key: char);
    procedure eYearKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  createRecord: TcreateRec;

implementation

{$R *.lfm}

{ TcreateRec }


procedure TcreateRec.FormShow(Sender: TObject);
begin
  eName.SetFocus;
  ePower.OnKeyPress := @ePowerKeyPress;
  eYear.OnKeyPress := @eYearKeyPress;
end;

procedure TcreateRec.ePowerKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0; // Отменяем ввод, если это не цифра и не backspace
  end;
end;

procedure TcreateRec.eYearKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0; // Отменяем ввод, если это не цифра и не backspace
  end;
end;



end.

