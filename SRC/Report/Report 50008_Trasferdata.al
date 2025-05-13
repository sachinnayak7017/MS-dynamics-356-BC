report 50008 ProcessonlyReport
{
    ProcessingOnly = true;
    dataset
    {
        dataitem(GLE; "G/L Entry")
        {
            trigger OnAfterGetRecord()
            begin
                SIH.Reset();
                SIH.SetRange("No.", GLE."Document No.");
                if SIH.FindSet() then begin
                    repeat
                        "Location code" := SIH."Bill-to Name";
                        Narration := SIH."Bill-to Address";
                        Modify();
                    until SIH.Next() = 0;
                end;
            end;
        }
    }
    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    // field(Name; SourceExpression)
                    // {
                    // }
                }
            }
        }
        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                }
            }
        }
    }
    var
        SIH: Record "Sales Invoice Header";
}