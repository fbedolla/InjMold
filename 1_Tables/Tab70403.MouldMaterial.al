/// <summary>
/// Table Mold Material (ID 70403).
/// </summary>
table 70403 "Mold Material"
{
    Caption = 'Mold Material';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[80])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; Alloy; Text[80])
        {
            Caption = 'Alloy';
            DataClassification = CustomerContent;
        }
        field(4; Hardness; Text[50])
        {
            Caption = 'Hardness';
            DataClassification = CustomerContent;
        }
        field(5; "Manufactured Method"; Enum "Mold Manuf. Method")
        {
            Caption = 'Mold Manufactured Method';
            DataClassification = CustomerContent;
        }
        field(6; Tonnage; Decimal)
        {
            Caption = 'Tonnage';
            DataClassification = CustomerContent;
        }
        field(7; "Tonnage Unit of Measure"; Code[20])
        {
            Caption = 'Tonnage Unit of Measure';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
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
