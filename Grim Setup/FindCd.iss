//***************************************************************
//  Grim Fandango Setup
//  Copyright (c) 2007-2008 Bgbennyboy
//  Http://quick.mixnmojo.com
//***************************************************************
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.


[Code]

var
	DrvLetters: array of String;

	function GetDriveType( lpDisk: String ): Integer;
	external 'GetDriveTypeA@kernel32.dll stdcall';

	function GetLogicalDriveStrings( nLenDrives: LongInt; lpDrives: String ): Integer;
	external 'GetLogicalDriveStringsA@kernel32.dll stdcall';

const
	UniqueFile = 'GRIMDATA\DATA001.LAB';

	DRIVE_UNKNOWN = 0; // The drive type cannot be determined.
	DRIVE_NO_ROOT_DIR = 1; // The root path is invalid. For example, no volume is mounted at the path.
	DRIVE_REMOVABLE = 2; // The disk can be removed from the drive.
	DRIVE_FIXED = 3; // The disk cannot be removed from the drive.
	DRIVE_REMOTE = 4; // The drive is a remote (network) drive.
	DRIVE_CDROM = 5; // The drive is a CD-ROM drive.
	DRIVE_RAMDISK = 6; // The drive is a RAM disk.

//Convert disk type to string
function DriveTypeString( dtype: Integer ): String ;
begin
	case dtype of
		DRIVE_NO_ROOT_DIR : Result := 'Root path invalid';
		DRIVE_REMOVABLE : Result := 'Removable';
		DRIVE_FIXED : Result := 'Fixed';
		DRIVE_REMOTE : Result := 'Network';
		DRIVE_CDROM : Result := 'CD-ROM';
		DRIVE_RAMDISK : Result := 'Ram disk';
		else
			Result := 'Unknown';
	end;
end;

procedure FindAllCdDrives();
var
	n: Integer;
	drivesletters: String; lenletters: Integer;
	drive: String;
	disktype, posnull: Integer;
	sd: String;
begin
	//get the system drive
	sd := UpperCase(ExpandConstant('{sd}'));

	//get all drives letters of system
	drivesletters := StringOfChar( ' ', 64 );
	lenletters := GetLogicalDriveStrings( 63, drivesletters );
	SetLength( drivesletters , lenletters );

	drive := '';
	n := 0;
	while ( (Length(drivesletters) > 0) ) do
	begin
		posnull := Pos( #0, drivesletters );
		if posnull > 0 then
		begin
			drive:= UpperCase( Copy( drivesletters, 1, posnull - 1 ) );

			// get number type of disk
			disktype := GetDriveType( drive );

			//Make sure its a cd drive
			if disktype = DRIVE_CDROM then
			begin
				SetArrayLength(DrvLetters, N+1);
				DrvLetters[n] := drive;
				n := n + 1;
			end;

			drivesletters := Copy( drivesletters, posnull+1, Length(drivesletters));
		end;
	end;
end;

function FindUniqueFile(): string;
var
	i: integer;
begin
	for i:=0 to GetArrayLength(DrvLetters) -1 do
	begin
		if FileExists( DrvLetters[i] + UniqueFile) then
		begin
			result:=DrvLetters[i];
			exit;
		end
		else

	end;

	result:='';
end;

function GetSourceCdDrive(): string;
begin
	FindAllCdDrives();
	if GetArrayLength(DrvLetters) < 1 then
	begin
		MsgBox('No cd drives were found on your system! Setup will now exit.', mbError, MB_OK);
		Abort;
	end;


	if FindUniqueFile() <> '' then
	begin
		//MsgBox('Found!!!!', mbError, MB_OK);
	end
	else
	begin
		while FindUniqueFile() = '' do
		begin
			if MsgBox('Please insert Grim Fandango Disc A in any drive and press OK.' + Chr(13) + Chr(13) +'Or press cancel to exit setup.', mbConfirmation, MB_OKCANCEL or MB_DEFBUTTON1) = IDOK then

			else
				Abort;
		end;
	end;

	Result:=FindUniqueFile(); //Not a nice way of doing things at all but it'll do for now
end;
