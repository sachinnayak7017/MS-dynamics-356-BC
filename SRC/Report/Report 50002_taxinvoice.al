report 50005 TaxInvoiceReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/TaxinvoiceReport.rdl';
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.", "Posting Date";
            column(comp_pic; comp.Picture) { }

            column(Comp_Name; Comp.Name) { }
            column(Comp_Address; Comp.Address) { }
            column(Comp_Address_2; Comp."Address 2") { }
            column(Comp_GST_Registration_No_; Comp."GST Registration No.") { }
            column(Comp_State; Comp.City) { }
            column(Comp_State_Code; Comp."State Code") { }
            column(Comp_CIN_Registration_No_; Comp."Registration No.") { }
            column(Comp_Phone_No_; Comp."Phone No.") { }
            column(Comp_E_Mail; Comp."E-Mail") { }
            column(Comp_P_A_N__No_; Comp."P.A.N. No.") { }
            column(Comp_Bank_Name; Comp."Bank Name") { }
            column(Comp_Bank_Account_No_; Comp."Bank Account No.") { }
            column(Comp_Bank_Branch_No_; Comp."Bank Branch No.") { }


            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_State; State) { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }
            column(Bill_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
            column(Bill_PAN_No_; "Customer GST Reg. No.") { }
            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }

            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
            column(Ship_PAN_No_; "Customer GST Reg. No.") { }
            column(Ship_State; State) { }
            column(Ship_to_City; "Ship-to City") { }
            column(Ship_to_Contact_No_; "Bill-to Contact No.") { }
            column(Ship_to_Contact; "Ship-to Contact") { }

            column("Invoice_No"; "Location GST Reg. No.") { }
            column(Dated; "Posting Date") { }
            column(Suppliier_Registration_Number; "Registration Number") { }
            column(E_Way_Bill_No_; "E-Way Bill No.") { }
            column(Dispute_Status_Id; "Dispute Status Id") { }
            column(Destination_State; State) { }
            column(Destination_Post_Code; "Bill-to Post Code") { }
            column(External_Document_No_; "External Document No.") { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Document_No_; "Document No.") { }
                column(Description; Description) { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Line_Discount_Amount; "Line Discount Amount") { }

                column(S_No; S_No)
                {
                }
                column(IGST_Perc; ABS(IGST_Perc))
                {
                }
                column(IGST_Amt; ABS(IGST_Amt))
                {
                }
                column(CGST_Perc; ABS(CGST_Perc))
                {
                }
                column(CGST_Amt; ABS(CGST_Amt))
                {
                }
                column(SGST_Perc; ABS(SGST_Perc)) { }
                column(SGST_Amt; ABS(SGST_Amt)) { }
                column(GSTRate; ABS(IGST_Perc) + ABS(CGST_Perc) + Abs(SGST_Perc)) { }
                column(Line_Amount; "Line Amount") { }
                column(TotalLineamount; TotalLineamount) { }
                column(Totalamount; Totalamount) { }
                column(TotaltaxAmount; TotaltaxAmount) { }
                // column(TaxAmount_SalesInvoiceLine; ABS(IGST_Amt) + ABS(CGST_Amt) + ABS(SGST_Amt)) { }
                column(AmtInWord; NumTxt[1] + NumTxt[2]) { }
                column(AmtInWordtax; NumTxt1[1] + NumTxt1[2]) { }
                column(linetotalGst; linetotalGst) { }
                dataitem(CopyLoop; Integer)
                {
                    DataItemTableView = SORTING(Number);


                    trigger OnPreDataItem();
                    begin
                        NoOfLoops := ABS(NoOfCopies) + 1;
                        CopyText := '';
                        SETRANGE(Number, 1, NoOfLoops);
                        OutputNo := 1;
                    end;

                    trigger OnAfterGetRecord();
                    begin

                        case Number of
                            1:
                                CopyText := 'Original';
                            2:
                                CopyText := 'Duplicate';
                            3:
                                CopyText := 'Triplicate';

                            else
                                CopyText := 'Copy ' + Format(Number);
                        end;

                        OutputNo := Number;
                    end;
                }


                trigger OnAfterGetRecord();
                begin
                    S_No += 1;
                    IsInterState := ("Sales Invoice Header"."GST Bill-to State Code" <> Comp."State Code") or
                                    ("Sales Invoice Header"."Bill-to Country/Region Code" <> Comp."Country/Region Code");

                    IGST_Perc := 0;
                    CGST_Perc := 0;
                    SGST_Perc := 0;
                    IGST_Amt := 0;
                    CGST_Amt := 0;
                    SGST_Amt := 0;
                    Clear(linetotalGst);
                    if customGstRate > 0 then begin
                        if IsInterState then begin

                            IGST_Perc := customGstRate;
                            IGST_Amt := TotalLineamount * IGST_Perc / 100;
                            linetotalGst += Abs(IGST_Amt);

                        end else begin

                            CGST_Perc := customGstRate / 2;
                            SGST_Perc := customGstRate / 2;
                            CGST_Amt := TotalLineamount * CGST_Perc / 100;
                            SGST_Amt := TotalLineamount * SGST_Perc / 100;
                            linetotalGst += Abs(CGST_Amt) + Abs(SGST_Amt);
                        end;
                    end else begin

                        DetailedGSTEntryBuffer.RESET;
                        DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Sales);
                        DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                        DetailedGSTEntryBuffer.SETRANGE("No.", "No.");
                        DetailedGSTEntryBuffer.SETRANGE("Document Line No.", "Line No.");
                        if DetailedGSTEntryBuffer.FINDSET then
                            repeat
                                case DetailedGSTEntryBuffer."GST Component Code" of
                                    'IGST':
                                        begin
                                            IGST_Perc := DetailedGSTEntryBuffer."GST %";
                                            IGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                            linetotalGst += abs(IGST_Amt);
                                        end;
                                    'CGST':
                                        begin
                                            CGST_Perc := DetailedGSTEntryBuffer."GST %";
                                            CGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                            linetotalGst += abs(CGST_Amt);
                                        end;
                                    'SGST':
                                        begin
                                            SGST_Perc := DetailedGSTEntryBuffer."GST %";
                                            SGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                            linetotalGst += abs(SGST_Amt);
                                        end;
                                end;
                            until DetailedGSTEntryBuffer.NEXT = 0;
                    end;

                    DetailedGSTEntryBuffer.RESET;
                    DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Sales);
                    DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                    IF DetailedGSTEntryBuffer.FINDSET THEN
                        REPEAT
                            TotaltaxAmount += ABS(DetailedGSTEntryBuffer."GST Amount");
                        UNTIL DetailedGSTEntryBuffer.NEXT = 0;
                    CheckRep.InitTextVariable;
                    CheckRep.FormatNoText(NumTxt1, TotaltaxAmount, "Sales Invoice Header"."Currency Code");


                    "Sales Invoice Header".CalcFields(Amount);
                    TotalLineamount := "Sales Invoice Header".Amount;
                    DiscountAmt += "Sales Invoice Line"."Line Discount Amount";
                    TotalAmount := TotaltaxAmount + TotalLineamount;
                    CheckRep.InitTextVariable;
                    CheckRep.FormatNoText(NumTxt, TotalAmount, "Sales Invoice Header"."Currency Code");

                end;
            }
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
                group(PrintOptions)
                {
                    Caption = 'Print Options';

                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = All;
                        Caption = 'Additional Copies';
                        // ToolTip = 'Enter how many extra copies to print (beyond the original).';
                    }
                    field(customGstRate; customGstRate)
                    {
                        ApplicationArea = All;
                        Caption = 'Custom Gst Rate';
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
    trigger OnPreReport();
    begin
        Comp.GET;
        Comp.CALCFIELDS(Picture);
        TotalAmount := 0;
        TotaltaxAmount := 0;
        TotalLineAmount := 0;
        if NoOfCopies = 0 then
            NoOfCopies := 0;

    end;

    var
        S_No: Integer;
        comp: Record 79;
        DetailedGSTEntryBuffer: Record 18001;
        NumTxt: array[2] of Text[250];
        NumTxt1: array[2] of Text[250];
        CheckRep: Report "Posted Voucher";
        IGST_Perc: Decimal;
        IGST_Amt: Decimal;
        CGST_Perc: Decimal;
        CGST_Amt: Decimal;
        SGST_Perc: Decimal;
        SGST_Amt: Decimal;
        TotalLineamount: Decimal;
        TotaltaxAmount: Decimal;
        Totalamount: Decimal;
        customGstRate: Integer;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        IsInterState: Boolean;
        FormatDocument: Codeunit "Format Document";
        DiscountAmt: Integer;
        linetotalGst: Decimal;
}