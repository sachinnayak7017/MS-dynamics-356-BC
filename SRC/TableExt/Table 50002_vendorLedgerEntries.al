tableextension 50002 venderledger extends "Vendor Ledger Entry"
{
    fields
    {
        field(50001; "Item Ledger Entry No."; Integer)
        {

            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Item Ledger Entry"."Entry No.";
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
