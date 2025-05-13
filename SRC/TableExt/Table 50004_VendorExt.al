tableextension 50004 VendorExt1 extends Vendor
{
    fields
    {
        field(50000; "Payee Name as per Bank ACC"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Vendor IFSC Code"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Bank Account No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Bank Account Type"; Text[20])
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