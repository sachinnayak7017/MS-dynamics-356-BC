pageextension 50005 GLPageExt extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Location code"; Rec."Location code")
            {
                Editable = true;
                ApplicationArea = all;

            }
            field(Narration; Rec.Narration)
            {
                Editable = true;
                ApplicationArea = all;
            }
        }
    }

    actions
    {
 
    }


}