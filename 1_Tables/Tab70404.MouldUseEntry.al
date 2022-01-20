/// <summary>
/// Table Mold Use Entry (ID 70404).
/// </summary>
table 70404 "Mold Use Entry"
{
    Caption = 'Mold Use Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(3; "Entry Type"; Enum MoldEntryType)
        {
            Caption = 'Entry Type';
            DataClassification = CustomerContent;
        }
        field(4; "Mold No."; Code[20])
        {
            Caption = 'Mold No.';
            DataClassification = CustomerContent;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(17; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = CustomerContent;
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(250; "Last Modified Date"; Date)
        {
            Caption = 'Last Modified Date';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        "Last Modified Date" := WorkDate();
    end;
}
