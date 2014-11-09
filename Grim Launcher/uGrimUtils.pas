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

unit uGrimUtils;

interface

function GetCdPath: string;
function GetGrimpath: string;
function CreateDefaultRegKeys : string;
function GetAllFilesOnHD: boolean;
function GetResumeSave: boolean;
function GetHDRun: boolean;
function GetCloseOnRun: boolean;
function GetDeveloperMode: boolean;
function CheckLatestGrimVersion: boolean;

implementation

uses
  windows, sysutils, jclregistry, jclstrings, jclfileutils;

const
  GrimFiles: array [0..20] of string = (
    'DATA000.LAB',
    'DATA001.LAB',
    'DATA002.LAB',
    'DATA003.LAB',
    'DATA004.LAB',
    'GRIM.TAB',
    'MOVIE00.LAB',
    'MOVIE01.LAB',
    'MOVIE02.LAB',
    'MOVIE03.LAB',
    'MOVIE04.LAB',
    'VOX0000.LAB',
    'VOX0001.LAB',
    'VOX0002.LAB',
    'VOX0003.LAB',
    'VOX0004.LAB',
    'YEAR0MUS.LAB',
    'YEAR1MUS.LAB',
    'YEAR2MUS.LAB',
    'YEAR3MUS.LAB',
    'YEAR4MUS.LAB');

//Read Cd Drive key from registry
function GetCdPath: string;
begin
  try
    Result:=RegReadString(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0','source path');
  Except On EJclRegistryError do

  end;
end;

//Read Path to Grim from Registry
function GetGrimpath: string;
begin
  try
    result:=ExtractFilePath(RegReadString(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0','executable'));
  Except On EJclRegistryError do

  end;
end;

//Get Developer Mode
function GetDeveloperMode: boolean;
begin
  try
    if RegReadString(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0','good_times') = 'true' then
      result:=true
    else
      result:=false;
  Except On EJclRegistryError do
    result:=false;
  end;
end;

//Get resume saved game
function GetResumeSave: boolean;
begin
  if RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','resumesave')= 1 then
    result:=true
  else
    result:=false;
end;

//Get if launcher should run Grim from HD or cd
function GetHDRun: boolean;
begin
  if RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','hdrun')= 1 then
    result:=true
  else
    result:=false;
end;

//Get if launcher should close on run
function GetCloseOnRun: boolean;
begin
  if RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','closeonrun')=1 then
    result:=true
  else
    result:=false;
end;

//Create Default Reg Keys
function CreateDefaultRegKeys : string;
begin
  RegCreateKey(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','0');

  try
    RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','hdrun')

    Except On EJclRegistryError do //Default to yes - if the files arent there then the launcher will disable this again
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'hdrun', 1);
  end;

  try
    RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','closeonrun')

    Except On EJclRegistryError do
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'closeonrun', 0);
  end;

  try
    RegReadInteger(HKEY_CURRENT_USER,'Software\Quick And Easy\Grim Launcher','resumesave')

    Except On EJclRegistryError do
      RegWriteInteger(HKEY_CURRENT_USER, 'Software\Quick And Easy\Grim Launcher', 'resumesave', 0);
  end;

  //Good_Times key
  try
    RegReadString(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0', 'good_times')

    Except On EJclRegistryError do
      RegWriteString(HKEY_LOCAL_MACHINE, 'SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0', 'good_times', 'true');
  end;
end;


//Check Grim Version
function CheckLatestGrimVersion: boolean;
var
  Version: TJclFileVersionInfo;
  strTemp: string;
begin
  try
    Version:=tjclfileversioninfo.Create(GetGrimpath + 'GrimFandango.exe');
    try
      strTemp:=Version.FileVersion;
      StrReplace(strTemp, '.', '', [rfReplaceAll]);
      if StrToInt(strTemp) < 101 then result:=false
      else result:=true;
    finally
      Version.Free;
    end;
  Except On EJclFileVersionInfoError do //original exe has no version
    result:=false;
  end;
end;

//Check Grim Files
function GetAllFilesOnHD: boolean;
var
  i: integer;
begin
  Result:=true;
  for I := 0 to High(GrimFiles) do
  begin
    if FileExists(GetGrimPath + GrimFiles[i]) = false then
    begin
      result:=false;
      exit;
    end;
  end;
end;

end.
