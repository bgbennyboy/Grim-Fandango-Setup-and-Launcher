{
******************************************************
  Grim Fandango Launcher
  Copyright (c) 2004-2008 Bgbennyboy
  Http://quick.mixnmojo.com
******************************************************
}
{
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either version 2
  of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
}

{
  Size of image should always be slightly larger than size of form so that
  the scrollbox is activated. Autosize makes this happen.
}

unit Debugfrm;

interface

uses
  Windows, Messages, Controls, Classes, Forms, ExtCtrls,
  mswheel, PngImageList;

type
  TfrmDebug = class(TForm)
    ScrollBox1: TScrollBox;
    MSWheel1: TMSWheel;
    PngImageCollectionDebugKeys: TPngImageCollection;
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
begin
  Image1.Picture.Bitmap.Assign(PngImageCollectionDebugKeys.Items[0].PngImage);
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
