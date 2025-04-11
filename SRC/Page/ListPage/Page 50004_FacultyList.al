page 50004 FacultyList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = 50003;
    SourceTable = Faculty;

    layout
    {
        area(Content)
        {

            repeater(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(Depatment; Rec.Depatment)
                {
                    ToolTip = 'Specifies the value of the Depatment field.', Comment = '%';
                }
                field(salary; Rec.salary)
                {
                    ToolTip = 'Specifies the value of the salary field.', Comment = '%';
                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}