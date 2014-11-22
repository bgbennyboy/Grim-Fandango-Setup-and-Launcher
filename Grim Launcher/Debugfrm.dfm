object frmDebug: TfrmDebug
  Left = 326
  Top = 58
  VertScrollBar.Style = ssHotTrack
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Debug Keys'
  ClientHeight = 538
  ClientWidth = 581
  Color = clBtnFace
  Constraints.MaxWidth = 597
  Constraints.MinHeight = 220
  Constraints.MinWidth = 589
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  ScreenSnap = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 581
    Height = 538
    HorzScrollBar.Visible = False
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 581
      Height = 417
      AutoSize = True
    end
  end
  object MSWheel1: TMSWheel
    Auto = False
    Version = '1.5.0.0'
    OnWheelEvent = MSWheel1WheelEvent
    Left = 280
    Top = 192
  end
end
