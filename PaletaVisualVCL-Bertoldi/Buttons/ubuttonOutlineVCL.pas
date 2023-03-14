unit ubuttonOutlineVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uITypeButton,
  Factory.TypeButton;

type
  TTypeButtonHelper = record helper for tTypeButton
    procedure Apply(PainelBtn, PainelBorda : TPanel);
  end;


  TbuttonOutlineVCL = class(TFrame)
    pnBorda: TPanel;
    pnBtn: TPanel;
  private
    FCaption: string;
    FonClick: tNotifyEvent;
    FTipo: tTypeButton;
    procedure SetCaption(const Value: string);
    procedure SetonClick(const Value: tNotifyEvent);
    procedure SetTipo(const Value: tTypeButton);
    { Private declarations }
  public
    { Public declarations }
  published
    property Caption : string read FCaption write SetCaption;
    property onClick : tNotifyEvent read FonClick write SetonClick;
    property Tipo : tTypeButton read FTipo write SetTipo;
  end;

procedure Register;

implementation

{$R *.dfm}

procedure Register;
begin
  RegisterComponents('Visual Bertoldi', [TbuttonOutlineVCL]);
end;

procedure TbuttonOutlineVCL.SetCaption(const Value: string);
begin
  FCaption := Value;
  pnBtn.Caption := FCaption;
end;

procedure TbuttonOutlineVCL.SetonClick(const Value: tNotifyEvent);
begin
  FonClick := Value;
  pnBtn.OnClick := FonClick;
end;

procedure TbuttonOutlineVCL.SetTipo(const Value: tTypeButton);
begin
  FTipo := Value;
  FTipo.Apply(pnBtn, pnBorda);
end;

{ TTypeButtonHelper }

procedure TTypeButtonHelper.Apply(PainelBtn, PainelBorda : TPanel);
begin
  TFactoryTypeButton.new(self).ApplyAnimation(PainelBtn, PainelBorda);
end;

end.
