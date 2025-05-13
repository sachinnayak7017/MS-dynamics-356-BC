

page 50001 StudentList
{
    ApplicationArea = All;
    Caption = 'StudentList';
    PageType = List;
    CardPageId = 50002;
    SourceTable = StudentInfo;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(StudentID; Rec.StudentID)
                {
                    ToolTip = 'Specifies the value of the StudentID field.', Comment = '%';
                }
                field(StudentName; Rec.StudentName)
                {
                    ToolTip = 'Specifies the value of the StudentName field.', Comment = '%';
                }
                field(StudentRoll; Rec.StudentRoll)
                {
                    ToolTip = 'Specifies the value of the StudentRoll field.', Comment = '%';
                }
                field(Curr_state; Rec.Curr_state)
                {
                    ToolTip = 'Specifies the value of the Curr_state field.', Comment = '%';
                }
                field(DOB; Rec.DOB)
                {
                    ToolTip = 'Specifies the value of the DOB field.', Comment = '%';
                }
                field(Department; Rec.Department)
                {
                    ToolTip = 'Specifies the value of the Department field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field(fee; Rec.fee)
                {
                    ToolTip = 'Specifies the value of the fee field.', Comment = '%';
                }
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action("RUN Repot")
            {
                Image = Report;
                Promoted = true;
                trigger OnAction()
                begin
                    Report.Run(50000);
                end;
            }
            action("TransferNow")
            {
                Image = Report;
                Promoted = true;
                trigger OnAction()
                begin
                    Report.Run(50008);
                end;
            }
        }
    }

    var
        myInt: Integer;

}
