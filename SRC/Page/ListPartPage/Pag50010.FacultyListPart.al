namespace ALProject.ALProject;

page 50010 FacultyListPart
{
    ApplicationArea = All;
    Caption = 'FacultyListPart';
    PageType = ListPart;
    SourceTable = Faculty;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
}
