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

program GrimLauncher;

{$R *.dres}

uses
  Forms,
  Mainfrm in 'Mainfrm.pas' {frmMain},
  Options in 'Options.pas' {frmOptions},
  Debugfrm in 'Debugfrm.pas' {frmDebug},
  uGrimUtils in 'uGrimUtils.pas',
  uGrimConst in 'uGrimConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := strAppTitle;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmDebug, frmDebug);
  Application.Run;
end.
