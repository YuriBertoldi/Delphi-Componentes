unit uBtnSecondary.TypeButton.Model;

interface

uses uITypeButton, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TBtnSecondary = class(TInterfacedObject, iTypeButton)
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

procedure TBtnSecondary.ApplyAnimation(PainelBtn, PainelBorda: TPanel);
begin
  PainelBorda.Color    := ColorDefaultBord;
  PainelBtn.Color      := ColorDefaultBackground;
  PainelBtn.Font.Color := ColorDefaultBord;

  PainelBtn.OnMouseEnter := Enter;
  PainelBtn.OnMouseLeave := Leave;
end;

function TBtnSecondary.ColorDefaultBackground: TColor;
begin
  Result := $00FFFFFF;
end;

function TBtnSecondary.ColorDefaultBord: TColor;
begin
  Result := $00959391;
end;

procedure TBtnSecondary.Enter(sender: TObject);
begin
  TPanel(sender).Color      := $00959391;
  TPanel(sender).Font.Color := $00FFFFFF;
end;

procedure TBtnSecondary.Leave(sender: TObject);
begin
  TPanel(sender).Color      := $00FFFFFF;
  TPanel(sender).Font.Color := $00959391;
end;

function TBtnSecondary.MouseEnter: tNotifyEvent;
begin
  Result   := Enter;
end;

function TBtnSecondary.MouseLeave: tNotifyEvent;
begin
  Result   := Leave;
end;

class function TBtnSecondary.New: ITypeButton;
begin
  Result := Self.Create;
end;

end.
