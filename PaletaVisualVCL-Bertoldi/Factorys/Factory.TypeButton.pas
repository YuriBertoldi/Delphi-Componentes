unit Factory.TypeButton;

interface

uses uITypeButton, uBtnPrimary.TypeButton.Model, uBtnSecondary.TypeButton.Model;

type
  TFactoryTypeButton = class
  public
    class function new(Value : tTypeButton) : ITypeButton;
  end;

implementation

{ TFactoryTypeButton }

class function TFactoryTypeButton.new(Value: tTypeButton): ITypeButton;
begin
  case Value of
    Primary  : Result := TBtnPrimary.new;
    Secondary: Result := TBtnSecondary.new;
  end;
end;

end.
