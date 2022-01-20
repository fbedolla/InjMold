/// <summary>
/// Page Mold Used Quantities  (ID 70409).
/// </summary>
page 70409 "Mold Used Quantities"
{
    Caption = 'Mold Used Quantities';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Injection Mold";

    layout
    {
        area(content)
        {
            field(PostAssyOrdQty; Rec.PostAssyOrdQty)
            {
                ToolTip = 'Specifies the value of the Posted Assembly Orders Quantities field.';
                ApplicationArea = All;
                DrillDown = true;
                DrillDownPageId = "Mold Use Entry";
            }
            field(PostProdOrdQty; Rec.PostProdOrdQty)
            {
                ToolTip = 'Specifies the value of the Posted Production Orders Quantities field.';
                ApplicationArea = All;
                DrillDown = true;
                DrillDownPageId = "Mold Use Entry";
            }
            field(RemainingLifeQty; Rec.RemainingLifeQty)
            {
                ApplicationArea = All;
            }
        }
    }
    
    trigger OnAfterGetRecord()
    begin
        Rec.RemainingLifeQty := Rec."Max. Usage Qty." - Rec.PostProdOrdQty - Rec.PostAssyOrdQty;
    end;

}
