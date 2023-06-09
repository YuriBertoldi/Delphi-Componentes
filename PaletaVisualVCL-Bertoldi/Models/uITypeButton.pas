unit uITypeButton;

interface

uses Vcl.Graphics,  Vcl.ExtCtrls, uTypes;

type
  ITypeButton = interface
    ['{6C62FA95-9097-4CE7-8BEF-1643F6E3AB7F}']
    procedure ApplyAnimation(PainelBtn, PainelBorda : TPanel);
    procedure Enter(sender: TObject);
    procedure Leave(sender: TObject);
    function MouseEnter : tNotifyEvent;
    function MouseLeave : tNotifyEvent;
    function ColorDefaultBord : TColor;
    function ColorDefaultBackground : TColor;
    function ColorDefaultFont : TColor;

    function GetTypeButton : tTypeButton;
    procedure SetTypeButton(Value : tTypeButton);
    property TipoButton : tTypeButton read GetTypeButton write SetTypeButton;
  end;

implementation

end.
