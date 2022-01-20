/// <summary>
/// Page Mold Material (ID 70404).
/// </summary>
page 70404 "Mold Material"
{
    ApplicationArea = All;
    Caption = 'Mold Material';
    PageType = List;
    SourceTable = "Mold Material";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Alloy; Rec.Alloy)
                {
                    ToolTip = 'Specifies the value of the Alloy field.';
                    ApplicationArea = All;
                }
                field(Hardness; Rec.Hardness)
                {
                    ToolTip = 'Specifies the value of the Hardness field.';
                    ApplicationArea = All;
                }
                field("Manufactured Method"; Rec."Manufactured Method")
                {
                    ToolTip = 'Specifies the value of the Mold Manufactured Method field.';
                    ApplicationArea = All;
                }
                field(Tonnage; Rec.Tonnage)
                {
                    ToolTip = 'Specifies the value of the Tonnage field.';
                    ApplicationArea = All;
                }
                field("Tonnage Unit of Measure"; Rec."Tonnage Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Tonnage Unit of Measure field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
