report 50012 Interview
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/Interview.rdl';

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            trigger OnAfterGetRecord()
            begin
                if DocFilter = '' then
                    DocFilter := "No."
                else
                    DocFilter += '|' + "No.";
            end;

            trigger OnPostDataItem()
            var
                SalesLine: Record "Sales Invoice Line";
            begin
                if DocFilter <> '' then begin
                    SalesLine.SetFilter("Document No.", DocFilter);
                    if SalesLine.FindSet() then
                        repeat
                            TempSalesLine := SalesLine;
                            TempSalesLine.Insert();
                        until SalesLine.Next() = 0;
                end;
            end;
        }
        dataitem("Sorted Lines"; Integer)
        {
            DataItemTableView = sorting(Number);
            column(S_NO; S_NO) { }
            column(Document_No_; TempSalesLine."Document No.") { }
            column(Description; TempSalesLine.Description) { }
            column(HSN_SAC_Code; TempSalesLine."HSN/SAC Code") { }
            column(Posting_Date; TempSalesLine."Posting Date") { }
            column(Quantity; TempSalesLine.Quantity) { }
            column(Amount; TempSalesLine.Amount) { }
            trigger OnPreDataItem()
            begin
                TempSalesLine.SetCurrentKey("Posting Date");
                TempSalesLine.Ascending(NOT SortAscending);
                SetRange(Number, 1, TempSalesLine.Count);
            end;

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then
                    TempSalesLine.FindFirst()
                else
                    TempSalesLine.Next();
                S_NO += 1;
                if S_NO <= SumOfline then
                    FinalTotalSum += TempSalesLine.Amount;
            end;
        }

        // New dataitem added to show top N lines
        dataitem("Top Lines"; Integer)
        {
            DataItemTableView = sorting(Number);
            column(Top_SNO; Top_SNO) { }
            column(Top_Document_No_; TempSalesLine."Document No.") { }
            column(Top_Description; TempSalesLine.Description) { }
            column(Top_HSN_SAC_Code; TempSalesLine."HSN/SAC Code") { }
            column(Top_Posting_Date; TempSalesLine."Posting Date") { }
            column(Top_Quantity; TempSalesLine.Quantity) { }
            column(Top_Amount; TempSalesLine.Amount) { }

            trigger OnPreDataItem()
            var
                MaxLines: Integer;
            begin
                if SumOfline <= 0 then
                    CurrReport.Break();

                MaxLines := TempSalesLine.Count;
                if SumOfline < MaxLines then
                    MaxLines := SumOfline;


                SetRange(Number, 1, MaxLines);
                TempSalesLine.Reset();
                TempSalesLine.SetCurrentKey("Posting Date");
                TempSalesLine.Ascending(NOT SortAscending);
            end;

            trigger OnAfterGetRecord()
            begin
                if Number = 1 then
                    TempSalesLine.FindFirst()
                else
                    TempSalesLine.Next();
                Top_SNO := Number;
            end;
        }

        dataitem(TotalSumDisplay; Integer)
        {
            DataItemTableView = where(Number = const(1));
            column(FinalTotalSum; FinalTotalSum) { }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Options")
                {
                    field(SumOfline; SumOfline)
                    {
                        Caption = 'Number of Lines to Sum';
                        MinValue = 1;
                    }
                    field(SortAscending; SortAscending)
                    {
                        Caption = 'Sort Descending by Posting Date';
                        ToolTip = 'Check to sort descending, uncheck to sort ascending';
                    }
                }
            }
        }
    }

    var
        SumOfline: Integer;
        S_NO: Integer;
        Top_SNO: Integer;
        FinalTotalSum: Decimal;
        TempSalesLine: Record "Sales Invoice Line" temporary;
        DocFilter: Text;
        SortAscending: Boolean;

    trigger OnPreReport()
    begin
        S_NO := 0;
        Top_SNO := 0;
        FinalTotalSum := 0;
        DocFilter := '';
        TempSalesLine.Reset();
        TempSalesLine.DeleteAll();
    end;
}