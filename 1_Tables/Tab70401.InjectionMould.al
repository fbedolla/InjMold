/// <summary>
/// Table Injection Mold (ID 70401).
/// </summary>
table 70401 "Injection Mold"
{
    Caption = 'Injection Mold';
    DataClassification = CustomerContent;
    DrillDownPageId = "Injection Mold List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetInJSetup;
                    NoSeriesMgt.TestManual(InjSetup."Mold Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(5; "Mold Type"; Enum "Mold Type")
        {
            Caption = 'Mold Type';
            DataClassification = CustomerContent;
        }
        field(6; "Injection Mold. Process"; Code[20])
        {
            Caption = 'Injection Mold. Process';
            DataClassification = CustomerContent;
            TableRelation = "Injection Mold. Processes".Code;
            trigger OnValidate()
            var
                IMP: Record "Injection Mold. Processes";
            begin
                IMP.Reset();
                IMP.SetRange(Code, "Injection Mold. Process");
                if IMP.FindSet() then
                    "Inj. Mold. Proc. Desc." := IMP.Description;
            end;
        }
        field(7; "Inj. Mold. Proc. Desc."; Code[100])
        {
            Caption = 'Injection Mold. Process Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(8; "Mold Material"; Code[20])
        {
            Caption = 'Mold Material';
            DataClassification = CustomerContent;
            TableRelation = "Mold Material";
        }
        field(10; "Max. Usage Qty."; Decimal)
        {
            Caption = 'Max. Usage Qty.';
            DataClassification = CustomerContent;
        }
        field(11; "Max. Usage Qty. per Month"; Decimal)
        {
            Caption = 'Max. Usage Qty.';
            DataClassification = CustomerContent;
        }
        field(20; "Design By"; Enum "Design Type")
        {
            Caption = 'Design By';
            DataClassification = CustomerContent;
        }
        field(21; Vendor; Code[20])
        {
            Caption = 'Vendor';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
            trigger OnValidate()
            var
                VendorNo: Record Vendor;
            begin
                if "Design By" = "Design By"::Vendor then begin
                    VendorNo.SetRange("No.", Vendor);
                    if VendorNo.FindSet() then
                        "Vendor Name" := VendorNo.Name;
                end;
            end;
        }
        field(22; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(23; "Manufacture Date"; Date)
        {
            Caption = 'Manufacture Date';
            DataClassification = CustomerContent;
        }
        field(24; "Purchase Date"; Date)
        {
            Caption = 'Purchase Date';
            DataClassification = CustomerContent;
        }
        field(25; "Operation Start Date"; Date)
        {
            Caption = 'Operation Start Date';
            DataClassification = CustomerContent;
        }
        field(30; "Is Fixed Asset?"; Boolean)
        {
            Caption = 'Is Fixed Asset?';
            DataClassification = CustomerContent;
        }
        field(31; "Fixed Asset No."; Code[20])
        {
            Caption = 'Fixed Asset No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Is Fixed Asset?" = const(true)) "Fixed Asset"."No.";
            trigger OnValidate()
            var
                FAentry: Record "FA Ledger Entry";
                PurchHdr: Record "Purch. Inv. Header";
            begin
                FAentry.Reset();
                FAentry.SetRange("FA No.", "Fixed Asset No.");
                FAentry.SetRange("Document Type", FAentry."Document Type"::Invoice);
                FAentry.SetRange("FA Posting Type", FAentry."FA Posting Type"::"Acquisition Cost");
                if FAentry.FindSet() then begin
                    "Fixed Asset Cost" := FAentry."Amount (LCY)";
                    PurchHdr.Reset();
                    PurchHdr.SetRange("No.", FAentry."Document No.");
                    if PurchHdr.FindSet() then
                        "Purchase Date" := PurchHdr."Posting Date";
                end;
            end;
        }
        field(32; "Fixed Asset Cost"; Decimal)
        {
            Caption = 'Fixed Asset Cost';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(90; Picture; MediaSet)
        {
            Caption = 'Picture';
        }
        field(91; Picture1; MediaSet)
        {
            Caption = 'Picture 1';
        }
        field(92; Picture2; MediaSet)
        {
            Caption = 'Picture 2';
        }
        field(97; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(100; "Related Machine Center"; Code[20])
        {
            Caption = 'Related Machine Center';
            DataClassification = CustomerContent;
            TableRelation = "Machine Center";
        }
        field(101; "InPlanned"; Decimal)
        {
            Caption = 'Qty to Produce in Planned Order';
            DataClassification = CustomerContent;
        }
        field(102; "inFirmPlanned"; Decimal)
        {
            Caption = 'Qty to Produce in Firm Planned Order';
            DataClassification = CustomerContent;
        }
        field(103; "InReleased"; Decimal)
        {
            Caption = 'Qty to Produce in Released Order';
            DataClassification = CustomerContent;
        }
        Field(120; "Related Resource"; Code[20])
        {
            Caption = 'Related Resource';
            DataClassification = CustomerContent;
            TableRelation = Resource;
        }
        field(121; "InAssyOrd"; Decimal)
        {
            Caption = 'Qty to Produce in Assembly Order';
            DataClassification = CustomerContent;
        }
        field(210; PostProdOrdQty; Decimal)
        {
            Caption = 'Posted Production Orders Quantities';
            FieldClass = FlowField;
            CalcFormula = sum("Mold Use Entry".Quantity
            where("Mold No." = field("No."),
            "Entry Type" = const("Production Order")
            ));
        }
        field(211; RemainingLifeQty; Decimal)
        {
            Caption = 'Remaining Life Qty.';
            DataClassification = CustomerContent;
        }
        field(220; PostAssyOrdQty; Decimal)
        {
            Caption = 'Posted Assembly Orders Quantities';
            FieldClass = FlowField;
            CalcFormula = sum("Mold Use Entry".Quantity
            where("Mold No." = field("No."),
            "Entry Type" = const("Assembly Order")
            ));
        }
        field(300; "MoldsAssigtoMC"; Integer)
        {
            Caption = 'Molds Assigned to Machine Centers';
            FieldClass = FlowField;
            CalcFormula = count ("Injection Mold" where ("Related Machine Center"=filter(<>'')));
        }
        field(301; "MoldsNotAssigtoMC"; Integer)
        {
            Caption = 'Molds Not Assigned to Machine Centers';
            FieldClass = FlowField;
            CalcFormula = count ("Injection Mold" where ("Related Machine Center"=filter(='')));
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; "No.", Description)
        {
        }
        fieldgroup(Brick; "No.", Description, Picture)
        {
        }
    }

    trigger OnDelete()
    begin

    end;

    trigger OnInsert()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeOnInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            GetInjSetup;
            InjSetup.TestField("Mold Nos.");
            NoSeriesMgt.InitSeries(InjSetup."Mold Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin

    end;

    var
        FixedAsset: Record "Fixed Asset";
        InjSetup: Record "Injection Mold Control Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HasInvtSetup: Boolean;

    local procedure GetInjSetup()
    begin
        if not HasInvtSetup then begin
            InjSetup.Get();
            HasInvtSetup := true;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnInsert(var Mold: Record "Injection Mold"; var IsHandled: Boolean)
    begin
    end;
}
