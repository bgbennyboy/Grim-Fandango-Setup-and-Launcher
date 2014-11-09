{
******************************************************
  Grim Fandango Launcher
  2004-2014 By Bennyboy
  Http://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}

unit Debugfrm;

interface

uses
  Windows, Messages, Controls, Classes, Forms, ExtCtrls,
  mswheel, pngimage;

type
  TfrmDebug = class(TForm)
    ScrollBox1: TScrollBox;
    MSWheel1: TMSWheel;
    Image1: TImage;
    procedure MSWheel1WheelEvent(zdelta, xpos, ypos, ScrollLines: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDebug: TfrmDebug;

implementation

{$R *.dfm}

procedure TfrmDebug.FormCreate(Sender: TObject);
var
  Png: TPngImage;
begin
  Png := TPngImage.Create;
  try
    Png.LoadFromResourceName(HInstance, 'DebugKeys');
    Image1.Picture.Graphic := Png;
  finally
    Png.Free;
  end;

end;

procedure TfrmDebug.MSWheel1WheelEvent(zdelta, xpos, ypos,
  ScrollLines: Integer);
begin
  //showmessage('Z= ' + inttostr(zdelta) +  ' X= ' + inttostr(xpos) + ' Y= ' + inttostr(ypos));
  if zdelta < 0 then
    ScrollBox1.VertScrollBar.Position:= ScrollBox1.VertScrollBar.Position +
      ScrollBox1.VertScrollBar.increment
  else
    ScrollBox1.VertScrollBar.Position:= ScrollBox1.VertScrollBar.Position -
      ScrollBox1.VertScrollBar.increment;
end;

end.
