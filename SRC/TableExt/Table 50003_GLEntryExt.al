tableextension 50003 GLEntryExt extends "G/L Entry"
{
    fields
    {
        field(50000; "Location code"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; Narration; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}