;***************************************************************
;  Grim Fandango Setup
;  Copyright (c) 2007-2008 Bgbennyboy
;  Http://quick.mixnmojo.com
;***************************************************************
;
;  This program is free software; you can redistribute it and/or
;  modify it under the terms of the GNU General Public License
;  as published by the Free Software Foundation; either version 2
;  of the License, or (at your option) any later version.
;
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


[Setup]
VersionInfoVersion=1.0
VersionInfoCompany=Quick And Easy Software
VersionInfoDescription=Replacement installer for Grim Fandango
VersionInfoTextVersion=1.0
VersionInfoCopyright=bgbennyboy 2007
AppCopyright=bgbennyboy 2007
AppName=Grim Fandango
AppVerName=Grim Fandango
RestartIfNeededByRun=false
AllowRootDirectory=false
DefaultDirName={pf}\Lucasarts\Grim\
ShowLanguageDialog=auto
InternalCompressLevel=max
DefaultGroupName=Lucasarts\Grim Fandango\
OutputBaseFilename=GrimSetup
AppPublisher=Quick and Easy Software
AppPublisherURL=http://quick.mixnmojo.com
AppSupportURL=http://quick.mixnmojo.com
AppUpdatesURL=http://quick.mixnmojo.com
AppVersion=1.0
AppComments=Contact me via my contact page
AppContact=http://quick.mixnmojo.com/contact
UninstallDisplayIcon={app}\Grim Fandango Launcher.exe
UninstallDisplayName=Grim Fandango
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysUsePersonalGroup=false
PrivilegesRequired=admin
AppID={code:GetAppID|''}
WizardImageFile=Large_Wizard_Image.bmp
WizardSmallImageFile=Small_Wizard_Image.bmp
Compression=lzma
SolidCompression=false
InfoBeforeFile=Before.rtf

[Dirs]
Name: {app}\RESOURCE; Flags: uninsalwaysuninstall


[Files]
; ON CD 1
Source: {code:GetSourceDrive}GRIM.EXE; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}DIRECTX\DSETUP.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}DIRECTX\DSETUP16.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}DIRECTX\DSETUP32.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}DIRECTX\DXDIAG.CNT; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}DIRECTX\DXDIAG.EXE; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}DIRECTX\DXDIAG.HLP; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}GRIMDATA\CHORE.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\CREDITS.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\DATA000.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\DATA001.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\DATA003.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\GRIM.TAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\GrimFandango.EXE; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\HMIFXFP.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\HMIFXLIB.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\HMILIBS.INI; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\IMUSE.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\IMUSE.PSL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\LUA.DLL; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\MOVIE00.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\MOVIE01.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\MOVIE03.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\VOX0000.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\VOX0001.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\VOX0003.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\YEAR0MUS.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\YEAR1MUS.LAB; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}GRIMDATA\YEAR3MUS.LAB; DestDir: {app}; Flags: external

Source: {code:GetSourceDrive}INSTALL\LICENSE.TXT; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}INSTALL\README.TXT; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}INSTALL\REGISTER.EXE; DestDir: {app}; Flags: external
Source: {code:GetSourceDrive}INSTALL\WEBSITE.EXE; DestDir: {app}; Flags: external


; ON CD 2
Source: {code:GetSourceDrive}GRIMDATA\DATA002.LAB; DestDir: {app}; Flags: external; Check: CD2()
Source: {code:GetSourceDrive}GRIMDATA\DATA004.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\MOVIE02.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\MOVIE04.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\VOX0002.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\VOX0004.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\YEAR2MUS.LAB; DestDir: {app}; Flags: external; Check: 
Source: {code:GetSourceDrive}GRIMDATA\YEAR4MUS.LAB; DestDir: {app}; Flags: external; Check: 

;Compile into setup
Source: Grim Fandango Launcher.exe; DestDir: {app}
Source: Grim Fandango Launcher.html; DestDir: {app}


[Registry]
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: none; Flags: createvalueifdoesntexist uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Executable; ValueData: {app}\GrimFandango.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Install Path; ValueData: {app}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Source Path; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: CD Path; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Analyze Path; ValueData: {code:GetSourceDrive}\INSTALL\DXDIAG.exe
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: Source Dir; ValueData: {code:GetSourceDrive}
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: string; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: GrimDataDir; ValueData: {code:GetSourceDrive}\GRIMDATA
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: InstallType; ValueData: 00000009
Root: HKLM; Subkey: SOFTWARE\LucasArts Entertainment Company LLC\Grim Fandango\v1.0\; ValueType: dword; Flags: createvalueifdoesntexist uninsdeletekey; ValueName: MAGIC; ValueData: 00091010

[Icons]
Name: {group}\{cm:UninstallProgram,Grim Fandango}; Filename: {uninstallexe}; Comment: Uninstall Grim Fandango
Name: {group}\Launcher Readme; Filename: {app}\Grim Fandango Launcher.html; Comment: The readme file for the replacement launcher
Name: {group}\Lucasarts Readme; Filename: {app}\Readme.txt; Comment: The readme file that ships with the game
Name: {group}\Grim Fandango; Filename: {app}\Grim Fandango Launcher.exe; Comment: Run Grim Fandango; IconIndex: 0
Name: {userdesktop}\Grim Fandango; Filename: {app}\Grim Fandango Launcher.exe; IconIndex: 0; Tasks: " desktopicon"

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}

[Code]
var
	SourceDrive: string;
	CallCount: integer;

#include "FindCd.iss"

function IsX64: Boolean;
begin
	Result := Is64BitInstallMode;
end;

function GetAppID(param: String): String;
begin
	Result := 'bgbennyboyGrimReplacementSetup';
end;

function IsUpgrade(): Boolean; //is it already installed?
var
   sPrevPath: String;
begin
  sPrevPath := '';
  if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' + getAppID('') + '_is1', 'UninstallString', sPrevpath) then
	RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{getAppID('') + _is1', 'UninstallString', sPrevpath);
  Result := (sPrevPath <> '');
end;

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
end;

function CD2(): Boolean;
begin

	CallCount:=CallCount + 1;

	//Extra check here - if its already been installed and this installer is running again then
	//the files will be found - even though the files havent been copied off cd1 yet.
	//Without this check the CD2 prompt appears, the user has to insert cd2 and the installer then tries to copy files from CD1.

	if (IsUpgrade()) and (CallCount < 2) then //Need to check callcount because this check function is called multiple times before file copying even begins
	begin
		//MsgBox('Its an upgrade install!', mbError, MB_OKCANCEL);
		result:=true;
	end
	else

	//If these if's are both true then first+last file on cd1 have been copied, so we can assume that all file
	//copying on CD1 is done. Its therefore OK to display the CD2 prompt.
	//Without this check the CD2 prompt appears before the installation begins.

	if (FileExists(AddBackslash(ExpandConstant('{app}')) + 'GRIM.EXE')) and (FileExists(AddBackslash(ExpandConstant('{app}')) + 'WEBSITE.EXE')) then
	begin
		while not FileExists(AddBackslash(ExpandConstant('{code:GetSourceDrive}')) + 'GRIMDATA\DATA002.LAB') do
		begin
			if MsgBox('Please insert Grim Fandango Disc B in any drive and press OK.' + Chr(13) + Chr(13) +
				'Or press cancel to exit setup.', mbError, MB_OKCANCEL)=IDOK then

			else
			begin
				result:=false;
				WizardForm.Close();
				exit;
			end;
		end;
		result:=true;
	end

	else
		result:=true;
end;

procedure InitializeWizard();
begin
	if IsUpgrade() then
		if MsgBox('Grim Fandango is already installed!' + Chr(13) + Chr(13) + 'Continue anyway? (Existing files will be overwritten).', mbError, MB_OKCANCEL)=IDCANCEL then
			abort


	SourceDrive:=GetSourceCdDrive();
end;
