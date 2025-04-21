namespace ALProject.ALProject;

page 50007 AccountList
{
    ApplicationArea = All;
    Caption = 'AccountList';
    PageType = List;
    CardPageId = 50008;
    SourceTable = Account;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field("Account No."; Rec."Account No.")
                {
                    ToolTip = 'Specifies the value of the Account No. field.', Comment = '%';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Approve)
            {

                Caption = 'Approve';
                Image = Approve;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.ToggleStatus();
                end;
            }
        }
    }
}
