unit uITypeButton;

interface

uses Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  tNotifyEvent = procedure (sender : TObject) of Object;
  tTypeButton = (Primary, Secondary, Succes, Danger, Warning, Dark);

  ITypeButton = interface
    ['{6C62FA95-9097-4CE7-8BEF-1643F6E3AB7F}']
    procedure ApplyAnimation(PainelBtn, PainelBorda : TPanel);
    procedure Enter(sender: TObject);
    procedure Leave(sender: TObject);
    function MouseEnter : tNotifyEvent;
    function MouseLeave : tNotifyEvent;
    function ColorDefaultBord : TColor;
    function ColorDefaultBackground : TColor;
  end;


implementation

end.
