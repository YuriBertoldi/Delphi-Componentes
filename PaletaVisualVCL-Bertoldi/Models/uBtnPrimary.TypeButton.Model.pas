unit uBtnPrimary.TypeButton.Model;

interface

uses uITypeButton, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TBtnPrimary = class(TInterfacedObject, iTypeButton)
  private
    procedure Enter(sender: TObject);
    procedure Leave(sender: TObject);
    function MouseEnter : tNotifyEvent;
    function MouseLeave : tNotifyEvent;
    function ColorDefaultBord : TColor;
    function ColorDefaultBackground : TColor;
  public
    procedure ApplyAnimation(PainelBtn, PainelBorda : TPanel);
    class function New : ITypeButton;
  end;

implementation

{ TBtnPrimary }

procedure TBtnPrimary.ApplyAnimation(PainelBtn, PainelBorda: TPanel);
begin
  PainelBorda.Color    := ColorDefaultBord;
  PainelBtn.Color      := ColorDefaultBackground;
  PainelBtn.Font.Color := ColorDefaultBord;

  PainelBtn.OnMouseEnter := Enter;
  PainelBtn.OnMouseLeave := Leave;
end;

function TBtnPrimary.ColorDefaultBackground: TColor;
begin
  Result := $00FFFFFF;
end;

function TBtnPrimary.ColorDefaultBord: TColor;
begin
  Result := $00FF7B00;
end;

procedure TBtnPrimary.Enter(sender: TObject);
begin
  TPanel(sender).Color      := $00FF7B00;
  TPanel(sender).Font.Color := $00FFFFFF;
end;

procedure TBtnPrimary.Leave(sender: TObject);
begin
  TPanel(sender).Color      := $00FFFFFF;
  TPanel(sender).Font.Color := $00FF7B00;
end;

function TBtnPrimary.MouseEnter: tNotifyEvent;
begin
  Result := Enter;
end;

function TBtnPrimary.MouseLeave: tNotifyEvent;
begin
  Result := Leave;
end;

class function TBtnPrimary.New: ITypeButton;
begin
  Result := Self.Create;
end;

end.
