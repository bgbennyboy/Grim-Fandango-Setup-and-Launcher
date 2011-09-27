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

unit Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Forms, ImgList, Controls, Dialogs,
  PngImageList,
  JvBaseDlg, JvSHFileOperation, AdvGlowButton,
  JCLRegistry, JCLFileUtils,
  uGrimUtils, uGrimConst;

type
  TfrmOptions = class(TForm)
    JvSHFileOperation1: TJvSHFileOperation;
    btnCloseOnRun: TAdvGlowButton;
    btnHdRun: TAdvGlowButton;
    PngImageList1: TPngImageList;
    procedure FormShow(Sender: TObject);
    procedure btnCloseOnRunClick(Sender: TObject);
    procedure btnHdRunClick(Sender: TObject);
  private
    procedure CopyFiles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

{$R *.dfm}   


//Form Show
procedure TfrmOptions.FormShow(Sender: TObject);
begin
  if GetCloseOnRun then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
  end
  else
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
  end;

  if GetHDRun then
  begin
    btnHdRun.ImageIndex:=3;
    btnHdRun.Tag:=1
  end
  else
  begin
    btnHdRun.ImageIndex:=2;
    btnHdRun.Tag:=0;
  end;

end;

//Copy Files
procedure TfrmOptions.CopyFiles;
var
  S: char;
  boolFound: boolean;
  DlgResult: TModalResult;
begin
  repeat

    DlgResult:=MessageDlg(strInsertDiskA, mtConfirmation, [mbOk,mbCancel], 0);
    case DlgResult of
      mrOk:
        ;
      mrCancel:
        exit;
    end;

    boolFound:=false;
    s:='A';
    repeat
    GetDriveTypeStr(s);
      if GetDriveTypeStr(s)='CD-ROM' then
        begin
          if FileExists(s + ':\GRIMDATA\DATA000.LAB') then
          begin
            boolFound:=true;
            break;
          end;
        end;
    inc(s);
    until s='Z';

  until boolFound=true;

  begin

    JvSHFileOperation1.SourceFiles.Clear;
    JvSHFileOperation1.DestFiles.Clear;
    //jvshfileoperation1.SourceFiles.Add(s + ':\GRIMDATA\GRIM.TAB'); ///
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\DATA000.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\DATA001.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\DATA003.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\MOVIE00.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\MOVIE01.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\MOVIE03.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\VOX0000.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\VOX0001.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\VOX0003.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\YEAR0MUS.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\YEAR1MUS.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\YEAR3MUS.LAB');

    JvSHFileOperation1.DestFiles.Add(GetGrimPath);
    JvSHFileOperation1.Execute;
  end;

  repeat

    DlgResult:=MessageDlg(strInsertDiskB, mtConfirmation, [mbOk,mbCancel], 0);
    case DlgResult of
      mrOk:
        ;
      mrCancel:
        exit;
    end;

    boolFound:=false;
    s:='A';
    repeat
    GetDriveTypeStr(s);
      if GetDriveTypeStr(s)='CD-ROM' then
        begin
          if FileExists(s + ':\GRIMDATA\DATA002.LAB') then
          begin
            boolFound:=true;
            break;
          end;
        end;
    inc(s);
    until s='Z';

  until boolFound=true;

  begin

    JvSHFileOperation1.SourceFiles.Clear;
    JvSHFileOperation1.DestFiles.Clear;
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\CREDITS.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\DATA002.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\DATA004.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\MOVIE02.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\MOVIE04.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\VOX0002.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\VOX0004.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\YEAR2MUS.LAB');
    JvSHFileOperation1.SourceFiles.Add(s + ':\GRIMDATA\YEAR4MUS.LAB');
    JvSHFileOperation1.DestFiles.Add(GetGrimPath);
    JvSHFileOperation1.Execute;
  end;
end;

//CloseOnRun Button Click
procedure TfrmOptions.btnCloseOnRunClick(Sender: TObject);
begin
  if btnCloseOnRun.Tag=1 then
  begin
    btnCloseOnRun.ImageIndex:=0;
    btnCloseOnRun.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'closeonrun', 0);
  end
  else
  if btnCloseOnRun.Tag=0 then
  begin
    btnCloseOnRun.ImageIndex:=1;
    btnCloseOnRun.Tag:=1;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'closeonrun', 1);
  end
end;

//HdRun Button Click
procedure TfrmOptions.btnHdRunClick(Sender: TObject);
begin
  if btnHdRun.Tag=0 then
  begin
    if GetAllFilesOnHD=false then
    begin
      ShowMessage(strCopyFilesMsg);
      CopyFiles;
      if GetAllFilesOnHD=true then
      begin
        btnHdRun.ImageIndex:=3;
        btnHdRun.Tag:=1;
        RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'hdrun', 1);
      end;
    end
    else
    begin
      btnHdRun.ImageIndex:=3;
      btnHdRun.Tag:=1;
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'hdrun', 1);
    end;
  end
  else
  if btnHdRun.Tag=1 then
  begin
    btnHdRun.ImageIndex:=2;
    btnHdRun.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'hdrun', 0);
  end;
end;

end.
