namespace ALProject.ALProject;

page 50006 UniversityList
{
    ApplicationArea = All;
    Caption = 'UniversityList';
    PageType = List;

    CardPageId = 50005;
    SourceTable = University;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
