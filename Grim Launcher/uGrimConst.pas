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

unit uGrimConst;

interface

const
{************************************Global************************************}
  strAppVersion:         string = '1.6.1';
  strAppTitle:           string = 'Grim Fandango Launcher';

{**********************************Main Form***********************************}
  strPatchFileName:             string = 'gfupd101.exe';
  strStatusRunFromHd:           string = 'Running Grim from Hard Drive';
  strStatusRunFromCd:           string = 'Running Grim from Cd drive ';
  strPatchInstallPrompt:        string = 'You do not have the Grim Fandango patch installed.'
                                          + #13 + 'Install it now?';
  strRegKeysNotFound:           string = 'Grim Fandango registry keys not found!'
                                          + #13 +
                                          'The launcher will not function correctly without these registry keys.'
                                          + #13 + #13 +
                                          'The easiest way to fix this is to re-install the game.';
  strGrimExeName:               string = 'GRIMFANDANGO.EXE';
  strReadmeName:                string = 'Readme.txt';
  strFileNotFound:              string = 'File not found: ';
  strErrNoNetConnection:        string = 'No active internet connection found';
  strErrDownload:               string = 'Error while downloading ';
  strErrLecReadmeNotFound:      string = 'Lucasarts readme file not found!';

{*********************************Options Form*********************************}
  strInsertDiskA:        string = 'Insert Grim Fandango Disc A in any drive';
  strInsertDiskB:        string = 'Insert Grim Fandango Disc B in any drive';
  strCopyFilesMsg:       string = 'You are missing some of the required files'
                                  + #13 +
                                  'Grim Fandango Launcher will now copy some files from the Grim cd''s to your hard drive.';

implementation

end.
