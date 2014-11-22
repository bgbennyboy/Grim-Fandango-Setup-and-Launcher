{
***************************************************************
  Grim Fandango Setup
  2004-2014 By Bennyboy
  Http://quickandeasysoftware.net
***************************************************************

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

	Drive scanning code based on code by unknown author - please
	contact me if you want crediting here.
}

[Code]

var
	DrvLetters: array of String;

	function GetDriveType( lpDisk: String ): Integer;
	external 'GetDriveTypeW@kernel32.dll stdcall';

	function GetLogicalDriveStrings( nLenDrives: LongInt; lpDrives: String ): Integer;
	external 'GetLogicalDriveStringsW@kernel32.dll stdcall';

const
	DRIVE_UNKNOWN = 0; // The drive type cannot be determined.
	DRIVE_NO_ROOT_DIR = 1; // The root path is invalid. For example, no volume is mounted at the path.
	DRIVE_REMOVABLE = 2; // The disk can be removed from the drive.
	DRIVE_FIXED = 3; // The disk cannot be removed from the drive.
	DRIVE_REMOTE = 4; // The drive is a remote (network) drive.
	DRIVE_CDROM = 5; // The drive is a CD-ROM drive.
	DRIVE_RAMDISK = 6; // The drive is a RAM disk.

procedure FindAllCdDrives();
var
	n: Integer;
	drivesletters: String; lenletters: Integer;
	drive: String;
	disktype, posnull: Integer;
	sd: String;
begin
	//Get system drive
	sd := UpperCase(ExpandConstant('{sd}'));

	//Get all drives letters
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

			//Get type of disk
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

function FindDrive(UniqueFile: string): string;
var
	i: integer;
begin
	result:='';

	for i:=0 to GetArrayLength(DrvLetters) -1 do
	begin
		if FileExists( DrvLetters[i] + UniqueFile) then
		begin
			result:=DrvLetters[i];
			exit;
		end
	end;
end;

function GetSourceCdDrive(UniqueFile: string): string;
begin
	FindAllCdDrives();

	if GetArrayLength(DrvLetters) < 1 then
	begin
		MsgBox('No cd drives were found on your system! Setup will now exit.', mbError, MB_OK);
		Abort;
	end;


	Result := FindDrive(UniqueFile);
end;