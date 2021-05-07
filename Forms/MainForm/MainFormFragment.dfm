object MainForm: TMainForm
  Left = 3110
  Top = 509
  Width = 719
  Height = 428
  Caption = 'Lab1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter3: TSplitter
    Left = 0
    Top = 227
    Width = 711
    Height = 10
    Cursor = crVSplit
    Align = alBottom
    Color = 15790320
    MinSize = 110
    ParentColor = False
    ResizeStyle = rsUpdate
  end
  object SetupPanel: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 50
    Align = alTop
    Color = 15790320
    Constraints.MinWidth = 680
    TabOrder = 0
    DesignSize = (
      711
      50)
    object Label1: TLabel
      Left = 20
      Top = 14
      Width = 28
      Height = 20
      Caption = 'N = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 180
      Top = 14
      Width = 28
      Height = 20
      Caption = 'B = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 350
      Top = 14
      Width = 28
      Height = 20
      Caption = 'C = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object StartInputBtn: TButton
      Left = 567
      Top = 11
      Width = 125
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Start input'
      TabOrder = 0
      OnClick = StartInputBtnClick
    end
    object LengthEt: TEdit
      Left = 54
      Top = 15
      Width = 80
      Height = 21
      TabOrder = 1
    end
    object BEt: TEdit
      Left = 214
      Top = 14
      Width = 80
      Height = 21
      TabOrder = 2
    end
    object CEt: TEdit
      Left = 384
      Top = 14
      Width = 80
      Height = 21
      TabOrder = 3
    end
  end
  object InputPanel: TPanel
    Left = 0
    Top = 50
    Width = 711
    Height = 177
    Align = alClient
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 418
      Top = 0
      Width = 10
      Height = 177
      Color = 15790320
      MinSize = 155
      ParentColor = False
      ResizeStyle = rsUpdate
    end
    object InputGrid: TStringGrid
      Left = 0
      Top = 0
      Width = 418
      Height = 177
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      ColCount = 4
      Constraints.MinWidth = 100
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object InputSidePanel: TPanel
      Left = 428
      Top = 0
      Width = 283
      Height = 177
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Constraints.MinHeight = 100
      Constraints.MinWidth = 130
      TabOrder = 1
      object EditInputBtn: TButton
        Left = 10
        Top = 16
        Width = 125
        Height = 25
        Caption = 'Edit'
        TabOrder = 0
        OnClick = EditInputBtnClick
      end
      object SubmitInputBtn: TButton
        Left = 10
        Top = 60
        Width = 125
        Height = 25
        Caption = 'Submit'
        TabOrder = 1
        OnClick = SubmitInputBtnClick
      end
    end
  end
  object ResultPanel: TPanel
    Left = 0
    Top = 237
    Width = 711
    Height = 160
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 418
      Top = 0
      Width = 10
      Height = 160
      Color = 15790320
      MinSize = 155
      ParentColor = False
      ResizeStyle = rsUpdate
    end
    object ResultGrid: TStringGrid
      Left = 0
      Top = 0
      Width = 418
      Height = 160
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Constraints.MinWidth = 100
      FixedCols = 0
      RowCount = 2
      TabOrder = 0
      ColWidths = (
        64
        64
        64
        64
        64)
    end
    object ResultSidePanel: TPanel
      Left = 428
      Top = 0
      Width = 283
      Height = 160
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      Constraints.MinHeight = 160
      Constraints.MinWidth = 130
      TabOrder = 1
      object Label4: TLabel
        Left = 10
        Top = 20
        Width = 149
        Height = 32
        Align = alCustom
        Caption = 'The second element of'#13'the array is a multiple of 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ScalarValueEt: TEdit
        Left = 10
        Top = 60
        Width = 125
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object ClearAllBtn: TButton
        Left = 10
        Top = 112
        Width = 125
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = ClearAllBtnClick
      end
    end
  end
end
