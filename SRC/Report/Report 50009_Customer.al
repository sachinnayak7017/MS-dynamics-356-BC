report 50009 CustomerDemoReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/Customer.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.") { }
            column(Name; Name) { }
            column(Location_Code; "Location Code") { }
            column(Contact; Contact) { }
            column(DocumentNo; DocumentNo) { }
            column(CustomerNo; CustomerNo) { }
            column(TotalAmountLCY; TotalAmountLCY) { }
            column(TotalRemainingAmount; TotalRemainingAmount) { }
            column(CustomerName; CustomerName) { }
            column(PostingDate; PostingDate) { }
            column(LocationGSTRegNo; LocationGSTRegNo) { }
            trigger OnAfterGetRecord()
            begin
                CustLedEnt.Reset();
                CustLedEnt.SetRange("Customer No.", Customer."No.");
                CustLedEnt.SetRange("Document Type", CustLedEnt."Document Type"::Payment);
                If CustLedEnt.FindSet() then begin
                    CustLedEnt.CalcFields("Amount (LCY)");
                    CustLedEnt.CalcFields("Remaining Amount");
                    // repeat
                    DocumentNo := CustLedEnt."Document No.";
                    CustomerName := CustLedEnt."Customer Name";
                    CustomerNo := CustLedEnt."Customer No.";
                    PostingDate := CustLedEnt."Posting Date";
                    LocationGSTRegNo := CustLedEnt."Location GST Reg. No.";

                    amountLCY := CustLedEnt."Amount (LCY)";
                    RemainingAmount := CustLedEnt."Remaining Amount";

                    // until CustLedEnt.Next() = 0;
                end;
                TotalAmountLCY += amountLCY;
                TotalRemainingAmount += RemainingAmount;
            end;

            trigger OnPreDataItem()
            begin
                amountLCY := 0;
                RemainingAmount := 0;

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
        myInt: Integer;
        Comp: Record 79;
        DocumentNo: Code[20];
        CustLedEnt: Record 21;
        CustomerNo: Code[30];
        CustomerName: Text[50];
        PostingDate: Date;
        LocationGSTRegNo: Text[30];
        amountLCY: Decimal;
        RemainingAmount: Decimal;
        TotalAmountLCY: Decimal;
        TotalRemainingAmount: Decimal;
        slkfsld: Record 21;
}