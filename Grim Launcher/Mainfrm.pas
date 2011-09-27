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
BEFORE RELEASE:
    DISABLE ReportMemoryLeaksOnShutdown in project .dpr
    Change build configuration from debug to release
    Update readme
    Replace readme in MainResources with new one
    Compress with UPX
}

{
TODO:

}

unit Mainfrm;

interface           

uses
  Windows, Messages, SysUtils, Classes, Forms, ComCtrls, ExtCtrls, Math,
  Dialogs, Controls, ImgList, Jpeg,
  PngImageList, AdvGlowButton, WebCopy,
  JCLFileUtils, JCLRegistry, JCLShell,
  uVistaFuncs, uGrimUtils, uGrimConst;

type
  TfrmMain = class(TForm)
    ImageMain: TImage;
    StatusBar1: TStatusBar;
    WebCopy1: TWebCopy;
    btnWindowed: TAdvGlowButton;
    btnReadMeLec: TAdvGlowButton;
    btnReadMeLauncher: TAdvGlowButton;
    btnOptions: TAdvGlowButton;
    btnResumeSave: TAdvGlowButton;
    btnDebug: TAdvGlowButton;
    btnPlay: TAdvGlowButton;
    PngImageList1: TPngImageList;
    procedure FormCreate(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnWindowedClick(Sender: TObject);
    procedure btnReadmeLecClick(Sender: TObject);
    procedure btnReadmeLauncherClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure WebCopy1ConnectError(Sender: TObject);
    procedure WebCopy1URLNotFound(Sender: TObject; url: String);
    procedure WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
      ErrorInfo: String);
    procedure WebCopy1FileDone(Sender: TObject; idx: Integer);
    procedure btnResumeSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    strTempReadMeName: string;
    procedure ChooseImage;
    procedure UpgradeGrim;
    procedure UpdateStatusBar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Options, Debugfrm;

{$R *.dfm}
{$R MainResources.res}
{$R UAC.res}

//Load Jpeg from .res
function GetResourceAsJpeg(const ResName: string): TJPEGImage;
var
  resStream: TResourceStream;
begin
  resStream := TResourceStream.Create(hInstance, ResName, 'JPEG');
  try
    Result := TJPEGImage.Create;
    Result.LoadFromStream(resStream);
  finally
    resStream.Free;
  end;
end;

//Chose Image
procedure TfrmMain.ChooseImage;
var
  Jpg: TJPEGImage;
  i: integer;
begin
  Randomize;
  i:=RandomRange(1,8);

  Jpg:=GetResourceAsJpeg('GRIM' + inttostr(i));
  try
    ImageMain.Picture.Bitmap.Assign(jpg);
  finally
    Jpg.Free;
  end;
end;

//Upgrade Grim
procedure TfrmMain.UpdateStatusBar;
begin
  if GetHDRun then
    StatusBar1.SimpleText:=strStatusRunFromHd
  else
    StatusBar1.SimpleText:=strStatusRunFromCd + GetCdPath;
end;

procedure TfrmMain.UpgradeGrim;
var
  DlgResult: TModalResult;
begin
  DlgResult:=MessageDlg(strPatchInstallPrompt, mtConfirmation, [mbOk,mbCancel], 0);
  case DlgResult of
    mrOk:
      begin
        Webcopy1.Items.Items[0].targetdir:=PathGetTempPath;
        Webcopy1.Items.Items[0].TargetFilename:=strPatchFileName;
        WebCopy1.Execute;
      end;
    mrCancel:
      ;
  end;

end;

//Form Create
procedure TfrmMain.FormCreate(Sender: TObject);
begin
  //Set vista fonts if necessary
  SetDesktopIconFonts(Self.Font);

  CreateDefaultRegKeys;

  ChooseImage;

  if GetGrimPath='' then
    ShowMessage(strRegKeysNotFound);


  //Getting the temp file name also seems to create it, so rename it to html for the readme
  strTempReadMeName:=FileGetTempName('GRM');
  RenameFile(strTempReadMeName, strTempReadMeName + '.html');
  strTempReadMeName:=strTempReadMeName + '.html';


  if GetResumeSave=true then
  begin
    btnResumeSave.ImageIndex:=1;
    btnResumeSave.Tag:=1;
  end
  else
  begin
    btnResumeSave.ImageIndex:=0;
    btnResumeSave.Tag:=0;
  end;

  {Check - if run from hard drive, then make sure all files are there -
           if they arent then disable running from hd.}
  if GetHDRun then
    if GetAllFilesOnHd=false then
      regwriteinteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'hdrun', 0);

  UpdateStatusBar;

  if FileExists(GetGrimpath + strGrimExeName) then
  begin
    if CheckLatestGrimVersion=false then
      UpgradeGrim;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  //Remove the temporary file if it was created
  if FileExists(strTempReadMeName) then
    DeleteFile(strTempReadMeName);

  //Remove the downloaded grim patch if it exists  
  if FileExists(PathGetTempPath + strPatchFileName) then
    DeleteFile(PathGetTempPath + strPatchFileName);
end;

//Play Button Click
procedure TfrmMain.btnPlayClick(Sender: TObject);
var
  Buffer: Pointer;
  SaveParam: string;
begin
  Getmem(Buffer, 16);
  try
    Fillchar(Buffer^, 16, 0);
    RegWriteBinary(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0', 'LastDisplayDevice', Buffer^, 16);
  finally
    Freemem(Buffer);
  end;

  try
    RegDeleteEntry(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0', 'GrimLastSet');
  Except On EJclRegistryError do
  
  end;

  if btnResumeSave.tag=0 then
    SaveParam:=''
  else
  if btnResumeSave.tag=1 then
    SaveParam:='-s';
    

  if GetHDRun then
    ShellExec(0, 'open', GetGrimPath + strGrimExeName, SaveParam, GetGrimPath, SW_NORMAL)
  else
    ShellExec(0, 'open', GetGrimPath + strGrimExeName, SaveParam, GetCdPath, SW_NORMAL);

  if GetCloseOnRun then
    Close;
end;

//Windowed Button Click
procedure TfrmMain.btnWindowedClick(Sender: TObject);
var
  SaveParam: string;
begin
  try
    RegDeleteEntry(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0', 'GrimLastSet');
  Except On EJclRegistryError do

  end;

  if btnResumeSave.tag=0 then
    SaveParam:=''
  else
  if btnResumeSave.tag=1 then
    SaveParam:=' -s';

  if GetHDRun then
    shellexec(0,'open', GetGrimPath + strGrimExeName, '-w' + SaveParam, GetGrimPath, SW_NORMAL)
  else
    shellexec(0,'open', GetGrimPath + strGrimExeName, '-w' + SaveParam, GetCdPath, SW_NORMAL);

  if GetCloseOnRun then
    Close;
end;

//Readme Button Click
procedure TfrmMain.btnReadmeLecClick(Sender: TObject);
begin
  if GetGrimPath='' then
  else
    ShellExec(0, 'open', GetGrimPath + strReadmeName, '', '', SW_NORMAL);
end;

//Readme Launcher Button Click
procedure TfrmMain.btnReadmeLauncherClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if strTempReadMeName = '' then exit;

  resStream:=TResourceStream.Create(0, 'README', 'HTML');
  try
    resStream.SaveToFile(strTempReadMeName);
    shellexec(0, 'open', strTempReadMeName, '', ExtractFilePath(strTempReadMeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

//Resume Last Save Button Click
procedure TfrmMain.btnResumeSaveClick(Sender: TObject);
begin
  if btnResumeSave.Tag=1 then
  begin
    btnResumeSave.ImageIndex:=0;
    btnResumeSave.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'resumesave', 0);
  end
  else
  if btnResumeSave.Tag=0 then
  begin
    btnResumeSave.ImageIndex:=1;
    btnResumeSave.Tag:=1;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'resumesave', 1);
  end
end;

//Options Button Click
procedure TfrmMain.btnOptionsClick(Sender: TObject);
begin
  frmOptions.ShowModal;

  UpdateStatusBar;
end;

//Debug Keys Button Click
procedure TfrmMain.btnDebugClick(Sender: TObject);
begin
  frmDebug.Show;
end;

//Webcopy Connect Error
procedure TfrmMain.WebCopy1ConnectError(Sender: TObject);
begin
  ShowMessage(strErrNoNetConnection);
end;

//Webcopy URL Not Found
procedure TfrmMain.WebCopy1URLNotFound(Sender: TObject; url: String);
begin
  ShowMessage(strFileNotFound + url);
end;

//Webcopy Error Info
procedure TfrmMain.WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
  ErrorInfo: String);
begin
  ShowMessage(strErrDownload + chr(10) + ErrorInfo);
end;

//Webcopy File Done
procedure TfrmMain.WebCopy1FileDone(Sender: TObject; idx: Integer);
begin
  ShellExec(0,'open', PathGetTempPath + strPatchFileName, '', GetGrimPath, SW_NORMAL);
end;

end.
