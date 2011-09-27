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

unit uGrimConst;

interface

const
{************************************Global************************************}
  strAppVersion:         string = '1.5';
  strAppTitle:           string = 'Grim Fandango Launcher';

{**********************************Main Form***********************************}
  strPatchFileName:      string = 'gfupd101.exe';
  strStatusRunFromHd:    string = 'Running Grim from Hard Drive';
  strStatusRunFromCd:    string = 'Running Grim from Cd drive ';
  strPatchInstallPrompt: string = 'You do not have the Grim Fandango patch installed.'
                                  + #13 + 'Install it now?';
  strRegKeysNotFound:    string = 'Grim Fandango registry keys not found!'
                                  + #13 +
                                  'The launcher will not function correctly without these registry keys.'
                                  + #13 + #13 +
                                  'The easiest way to fix this is to re-install the game.';
  strGrimExeName:        string = 'GRIMFANDANGO.EXE';
  strReadmeName:         string = 'Readme.txt';
  strFileNotFound:       string = 'File not found: ';
  strErrNoNetConnection: string = 'No active internet connection found';
  strErrDownload:        string = 'Error while downloading ';

{*********************************Options Form*********************************}
  strInsertDiskA:        string = 'Insert Grim Fandango Disc A in any drive';
  strInsertDiskB:        string = 'Insert Grim Fandango Disc B in any drive';
  strCopyFilesMsg:       string = 'You are missing some of the required files'
                                  + #13 +
                                  'Grim Fandango Launcher will now copy some files from the Grim cd''s to your hard drive.';

implementation

end.
