pageextension 50001 "Sales & ReceivableExt" extends "Sales & Receivables Setup"
{
    layout
    {

        addafter("Customer Nos.")
        {

            field(StudentID; Rec.StudentID)
            {
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