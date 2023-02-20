;***************************************************************
;  Grim Fandango Setup
;  2004-2014 By Bennyboy
;  Http://quickandeasysoftware.net
;***************************************************************
;
;  This Source Code Form is subject to the terms of the Mozilla Public
;  License, v. 2.0. If a copy of the MPL was not distributed with this
;  file, You can obtain one at http://mozilla.org/MPL/2.0/.

;TODO
;Add other languages

[Setup]
VersionInfoVersion=1.3
VersionInfoCompany=Quick And Easy Software
VersionInfoDescription=Replacement installer for Grim Fandango
VersionInfoTextVersion=1.3
VersionInfoCopyright=Bennyboy 2023
AppCopyright=Bennyboy 2023
AppName=Grim Fandango
AppVerName=Grim Fandango

AppVersion=1.3
RestartIfNeededByRun=false
AllowRootDirectory=false
DefaultDirName={pf}\Lucasarts\Grim\
ShowLanguageDialog=auto
DefaultGroupName=Lucasarts\Grim Fandango\
OutputBaseFilename=GrimSetup
AppPublisher=Quick and Easy Software
AppPublisherURL=https://quickandeasysoftware.net
AppSupportURL=https://quickandeasysoftware.net
AppUpdatesURL=https://quickandeasysoftware.net
AppComments=Contact me via my contact page
AppContact=https://quickandeasysoftware.net/contact
UninstallDisplayIcon={app}\Grim Fandango Launcher.exe
UninstallDisplayName=Grim Fandango
DisableProgramGroupPage=false
AllowNoIcons=true
AlwaysUsePersonalGroup=false
PrivilegesRequired=admin
AppID={code:GetAppID|''}
WizardImageFile=Large_Wizard_Image.bmp
WizardSmallImageFile=Small_Wizard_Image.bmp
InfoBeforeFile=Before.rtf
UsePreviousLanguage=no
VersionInfoProductName=Grim Fandango Setup
VersionInfoProductVersion=1.3
VersionInfoProductTextVersion=1.3
SetupIconFile=Grim_Icon.ico

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
Source: ..\Grim Launcher\GrimLauncher.exe; DestDir: {app}; DestName: Grim Fandango Launcher.exe;
Source: ..\Grim Launcher\ReadMe\Grim Fandango Launcher.html; DestDir: {app}


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

#include "FindCd.iss"

var
	SourceDrive: string;
	CallCount: integer;
	UserPage: TOutputMsgMemoWizardPage;

const
	CD1UniqueFile = 'GRIMDATA\DATA001.LAB';
	strAlreadyInstalled = 'Grim Fandango is already installed!' + #13#10#13#10 + 'Continue anyway? (Existing files will be overwritten).';
	strCD1Error = 'Couldn''t find Grim Fandango CD A in any drive!' + #13#10#13#10 + 'Make sure you''ve got the correct cd in the drive and try again.';
	strUserPageMemoText = 'Setup will search all drives and find the CD.' + #13#10#13#10 + 'In rare cases the search may not complete and setup will hang.' + #13#10 +  'If this happens then its because Windows cannot get information about all the drives on your system. Try disabling any virtual cd devices such as Daemon Tools, check that your drives work or as a last resort - restart in safe mode and run this installer from there.';
	strUserPageTitle = 'Insert CD A';
	strUserPageHeader = 'Please insert Grim Fandango CD A in any drive';
	strUserPageText = 'When you have done this click next';
	strCD2Prompt = 'Please insert Grim Fandango CD B and press OK.' +  #13#10  'If you are using a virtual drive, then unmount CD 1 and remount CD 2 in the same drive' + #13#10#13#10 + 'Or press cancel to exit setup.';

	
function IsX64: Boolean;
begin
	Result := Is64BitInstallMode;
end;

function GetSourceDrive(Param: String): String;
begin
	Result:=SourceDrive;
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

procedure InitializeWizard();
begin
	if IsUpgrade() then
	begin
		if MsgBox(strAlreadyInstalled, mbError, MB_OKCANCEL)=IDCANCEL then
			abort;
	end;

	SourceDrive := '';

	UserPage := CreateOutputMsgMemoPage(wpReady, strUserPageTitle, strUserPageHeader, strUserPageText, strUserPageMemoText);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
	if CurPageID = UserPage.ID then
	begin
		if SourceDrive = '' then
		begin
			SourceDrive:=GetSourceCdDrive(CD1UniqueFile);
			if SourceDrive <> '' then
				result := true
			else
			begin
				result := false;
				MsgBox(strCD1Error, mbError, MB_OK);
			end;
		end;
	end
	else
		Result := true;
end;

function CD2(): Boolean;
begin
	result:=true;

	{Extra check here:
		If its already been installed and you are installing again over the top then
		the FileExists() check below will pass and it'll jump straight to prompting
		for cd2 - it wont even bother copying files off cd1.
	}

	{
	CallCount:
		To make matters worse, this CD2() check function gets called multiple times
		when doing an 'upgrade install'. The only reliable way I've found of knowing
		when to let it show the CD2 MessageBox because it wants to copy the files is to
		count how many times this function is called.
	}

	Inc(CallCount);

	if ( IsUpgrade() ) and ( CallCount < 3) then
	begin
		//MsgBox('Its an upgrade install!', mbError, MB_OKCANCEL);
		result:=true;
	end
	else
	if (FileExists(AddBackslash(ExpandConstant('{app}')) + 'GRIM.EXE')) and (FileExists(AddBackslash(ExpandConstant('{app}')) + 'WEBSITE.EXE')) then //cd1 has copied all its files
	begin
		while FileExists(AddBackslash(ExpandConstant('{code:GetSourceDrive}')) + 'GRIMDATA\DATA002.LAB') = false do
		begin
			if MsgBox(strCD2Prompt, mbError, MB_OKCANCEL)=IDOK then

			else
			begin
				WizardForm.Close();
				exit;
			end;
		end;
	end;
end;