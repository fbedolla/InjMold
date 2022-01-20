/// <summary>
/// Table Injection Mold. Processes (ID 70402).
/// </summary>
table 70402 "Injection Mold. Processes"
{
    Caption = 'Injection Mold. Processes';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
