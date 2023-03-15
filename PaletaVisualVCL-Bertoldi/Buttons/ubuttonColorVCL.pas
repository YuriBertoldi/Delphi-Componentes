unit ubuttonColorVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uITypeButton,
  Factory.TypeButton, uTypes;

type
  TTypeColorButtonHelper = record helper for tTypeColorButton
    procedure Apply(PainelBtn, PainelBorda : TPanel; typeButton : tTypeButton);
  end;

  TTypeButtonHelper = record helper for tTypeButton
    procedure Apply(PainelBtn, PainelBorda: TPanel; typeColor : tTypeColorButton);
    function ToInteger : integer;
  end;

  TbuttonColorVCL = class(TFrame)
    pnBorda: TPanel;
    pnBtn: TPanel;
  private
    FCaption: string;
    FonClick: tNotifyEvent;
    FTipoColor: tTypeColorButton;
    FTipo: tTypeButton;
    procedure SetCaption(const Value: string);
    procedure SetonClick(const Value: tNotifyEvent);
    procedure SetTipo(const Value: tTypeButton);
    procedure SetTipoColor(const Value: tTypeColorButton);
    { Private declarations }
  public
    { Public declarations }
  published
    property Caption : string read FCaption write SetCaption;
    property onClick : tNotifyEvent read FonClick write SetonClick;
    property TipoColor : tTypeColorButton read FTipoColor write SetTipoColor;
    property Tipo: tTypeButton read FTipo write SetTipo;
  end;

procedure Register;

implementation

{$R *.dfm}

procedure Register;
begin
  RegisterComponents('Visual Bertoldi', [TbuttonColorVCL]);
end;

procedure TbuttonColorVCL.SetCaption(const Value: string);
begin
  FCaption := Value;
  pnBtn.Caption := FCaption;
end;

procedure TbuttonColorVCL.SetonClick(const Value: tNotifyEvent);
begin
  FonClick := Value;
  pnBtn.OnClick := FonClick;
end;

procedure TbuttonColorVCL.SetTipo(const Value: tTypeButton);
begin
  FTipo     := Value;
  pnBtn.Tag := Value.ToInteger;
  FTipo.Apply(pnBtn, pnBorda, fTipoColor);
end;

procedure TbuttonColorVCL.SetTipoColor(const Value: tTypeColorButton);
begin
  FTipoColor := Value;
  FTipoColor.Apply(pnBtn, pnBorda, Ftipo);
end;

procedure TTypeColorButtonHelper.Apply(PainelBtn, PainelBorda : TPanel; typeButton : tTypeButton);
begin
  TFactoryTypeButton.New(typeButton, self).ApplyAnimation(PainelBtn, PainelBorda);
end;

procedure TTypeButtonHelper.Apply(PainelBtn, PainelBorda: TPanel; typeColor : tTypeColorButton);
begin
  TFactoryTypeButton.New(self, typeColor).ApplyAnimation(PainelBtn, PainelBorda);
end;

function TTypeButtonHelper.ToInteger: integer;
begin
  case Self of
    filled  : Result := 0;
    Outline : Result := 1;
  end;
end;

end.
