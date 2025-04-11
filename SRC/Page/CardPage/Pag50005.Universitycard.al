namespace ALProject.ALProject;

page 50005 Universitycard
{
    ApplicationArea = All;
    Caption = 'Universitycard';
    PageType = Card;
    SourceTable = University;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(UniNo; Rec.UniNo)
                {
                    ToolTip = 'Specifies the value of the UniNo field.', Comment = '%';
                }
                field(facultyName; Rec.facultyName)
                {
                    ToolTip = 'Specifies the value of the facultyName field.', Comment = '%';
                }
                field(studentname; Rec.studentname)
                {
                    ToolTip = 'Specifies the value of the studentname field.', Comment = '%';
                }
                field(salarySum; Rec.salarySum)
                {
                    ToolTip = 'Specifies the value of the salarySum field.', Comment = '%';
                }
                field(salaryMin; Rec.salaryMin)
                {
                    ToolTip = 'Specifies the value of the salaryMin field.', Comment = '%';
                }
                field(salarymax; Rec.salarymax)
                {
                    ToolTip = 'Specifies the value of the salarymax field.', Comment = '%';
                }
            }
        }
    }
}
