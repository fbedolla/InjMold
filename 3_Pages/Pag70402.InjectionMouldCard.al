/// <summary>
/// Page Injection Mold Card (ID 70402).
/// </summary>
page 70402 "Injection Mold Card"
{
    Caption = 'Injection Mold Card';
    PageType = Card;
    SourceTable = "Injection Mold";

    layout
    {
        area(content)
        {
            group(General)
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
            }
            group(Specs)
            {
                Caption = 'Specifications';
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
                field("Mold Type"; Rec."Mold Type")
                {
                    ToolTip = 'Specifies the value of the Mold Type field.';
                    ApplicationArea = All;
                }
                field("Mold Material"; Rec."Mold Material")
                {
                    ToolTip = 'Specifies the value of the Mold MAterial field.';
                    ApplicationArea = All;
                }
                field("Design By"; Rec."Design By")
                {
                    ToolTip = 'Specifies the value of the Design By field.';
                    ApplicationArea = All;
                }
                field(Vendor; Rec.Vendor)
                {
                    ToolTip = 'Specifies the value of the Vendor field.';
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                    ApplicationArea = All;
                }
                field("Max. Usage Qty."; Rec."Max. Usage Qty.")
                {
                    ApplicationArea = All;
                }
                field("Max. Usage Qty. per Month"; Rec."Max. Usage Qty. per Month")
                {
                    ApplicationArea = All;
                }
                
            }
            group("Related Production Controls")
            {
                field("Related Machine Center"; Rec."Related Machine Center")
                {
                    ToolTip = 'Specifies the value of the Related Machine Center field.';
                    ApplicationArea = All;
                }
                field(InPLanned; Rec.InPlanned)
                {
                    ToolTip = 'Specifies the value of the In field.';
                    ApplicationArea = All;
                }
                field(inFirmPlanned; Rec.InFirmPlanned)
                {
                    ToolTip = 'Specifies the value of the In field.';
                    ApplicationArea = All;
                }
                field(InReleased; Rec.InReleased)
                {
                    ToolTip = 'Specifies the value of the In field.';
                    ApplicationArea = All;
                }
                field("Related Resource"; Rec."Related Resource")
                {
                    ToolTip = 'Specifies the value of the Related Resource field.';
                    ApplicationArea = All;
                }
                field(InAssyOrd; Rec.InAssyOrd)
                {
                    ToolTip = 'Specifies the value of Assembly Orders field.';
                    ApplicationArea = All;
                }
            }
            group("Internal Control")
            {

                field("Is Fixed Asset?"; Rec."Is Fixed Asset?")
                {
                    ToolTip = 'Specifies the value of the Is Fixed Asset? field.';
                    ApplicationArea = All;
                }
                field("Fixed Asset No."; Rec."Fixed Asset No.")
                {
                    ToolTip = 'Specifies the value of the Fixed Asset No. field.';
                    ApplicationArea = All;
                }
                field("Fixed Asset Cost"; Rec."Fixed Asset Cost")
                {
                    ToolTip = 'Specifies the value of the Fixed Asset Cost field.';
                    ApplicationArea = All;
                }
            }
            group(Dates)
            {
                field("Manufacture Date"; Rec."Manufacture Date")
                {
                    ToolTip = 'Specifies the value of the Manufacture Date field.';
                    ApplicationArea = All;
                }
                field("Operation Start Date"; Rec."Operation Start Date")
                {
                    ToolTip = 'Specifies the value of the Operation Start Date field.';
                    ApplicationArea = All;
                }
                field("Purchase Date"; Rec."Purchase Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Date field.';
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part("Mold Used Quantities"; "Mold Used Quantities")
            {
                ApplicationArea = All;
                Caption = 'Used Quantities By Process';
                SubPageLink = "No." = FIELD("No.");
            }
            part(MoldPict; "Mold Picture")
            {
                ApplicationArea = All;
                Caption = 'Picture';
                SubPageLink = "No." = FIELD("No.");
            }
            part(MoldPict1; "Mold Picture1")
            {
                ApplicationArea = All;
                Caption = 'Picture 1';
                SubPageLink = "No." = FIELD("No.");
            }
            part(MoldPict2; "Mold Picture2")
            {
                ApplicationArea = All;
                Caption = 'Picture 2';
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(MoldEntry)
            {
                Caption = 'Mold Use Entry Ledger';
                ApplicationArea = All;
                Image = Entries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = page "Mold Use Entry";
                RunPageLink = "Mold No." = field("No.");
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        MacCen: Record "Machine Center";
        Res: Record Resource;
    begin
        MacCen.Reset();
        MacCen.SetRange("Mold No.", rec."No.");
        if MacCen.FindSet() then begin
            Rec."Related Machine Center" := MacCen."No.";
            Rec.InPlanned := GetPlanOrdQty(Rec."No.", MacCen."No.");
            Rec.inFirmPlanned := GetFirmPlanOrdQty(Rec."No.", MacCen."No.");
            Rec.InReleased := GetReleasedOrdQty(Rec."No.", MacCen."No.");
        end;

        Res.Reset();
        Res.SetRange("Mold No.", rec."No.");
        if Res.FindSet() then begin
            Rec."Related Resource" := Res."No.";
            Rec.InAssyOrd := GetAssyOrdQty(Rec."No.", Res."No.");
            // Rec.inFirmPlanned := GetFirmPlanOrdQty(Rec."No.",Res."No.");
            // Rec.InReleased := GetReleasedOrdQty(Rec."No.",Res."No.");
        end;
    end;

    var
        PlannedQty: Decimal;
        FirmPlannedQty: Decimal;
        ReleasedQty: Decimal;
        AssyQty: Decimal;
    /// <summary>
    /// GetPlanOrdQty.
    /// </summary>
    /// <param name="MoldNo">code[20].</param>
    /// <param name="RelMC">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetPlanOrdQty(MoldNo: code[20]; RelMC: Code[20]): Decimal;
    var
        ProdOrdRoutLine: Record "Prod. Order Routing Line";
    begin
        ProdOrdRoutLine.Reset();
        ProdOrdRoutLine.SetRange(Status, ProdOrdRoutLine.Status::Planned);
        ProdOrdRoutLine.SetRange(Type, ProdOrdRoutLine.Type::"Machine Center");
        ProdOrdRoutLine.SetRange("No.", RelMC);
        PlannedQty := 0;
        if ProdOrdRoutLine.FindSet() then
            repeat
                PlannedQty += ProdOrdRoutLine."Input Quantity";
            until ProdOrdRoutLine.Next() = 0;

        exit(PlannedQty);
    end;
    /// <summary>
    /// GetFirmPlanOrdQty.
    /// </summary>
    /// <param name="MoldNo">code[20].</param>
    /// <param name="RelMC">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetFirmPlanOrdQty(MoldNo: code[20]; RelMC: Code[20]): Decimal;
    var
        ProdOrdRoutLine: Record "Prod. Order Routing Line";
    begin
        ProdOrdRoutLine.Reset();
        ProdOrdRoutLine.SetRange(Status, ProdOrdRoutLine.Status::"Firm Planned");
        ProdOrdRoutLine.SetRange(Type, ProdOrdRoutLine.Type::"Machine Center");
        ProdOrdRoutLine.SetRange("No.", RelMC);
        FirmPlannedQty := 0;
        if ProdOrdRoutLine.FindSet() then
            repeat
                FirmPlannedQty += ProdOrdRoutLine."Input Quantity";
            until ProdOrdRoutLine.Next() = 0;

        exit(FirmPlannedQty);
    end;
    /// <summary>
    /// GetReleasedOrdQty.
    /// </summary>
    /// <param name="MoldNo">code[20].</param>
    /// <param name="RelMC">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetReleasedOrdQty(MoldNo: code[20]; RelMC: Code[20]): Decimal;
    var
        ProdOrdRoutLine: Record "Prod. Order Routing Line";
    begin
        ProdOrdRoutLine.Reset();
        ProdOrdRoutLine.SetRange(Status, ProdOrdRoutLine.Status::Released);
        ProdOrdRoutLine.SetRange(Type, ProdOrdRoutLine.Type::"Machine Center");
        ProdOrdRoutLine.SetRange("No.", RelMC);
        ReleasedQty := 0;
        if ProdOrdRoutLine.FindSet() then
            repeat
                ReleasedQty += ProdOrdRoutLine."Input Quantity";
            until ProdOrdRoutLine.Next() = 0;

        exit(ReleasedQty);
    end;
    /// <summary>
    /// GetAssyOrdQty.
    /// </summary>
    /// <param name="MoldNo">code[20].</param>
    /// <param name="RelRes">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetAssyOrdQty(MoldNo: code[20]; RelRes: Code[20]): Decimal;
    var
        AssyLine: Record "Assembly Line";
        AssyHdr: Record "Assembly Header";
    begin
        AssyLine.Reset();
        AssyLine.SetRange(Type, AssyLine.Type::Resource);
        AssyLine.SetRange("No.", RelRes);
        AssyQty := 0;
        if AssyLine.FindSet() then
            repeat
                AssyHdr.Reset();
                AssyHdr.SetRange(Status, AssyHdr.Status::Released);
                AssyHdr.SetRange("No.", AssyLine."Document No.");
                if AssyHdr.FindSet() then
                    AssyQty += AssyHdr."Quantity to Assemble";
            until AssyLine.Next() = 0;

        exit(AssyQty);
    end;
}
