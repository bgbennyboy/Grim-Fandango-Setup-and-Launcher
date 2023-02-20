{
******************************************************
  Grim Fandango Launcher
  2004-2013 By Bennyboy
  Https://quickandeasysoftware.net
******************************************************
}
{
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.
}
{
BEFORE RELEASE:
    Change build configuration from debug to release
    Update readme
    Replace readme in resources with new one
}

unit Mainfrm;

interface           

uses
  Windows, Messages, SysUtils, Classes, Forms, ComCtrls, ExtCtrls, Math,
  Dialogs, Controls, Jpeg, UITypes,
  AdvGlowButton, WebCopy,
  JCLFileUtils, JCLRegistry, JCLShell, JCLSysInfo,
  uGrimUtils, uGrimConst;

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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    strTempReadMeName: string;
    procedure ChooseImage;
    procedure UpgradeGrim;
    procedure UpdateStatusBar;
    function GetResourceAsJpeg(const ResName: string): TJPEGImage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Options, Debugfrm;

{$R *.dfm}

//Load Jpeg from .res
function TfrmMain.GetResourceAsJpeg(const ResName: string): TJPEGImage;
var
  resStream: TResourceStream;
begin
  resStream := TResourceStream.Create(HInstance, ResName, RT_RCDATA);
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

//Upgrade Grim
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
  CreateDefaultRegKeys;

  ChooseImage;

  if GetGrimPath='' then
    MessageDlg(strRegKeysNotFound, mtError, [mbOk], 0);

  strTempReadMeName := FindUnusedFileName( IncludeTrailingPathDelimiter( GetWindowsTempFolder) + 'GRIMLAUNCHERREADME', '.html', '-new');

  if GetResumeSave=true then
  begin
    btnResumeSave.Tag:=1;
    btnResumeSave.Picture.LoadFromResourceName(HInstance, 'ResumeLastSaveTick');
  end
  else
  begin
    btnResumeSave.Tag:=0;
    btnResumeSave.Picture.LoadFromResourceName(HInstance, 'ResumeLastSaveCross');
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

  if GetLauncherSounds then
    PlaySoundFromResource('StartSound');
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

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then //Escape key
    Close;
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
var
  FileName: string;
begin
  if GetGrimPath='' then exit;

  if GetLauncherSounds then
    PlaySoundFromResource('ClickSound');

  FileName := GetGrimPath + strReadmeName;
  if FileExists(FileName) = false then
  begin
    MessageDlg(strErrLecReadmeNotFound, mtError, [mbOk], 0);
    Exit;
  end;

  ShellExec(0, 'open', FileName, '', '', SW_NORMAL);
end;

//Readme Launcher Button Click
procedure TfrmMain.btnReadmeLauncherClick(Sender: TObject);
var
  resStream: TResourceStream;
begin
  if strTempReadMeName = '' then exit;

  if GetLauncherSounds then
    PlaySoundFromResource('ClickSound');

  resStream:=TResourceStream.Create(0, 'README', 'TEXT');
  try
    resStream.SaveToFile(strTempReadMeName);
    //Fix for opening webpage in Windows 8. Normally doesnt work from elevated process - this way lets it run as non-elevated
    shellexec(0, 'open', 'explorer.exe', strTempReadMeName, ExtractFilePath(strTempReadMeName), SW_NORMAL);
  finally
    resStream.Free;
  end;
end;

//Resume Last Save Button Click
procedure TfrmMain.btnResumeSaveClick(Sender: TObject);
begin
  if GetLauncherSounds then
    PlaySoundFromResource('ClickSound');

  if btnResumeSave.Tag=1 then
  begin
    btnResumeSave.Picture.LoadFromResourceName(HInstance, 'ResumeLastSaveCross');
    btnResumeSave.Tag:=0;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'resumesave', 0);
  end
  else
  if btnResumeSave.Tag=0 then
  begin
    btnResumeSave.Picture.LoadFromResourceName(HInstance, 'ResumeLastSaveTick');
    btnResumeSave.Tag:=1;
    RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'resumesave', 1);
  end
end;

//Options Button Click
procedure TfrmMain.btnOptionsClick(Sender: TObject);
begin
  if GetLauncherSounds then
    PlaySoundFromResource('ClickSound');

  frmOptions.ShowModal;

  UpdateStatusBar;
end;

//Debug Keys Button Click
procedure TfrmMain.btnDebugClick(Sender: TObject);
begin
  if GetLauncherSounds then
    PlaySoundFromResource('ClickSound');

  frmDebug.Show;
end;

//Webcopy Connect Error
procedure TfrmMain.WebCopy1ConnectError(Sender: TObject);
begin
  MessageDlg(strErrNoNetConnection, mtError, [mbOk], 0);
end;

//Webcopy URL Not Found
procedure TfrmMain.WebCopy1URLNotFound(Sender: TObject; url: String);
begin
  MessageDlg(strFileNotFound + url, mtError, [mbOk], 0);
end;

//Webcopy Error Info
procedure TfrmMain.WebCopy1ErrorInfo(Sender: TObject; ErrorCode: Integer;
  ErrorInfo: String);
begin
  MessageDlg(strErrDownload + chr(10) + ErrorInfo, mtError, [mbOk], 0);
end;

//Webcopy File Done
procedure TfrmMain.WebCopy1FileDone(Sender: TObject; idx: Integer);
begin
  ShellExec(0,'open', PathGetTempPath + strPatchFileName, '', GetGrimPath, SW_NORMAL);
end;

end.
