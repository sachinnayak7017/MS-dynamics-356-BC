report 50010 CustLedEnt
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/CustLedEnt.rdl';

    dataset
    {
        dataitem("CustLedEnt"; "Cust. Ledger Entry")
        {
            // RequestFilterFields = "Customer No.";
            column(Customer_No_; "Customer No.") { }
            column(Document_No_; "Document No.") { }
            column(Amount__LCY_; "Amount (LCY)") { }
            column(Document_Type; "Document Type") { }
            column(Description; Description) { }
            column(Credit_Amount__LCY_; "Credit Amount (LCY)") { }
            column(Debit_Amount__LCY_; "Debit Amount (LCY)") { }
            column(totalamount; totalamount) { }
            column(TotalCr_amount; TotalCr_amount) { }
            column(TotalDr_amount; TotalDr_amount) { }
            column(ShowGroupInfo; ShowGroupInfo) { }
            trigger OnAfterGetRecord()
            begin
                detailcustomerLedgerEntry.Reset();
                detailcustomerLedgerEntry.SetRange("Customer No.", CustLedEnt."Customer No.");
                if detailcustomerLedgerEntry.CalcSums("Amount (LCY)") then
                    totalamount := detailcustomerLedgerEntry."Amount (LCY)";
                // if detailcustomerLedgerEntry.FindSet() then 
                // totalamount := detailcustomerLedgerEntry.CalcSums(Amount);

                detailcustomerLedgerEntry.Reset();
                detailcustomerLedgerEntry.SetRange("Customer No.", CustLedEnt."Customer No.");
                if detailcustomerLedgerEntry.CalcSums("Credit Amount (LCY)", "Debit Amount (LCY)") then begin
                    TotalCr_amount := detailcustomerLedgerEntry."Credit Amount (LCY)";
                    TotalDr_amount := detailcustomerLedgerEntry."Debit Amount (LCY)";
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
                    field(ShowGroupInfo; ShowGroupInfo)
                    {
                        Caption = 'show Group';

                    }
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
        ShowGroupInfo: Boolean;
        CustomerLedEntr: record 21;
        totalamount: Decimal;
        detailcustomerLedgerEntry: record 379;
        TotalCr_amount: Decimal;
        TotalDr_amount: Decimal;
}