/// <summary>
/// Page MoldActivities (ID 70410).
/// </summary>
page 70410 MoldActivities
{
    Caption = 'MoldActivities';
    PageType = CardPart;
    SourceTable = "Injection Mold";
    
    layout
    {
        area(content)
        {
            cuegroup(Molds)
            {
                field(MoldsAssigtoMC; Rec.MoldsAssigtoMC)
                {
                    ToolTip = 'Specifies the value of the Molds Assigned to Machine Centers field.';
                    ApplicationArea = All;
                }
                field(MoldsNotAssigtoMC; Rec.MoldsNotAssigtoMC)
                {
                    ToolTip = 'Specifies the value of the Molds Not Assigned to Machine Centers field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
