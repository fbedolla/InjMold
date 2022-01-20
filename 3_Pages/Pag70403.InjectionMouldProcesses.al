/// <summary>
/// Page Injection Mold Processes (ID 70403).
/// </summary>
page 70403 "Injection Mold Processes"
{
    ApplicationArea = All;
    Caption = 'Injection Mold Processes';
    PageType = List;
    SourceTable = "Injection Mold. Processes";
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
            }
        }
    }
}
