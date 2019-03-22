object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 72
    Height = 13
    Caption = 'Mark Anderson'
  end
  object Edit1: TEdit
    Left = 16
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '01/11/2018'
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 62
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object StringGrid1: TStringGrid
    Tag = 2
    Left = 152
    Top = 16
    Width = 217
    Height = 120
    ColCount = 2
    FixedCols = 0
    RowCount = 201
    TabOrder = 2
    ColWidths = (
      121
      64)
  end
  object PrototypeBindSource1: TPrototypeBindSource
    AutoActivate = True
    AutoPost = False
    FieldDefs = <
      item
        Name = 'ContactName1'
        Generator = 'ContactNames'
        ReadOnly = False
      end
      item
        Name = 'DateField1'
        Generator = 'Date'
        ReadOnly = False
      end>
    ScopeMappings = <>
    Left = 112
    Top = 128
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourcePrototypeBindSource1: TLinkGridToDataSource
      Category = 'Liaisons rapides'
      DataSource = PrototypeBindSource1
      GridControl = StringGrid1
      Columns = <>
    end
    object LinkControlToField1: TLinkControlToField
      Category = 'Liaisons rapides'
      DataSource = PrototypeBindSource1
      FieldName = 'DateField1'
      Control = Edit1
      Track = True
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = PrototypeBindSource1
      FieldName = 'ContactName1'
      Component = Label1
      ComponentProperty = 'Caption'
    end
  end
end
