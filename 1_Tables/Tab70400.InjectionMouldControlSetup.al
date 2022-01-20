/// <summary>
/// Table Injection Mold Control Setup (ID 70400).
/// </summary>
table 70400 "Injection Mold Control Setup"
{
    Caption = 'Injection Mold Control Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(5; "Mold Nos."; Code[20])
        {
            Caption = 'Mold Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
