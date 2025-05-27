report 50011 "VendorCustomerExcelReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Vendor and Customer Excel Report';
    ProcessingOnly = true;

    dataset
    {
        dataitem("GLEntry"; "G/L Entry")
        {
            trigger OnPreDataItem()
            begin
                if IncludeGLEntry then begin
                    ExportGLEntry();
                    ExcelBuffer.WriteAllToCurrentSheet(ExcelBuffer);
                    ExcelBuffer.DeleteAll();
                end;
            end;
        }

        dataitem("Sales Header"; "Sales Header")
        {
            trigger OnPreDataItem()
            begin
                if IncludeSalesHeader then begin
                    ExcelBuffer.SetCurrent(1, 1);
                    ExcelBuffer.SelectOrAddSheet('Sales Header');
                    ExportSalesHeader();
                    ExcelBuffer.WriteAllToCurrentSheet(ExcelBuffer);
                    ExcelBuffer.DeleteAll();
                end;

            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {

            trigger OnPreDataItem()
            begin
                if IncludePurchInvHeader then begin
                    ExcelBuffer.SetCurrent(1, 1);
                    ExcelBuffer.SelectOrAddSheet('Purchase Invoice header');
                    ExportPurchInvHeader();
                    ExcelBuffer.WriteAllToCurrentSheet(ExcelBuffer);
                    ExcelBuffer.DeleteAll();
                end;
            end;
        }

    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(IncludeGLEntry; IncludeGLEntry)
                    {
                        Caption = 'Include GL Entry';
                    }
                    field(IncludeSalesHeader; IncludeSalesHeader)
                    {
                        Caption = 'Include Sales Header';
                    }
                    field(IncludePurchInvHeader; IncludePurchInvHeader)
                    {
                        Caption = 'Include Purch Invoices Header';
                    }
                }
            }
        }
    }

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        IncludeGLEntry: Boolean;
        IncludeSalesHeader: Boolean;

        IncludePurchInvHeader: Boolean;

    trigger OnPreReport()
    begin
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        ExcelBuffer.CreateNewBook('G/L Entry');

    end;

    trigger OnPostReport()
    begin
        ExcelBuffer.CloseBook();
        ExcelBuffer.SetFriendlyFilename('GLEntryAndSalseHeader.xlsx');
        ExcelBuffer.OpenExcel();
    end;

    local procedure ExportGLEntry()
    var
        GLEntryRec: Record "G/L Entry";
    begin

        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(' Document No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Location Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Document type', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);


        GLEntryRec.Reset();
        if GLEntryRec.FindSet() then
            repeat
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(GLEntryRec."Document No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(GLEntryRec.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(GLEntryRec."Location Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(GLEntryRec."Document Type", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            until GLEntryRec.Next() = 0;
    end;

    local procedure ExportSalesHeader()
    var
        SalesHeaderRec: Record "Sales Header";
    begin

        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Document Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Location Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Status', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);


        SalesHeaderRec.Reset();
        if SalesHeaderRec.FindSet() then
            repeat
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(SalesHeaderRec."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesHeaderRec."Document Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesHeaderRec."Location Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesHeaderRec.Status, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            until SalesHeaderRec.Next() = 0;
    end;

    local procedure ExportPurchInvHeader()
    var
        PurchInvHeaderRec: Record "Purch. Inv. Header";
    begin
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.AddColumn('Vendor Invoice No', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Vendor Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Number);


        PurchInvHeaderRec.Reset();
        if PurchInvHeaderRec.FindSet() then
            repeat
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(PurchInvHeaderRec."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(PurchInvHeaderRec."Vendor Invoice No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(PurchInvHeaderRec."Pay-to Name", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
            until PurchInvHeaderRec.Next() = 0;
    end;
}
