/// <summary>
/// TableExtension MC Mold Link (ID 70400) extends Record Machine Center.
/// </summary>
tableextension 70400 "MC Mold Link" extends "Machine Center"
{
    fields
    {
        field(70400; "Mold No."; Code[20])
        {
            Caption = 'Mold No.';
            DataClassification = CustomerContent;
            TableRelation = "Injection Mold"."No.";
            trigger OnValidate()
            var
                InjM: Record "Injection Mold";
            begin
                InjM.Reset();
                InjM.SetRange("No.", "Mold No.");
                if InjM.FindSet() then begin
                    "Mold Description" := InjM.Description;
                    "Mold Type" := InjM."Mold Type";
                end
            end;
        }
        field(70401; "Mold Description"; Text[50])
        {
            Caption = 'Mold Description';
            DataClassification = CustomerContent;
        }
        field(70402; "Mold Type"; Enum "Mold Type")
        {
            Caption = 'Mold Type';
            DataClassification = CustomerContent;
        }
    }
}
