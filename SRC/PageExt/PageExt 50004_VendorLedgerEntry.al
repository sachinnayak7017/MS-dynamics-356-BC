pageextension 50004 "Vendor ledger entries" extends "Vendor Ledger Entries"
{
    Editable = true;
    layout
    {
        addafter("Document Type")
        {
            field("Item Ledger Entry No."; Rec."Item Ledger Entry No.")
            {
                Editable = true;
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}