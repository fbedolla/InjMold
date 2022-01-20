/// <summary>
/// Page Injection Mold Setup card (ID 70400).
/// </summary>
page 70400 "Injection Mold Setup card"
{
    Caption = 'Injection Mold Setup card';
    PageType = Card;
    SourceTable = "Injection Mold Control Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mold Nos."; Rec."Mold Nos.")
                {
                    ToolTip = 'Specifies the value of the Mold Nos. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
