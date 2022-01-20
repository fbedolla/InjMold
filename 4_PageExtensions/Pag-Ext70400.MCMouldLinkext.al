/// <summary>
/// PageExtension MC Mold Link ext (ID 70400) extends Record Machine Center Card.
/// </summary>
pageextension 70400 "MC Mold Link ext" extends "Machine Center Card"
{
    layout
    {
        addafter(Warehouse)
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
