/// <summary>
/// PageExtension ResMoldLinkExt (ID 70401) extends Record Resource Card.
/// </summary>
pageextension 70401 ResMoldLinkExt extends "Resource Card"
{
    layout
    {
        addafter("Personal Data")
        {
            group(MoldsInfo)
            {
                Caption = 'Molds Information';
                field("Mold No."; Rec."Mold No.")
                {
                    ToolTip = 'Specifies the value of the Mold No. field.';
                    ApplicationArea = All;
                }
                field("Mold Description"; Rec."Mold Description")
                {
                    ToolTip = 'Specifies the value of the Mold Description field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Mold Type"; Rec."Mold Type")
                {
                    ToolTip = 'Specifies the value of the Mold Type field.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
