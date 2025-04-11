tableextension 50001 CustomerTableExt extends Customer
{
    fields
    {
        field(50000; FatherName; Text[30])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; FamilyName; Text[30])
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