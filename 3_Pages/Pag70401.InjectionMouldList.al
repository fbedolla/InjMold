/// <summary>
/// Page Injection Mold List (ID 70401).
/// </summary>
page 70401 "Injection Mold List"
{
    ApplicationArea = All;
    Caption = 'Injection Mold List';
    PageType = List;
    SourceTable = "Injection Mold";
    UsageCategory = Lists;
    CardPageId = "Injection Mold Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Injection Mold. Process"; Rec."Injection Mold. Process")
                {
                    ToolTip = 'Specifies the value of the Injection Mold. Process field.';
                    ApplicationArea = All;
                }
                field("Inj. Mold. Proc. Desc."; Rec."Inj. Mold. Proc. Desc.")
                {
                    ToolTip = 'Specifies the value of the Injection Mold. Process Description field.';
                    ApplicationArea = All;
                }
                field("Is Fixed Asset?"; Rec."Is Fixed Asset?")
                {
                    ToolTip = 'Specifies the value of the Is Fixed Asset? field.';
                    ApplicationArea = All;
                }
                field("Manufacture Date"; Rec."Manufacture Date")
                {
                    ToolTip = 'Specifies the value of the Manufacture Date field.';
                    ApplicationArea = All;
                }
                field("Mold Type"; Rec."Mold Type")
                {
                    ToolTip = 'Specifies the value of the Mold Type field.';
                    ApplicationArea = All;
                }
                field("Operation Start Date"; Rec."Operation Start Date")
                {
                    ToolTip = 'Specifies the value of the Operation Start Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
