pageextension 50002 CustomerExtList extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(FatherName; Rec.FatherName)
            {
                ApplicationArea = all;
            }
            field(FamilyName; Rec.FamilyName)
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
pageextension 50003 CustomerExtCard extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field(FatherName; Rec.FatherName)
            {
                ApplicationArea = all;
            }
            field(FamilyName; Rec.FamilyName)
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