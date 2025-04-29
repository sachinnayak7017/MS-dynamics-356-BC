report 50002 "Vendor Detail Trail  Balance"
{
    DefaultLayout = RDLC;
    //RDLCLayout = './VendorDetailTrailBalance.rdl';
    RDLCLayout = './SRC\Report Layout/VendorDetailTrailBalanceNew.rdl';
    Caption = 'Vendor - Detail Trial Balance';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            CalcFields = "Credit Amount (LCY)", "Debit Amount (LCY)";
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Search Name", "Vendor Posting Group", "Date Filter";

            column(VendDatetFilterPeriod; StrSubstNo(Text000, VendDateFilter))
            {
            }
            column(CompanyName; CompanyName)
            {
            }
            column(VendorTblCapVendFltr; TableCaption + ': ' + VendFilter)
            {
            }
            column(VendFilter; VendFilter)
            {
            }
            column(PageGroupNo; PageGroupNo)
            {
            }
            column(PrintAmountsInLCY; PrintAmountsInLCY)
            {
            }
            column(ExcludeBalanceOnly; ExcludeBalanceOnly)
            {
            }
            column(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
            {
            }
            column(AmountCaption; AmountCaption)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(RemainingAmtCaption; RemainingAmtCaption)
            {
                AutoFormatExpression = "Currency Code";
                AutoFormatType = 1;
            }
            column(No_Vendor; "No.")
            {
            }
            column(Name_Vendor; Name)
            {
            }
            column(PhoneNo_Vendor; "Phone No.")
            {
                IncludeCaption = true;
            }
            column(StartBalanceLCY; StartBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StartBalAdjLCY; StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(VendBalanceLCY; VendBalanceLCY)
            {
                AutoFormatType = 1;
            }
            column(StrtBalLCYStartBalAdjLCY; StartBalanceLCY + StartBalAdjLCY)
            {
                AutoFormatType = 1;
            }
            column(VendDetailTrialBalCap; VendDetailTrialBalCapLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(AllamountsareinLCYCaption; AllamountsareinLCYCaptionLbl)
            {
            }
            column(ReportIncludesvendorshavebalanceCaption; ReportIncludesvendorshavebalanceCaptionLbl)
            {
            }
            column(PostingDateCaption; PostingDateCaptionLbl)
            {
            }
            column(BalanceLCYCaption; BalanceLCYCaptionLbl)
            {
            }
            column(DueDateCaption; DueDateCaptionLbl)
            {
            }
            column(AdjofOpeningBalanceCaption; AdjofOpeningBalanceCaptionLbl)
            {
            }
            column(TotalLCYCaption; TotalLCYCaptionLbl)
            {
            }
            column(TotalAdjofOpenBalCaption; TotalAdjofOpenBalCaptionLbl)
            {
            }
            column(TotalLCYBeforePeriodCaption; TotalLCYBeforePeriodCaptionLbl)
            {
            }
            column(DrAmtTot; Vendor."Debit Amount (LCY)")
            {
            }
            column(CrAmtTot; Vendor."Credit Amount (LCY)")
            {
            }
            column(CompanyLogo; Companyinfo.Picture)
            {
            }
            column(HeaderChange; HeaderChange)
            {
            }
            column(VendType; ' ')
            {
            }
            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                CalcFields = "Credit Amount (LCY)", "Debit Amount (LCY)";
                DataItemLink = "Vendor No." = FIELD("No."), "Posting Date" = FIELD("Date Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Date Filter" = FIELD("Date Filter");
                DataItemTableView = SORTING("Vendor No.", "Posting Date");

                column(PostingDate_VendLedgEntry; Format("Posting Date"))
                {
                }
                column(DocType_VendLedgEntry; "Document Type")
                {
                    IncludeCaption = true;
                }
                column(DocNo_VendLedgerEntry; "Document No.")
                {
                    IncludeCaption = true;
                }
                column(Desc_VendLedgerEntry; Description)
                {
                    IncludeCaption = true;
                }
                column(VendAmount; VendAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendBalLCY2; VendBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(VendRemainAmount; VendRemainAmount)
                {
                    AutoFormatExpression = VendCurrencyCode;
                    AutoFormatType = 1;
                }
                column(VendEntryDueDate; Format(VendEntryDueDate))
                {
                }
                column(EntryNo_VendorLedgerEntry; "Entry No.")
                {
                    IncludeCaption = true;
                }
                column(VendCurrencyCode; VendCurrencyCode)
                {
                }
                column(ExtDocNo; "Vendor Ledger Entry"."External Document No.")
                {
                    IncludeCaption = true;
                }
                column(DrAmt; "Vendor Ledger Entry"."Debit Amount (LCY)")
                {
                    IncludeCaption = true;
                }
                column(CrAmt; "Vendor Ledger Entry"."Credit Amount (LCY)")
                {
                    IncludeCaption = true;
                }
                column(OrglAmt; "Vendor Ledger Entry"."Original Amount")
                {
                }
                Column(RemAmt; "Vendor Ledger Entry"."Remaining Amount")
                {
                }
                Column(TDSAmt; TDSamt)
                {
                }
                Column(NetAmt; NetAmt)
                {
                }
                column(TotalNetAmt; TotalNetAmt) { }
                Column(Cmts; Cmts)
                {
                }
                column(cdLocation; cdLocCode)
                {
                }
                column(txtNarr; txtNarr)
                {
                }
                dataitem("Posted Narration"; "Posted Narration")
                {
                    DataItemLink = "Transaction No." = FIELD("Transaction No.");
                    DataItemTableView = SORTING("Transaction No.");

                    column(P_Narr; "Posted Narration".Narration)
                    {
                    }
                }
                dataitem("Purch. Comment Line"; "Purch. Comment Line")
                {
                    DataItemLink = "No." = FIELD("Document No.");
                    DataItemTableView = SORTING("Document Type", "No.", "Document Line No.", "Line No.") WHERE("Document Type" = FILTER(> Receipt), "Document Line No." = CONST(0));

                    column(Purch_Comment; "Purch. Comment Line".Comment)
                    {
                    }
                }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    CalcFields = "Cost Amount (Actual)";
                    DataItemLink = "Entry No." = FIELD("Item Ledger Entry No.");
                    DataItemTableView = SORTING("Entry No.");

                    column(txtEntryType; txtEntryType)
                    {
                    }
                    column(ItemNo; "Item Ledger Entry"."Item No.")
                    {
                    }
                    column(ItemName; recItem.Description)
                    {
                    }
                    column(UOM; "Item Ledger Entry"."Unit of Measure Code")
                    {
                    }
                    column(ItemQty; "Item Ledger Entry".Quantity)
                    {
                    }
                    column(CostAmtActual; "Item Ledger Entry"."Cost Amount (Actual)")
                    {
                    }
                    column(UnitCost; decUnitCost)
                    {
                    }
                    trigger OnAfterGetRecord()
                    begin
                        if ("Entry Type" = "Entry Type"::Sale) then
                            txtEntryType := 'Item_Iss'
                        else if ("Entry Type" = "Entry Type"::"Positive Adjmt.") then
                            txtEntryType := 'Item_Rev'
                        else
                            Clear(txtEntryType);
                        recItem.Get("Item Ledger Entry"."Item No.");
                        if ("Item Ledger Entry".Quantity <> 0) then
                            decUnitCost := "Item Ledger Entry"."Cost Amount (Actual)" / "Item Ledger Entry".Quantity
                        else
                            Clear(decUnitCost);
                    end;
                }
                dataitem("Detailed Vendor Ledg. Entry"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Vendor Ledger Entry No.", "Entry Type", "Posting Date") WHERE("Entry Type" = CONST("Correction of Remaining Amount"));

                    column(EntryTyp_DetVendLedgEntry; "Entry Type")
                    {
                    }
                    column(Correction; Correction)
                    {
                        AutoFormatType = 1;
                    }
                    trigger OnAfterGetRecord()
                    begin
                        Correction := Correction + "Amount (LCY)";
                        VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPostDataItem()
                    begin
                        SumCorrections := SumCorrections + Correction;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetFilter("Posting Date", VendDateFilter);
                    end;
                }
                dataitem("Detailed Vendor Ledg. Entry2"; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Vendor Ledger Entry No." = FIELD("Entry No.");
                    DataItemTableView = SORTING("Vendor Ledger Entry No.", "Entry Type", "Posting Date") WHERE("Entry Type" = CONST("Appln. Rounding"));

                    column(Entry_DetVendLedgEntry2; "Entry Type")
                    {
                    }
                    column(VendBalanceLCY3; VendBalanceLCY)
                    {
                        AutoFormatType = 1;
                    }
                    column(ApplicationRounding; ApplicationRounding)
                    {
                        AutoFormatType = 1;
                    }
                    trigger OnAfterGetRecord()
                    begin
                        ApplicationRounding := ApplicationRounding + "Amount (LCY)";
                        VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetFilter("Posting Date", VendDateFilter);
                    end;
                }
                trigger OnAfterGetRecord()
                begin
                    CalcFields(Amount, "Remaining Amount", "Amount (LCY)", "Remaining Amt. (LCY)");
                    VendLedgEntryExists := true;
                    if PrintAmountsInLCY then begin
                        VendAmount := "Amount (LCY)";
                        VendRemainAmount := "Remaining Amt. (LCY)";
                        VendCurrencyCode := '';
                    end
                    else begin
                        VendAmount := Amount;
                        VendRemainAmount := "Remaining Amount";
                        VendCurrencyCode := "Currency Code";
                    end;
                    VendBalanceLCY := VendBalanceLCY + "Amount (LCY)";
                    if ("Document Type" = "Document Type"::Payment) or ("Document Type" = "Document Type"::Refund) then
                        VendEntryDueDate := 0D
                    else
                        VendEntryDueDate := "Due Date";
                    /* 
                                        recGlEntry.Reset;
                                        recGlEntry.SetCurrentKey("Transaction No.");
                                        recGlEntry.SetRange("Transaction No.", "Transaction No.");
                                        recGlEntry.SetFilter("Location Code", '<>%1', '');
                                        if recGlEntry.FindFirst then
                                            cdLocCode := recGlEntry."Location Code"
                                        else
                                            Clear(cdLocCode); */
                    // recGlEntry.Reset;
                    // recGlEntry.SetCurrentKey("Transaction No.");
                    // recGlEntry.SetRange("Transaction No.", "Transaction No.");
                    // recGlEntry.SetFilter(Narration, '<>%1', '');
                    // if recGlEntry.FindFirst then
                    //     txtNarr := recGlEntry.Narration
                    // else
                    //     Clear(txtNarr);
                    //CIT272 BEGIN MOVED FROM NAV TO BC
                    // IF "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::Invoice THEN BEGIN
                    //     CLEAR(Cmts);
                    //     PurInvHeader.RESET;
                    //     PurInvHeader.SETRANGE("No.", "Vendor Ledger Entry"."Document No.");
                    //     IF PurInvHeader.FINDFIRST THEN BEGIN
                    //         PurCmtLine.RESET;
                    //         PurCmtLine.SETRANGE("No.", PurInvHeader."No.");
                    //         IF PurCmtLine.FINDSET THEN
                    //             REPEAT
                    //                 Cmts += PurCmtLine.Comments1;
                    //             UNTIL PurCmtLine.NEXT = 0;
                    //     END;
                    // END;
                    // IF "Vendor Ledger Entry"."Document Type" = "Vendor Ledger Entry"."Document Type"::"Credit Memo" THEN BEGIN
                    //     CLEAR(Cmts);
                    //     PurCrmemoHdr.RESET;
                    //     PurCrmemoHdr.SETRANGE("No.", "Vendor Ledger Entry"."Document No.");
                    //     IF PurCrmemoHdr.FINDFIRST THEN BEGIN
                    //         PurCmtLine.RESET;
                    //         PurCmtLine.SETRANGE("No.", PurCrmemoHdr."No.");
                    //         IF PurCmtLine.FINDSET THEN
                    //             REPEAT
                    //                 Cmts += PurCmtLine.Comments1;
                    //             UNTIL PurCmtLine.NEXT = 0;
                    //     END;
                    // END;
                    //CIT312 Start
                    CLEAR(TDSamt);
                    TDSEntry.RESET;
                    TDSEntry.SETRANGE("Document No.", "Document No.");
                    IF TDSEntry.FINDFIRST THEN TDSamt := TDSEntry."TDS Amount";
                    CLEAR(NetAmt);
                    PurInvHeader.RESET;
                    PurInvHeader.SETRANGE("No.", "Document No.");
                    IF PurInvHeader.FINDFIRST THEN BEGIN
                        PurInvHeader.CALCFIELDS(Amount);
                        NetAmt := PurInvHeader.Amount;
                        repeat
                            TotalNetAmt += PurInvHeader.Amount;
                        until PurInvHeader.NEXT = 0;
                    END;
                    //CIT312 End
                    //CIT272 END MOVED FROM NAV TO BC


                    Clear(totalGSTAmount);
                    DetailedGSTEntryBuffer.RESET;
                    DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Purchase);
                    DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                    if DetailedGSTEntryBuffer.FINDSET then
                        repeat
                            // case DetailedGSTEntryBuffer."GST Component Code" of 
                            //     'IGST':
                            //         begin
                            //             TotalGSTAmount += DetailedGSTEntryBuffer."GST Amount";
                            //         end;
                            //     'CGST':
                            //         begin
                            //             TotalGSTAmount += DetailedGSTEntryBuffer."GST Amount";
                            //         end;
                            //     'SGST':
                            //         begin
                            //             TotalGSTAmount += DetailedGSTEntryBuffer."GST Amount";
                            //         end;
                            // end;
                            TotalGSTAmount += DetailedGSTEntryBuffer."GST Amount";
                        until DetailedGSTEntryBuffer.NEXT = 0;





                end;

                trigger OnPreDataItem()
                begin
                    VendLedgEntryExists := false;
                    CurrReport.CreateTotals(VendAmount, "Amount (LCY)");
                end;
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

                column(VendBalanceLCY4; VendBalanceLCY)
                {
                    AutoFormatType = 1;
                }
                column(StartBalAdjLCY1; StartBalAdjLCY)
                {
                }
                column(StartBalanceLCY1; StartBalanceLCY)
                {
                }
                column(VendBalStrtBalStrtBalAdj; VendBalanceLCY - StartBalanceLCY - StartBalAdjLCY)
                {
                    AutoFormatType = 1;
                }
                trigger OnAfterGetRecord()
                begin
                    if not VendLedgEntryExists and ((StartBalanceLCY = 0) or ExcludeBalanceOnly) then begin
                        StartBalanceLCY := 0;
                        //CurrReport.SKIP;  // btech asw commented for sake of mail sending with 0 balances also
                    end;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                // LMS 190615
                HeaderChange := CopyStr(Vendor."No.", 1, 1);
                // END
                if PrintOnlyOnePerPage then PageGroupNo := PageGroupNo + 1;
                StartBalanceLCY := 0;
                StartBalAdjLCY := 0;
                if VendDateFilter <> '' then begin
                    if GetRangeMin("Date Filter") <> 0D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        CalcFields("Net Change (LCY)");
                        StartBalanceLCY := -"Net Change (LCY)";
                    end;
                    SetFilter("Date Filter", VendDateFilter);
                    CalcFields("Net Change (LCY)");
                    StartBalAdjLCY := -"Net Change (LCY)";
                    VendorLedgerEntry.SetCurrentKey("Vendor No.", "Posting Date");
                    VendorLedgerEntry.SetRange("Vendor No.", "No.");
                    VendorLedgerEntry.SetFilter("Posting Date", VendDateFilter);
                    if VendorLedgerEntry.Find('-') then
                        repeat
                            VendorLedgerEntry.SetFilter("Date Filter", VendDateFilter);
                            VendorLedgerEntry.CalcFields("Amount (LCY)");
                            StartBalAdjLCY := StartBalAdjLCY - VendorLedgerEntry."Amount (LCY)";
                            "Detailed Vendor Ledg. Entry".SetCurrentKey("Vendor Ledger Entry No.", "Entry Type", "Posting Date");
                            "Detailed Vendor Ledg. Entry".SetRange("Vendor Ledger Entry No.", VendorLedgerEntry."Entry No.");
                            "Detailed Vendor Ledg. Entry".SetFilter("Entry Type", '%1|%2', "Detailed Vendor Ledg. Entry"."Entry Type"::"Correction of Remaining Amount", "Detailed Vendor Ledg. Entry"."Entry Type"::"Appln. Rounding");
                            "Detailed Vendor Ledg. Entry".SetFilter("Posting Date", VendDateFilter);
                            if "Detailed Vendor Ledg. Entry".Find('-') then
                                repeat
                                    StartBalAdjLCY := StartBalAdjLCY - "Detailed Vendor Ledg. Entry"."Amount (LCY)";
                                until "Detailed Vendor Ledg. Entry".Next = 0;
                            "Detailed Vendor Ledg. Entry".Reset;
                        until VendorLedgerEntry.Next = 0;
                end;
                //CurrReport.PrintOnlyIfDetail := ExcludeBalanceOnly or (StartBalanceLCY = 0);
                VendBalanceLCY := StartBalanceLCY + StartBalAdjLCY;
            end;

            trigger OnPreDataItem()
            begin
                PageGroupNo := 1;
                SumCorrections := 0;
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
                CurrReport.CreateTotals("Vendor Ledger Entry"."Amount (LCY)", StartBalanceLCY, StartBalAdjLCY, Correction, ApplicationRounding, "Vendor Ledger Entry"."Debit Amount (LCY)", "Vendor Ledger Entry"."Credit Amount (LCY)");
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(ShowAmountsInLCY; PrintAmountsInLCY)
                    {
                        Caption = 'Show Amounts in LCY';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Show Amounts in LCY field.';
                    }
                    field(PrintOnlyOnePerPage; PrintOnlyOnePerPage)
                    {
                        Caption = 'New Page per Vendor';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the New Page per Vendor field.';
                    }
                    field(ExcludeBalanceOnly; ExcludeBalanceOnly)
                    {
                        Caption = 'Exclude Vendors That Have A Balance Only';
                        MultiLine = true;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Exclude Vendors That Have A Balance Only field.';
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        VendFilter := Vendor.GetFilters;
        VendDateFilter := Vendor.GetFilter("Date Filter");
        if PrintAmountsInLCY then begin
            AmountCaption := "Vendor Ledger Entry".FieldCaption("Amount (LCY)");
            RemainingAmtCaption := "Vendor Ledger Entry".FieldCaption("Remaining Amt. (LCY)");
        end
        else begin
            AmountCaption := "Vendor Ledger Entry".FieldCaption(Amount);
            RemainingAmtCaption := "Vendor Ledger Entry".FieldCaption("Remaining Amount");
        end;
        Companyinfo.Get;
        Companyinfo.CalcFields(Picture);
    end;

    var
        Text000: Label 'Period: %1';
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        VendFilter: Text;
        VendDateFilter: Text[30];
        VendAmount: Decimal;
        VendRemainAmount: Decimal;
        VendBalanceLCY: Decimal;
        VendEntryDueDate: Date;
        StartBalanceLCY: Decimal;
        StartBalAdjLCY: Decimal;
        Correction: Decimal;
        ApplicationRounding: Decimal;
        ExcludeBalanceOnly: Boolean;
        PrintAmountsInLCY: Boolean;
        PrintOnlyOnePerPage: Boolean;
        VendLedgEntryExists: Boolean;
        AmountCaption: Text[30];
        RemainingAmtCaption: Text[30];
        VendCurrencyCode: Code[10];
        PageGroupNo: Integer;
        SumCorrections: Decimal;
        VendDetailTrialBalCapLbl: Label 'Vendor - Detail Trial Balance';
        PageCaptionLbl: Label 'Page';
        AllamountsareinLCYCaptionLbl: Label 'All amounts are in LCY';
        ReportIncludesvendorshavebalanceCaptionLbl: Label 'This report also includes vendors that only have balances.';
        PostingDateCaptionLbl: Label 'Posting Date';
        BalanceLCYCaptionLbl: Label 'Balance (LCY)';
        DueDateCaptionLbl: Label 'Due Date';
        AdjofOpeningBalanceCaptionLbl: Label 'Adj. of Opening Balance';
        TotalLCYCaptionLbl: Label 'Total (LCY)';
        TotalAdjofOpenBalCaptionLbl: Label 'Total Adj. of Opening Balance';
        TotalLCYBeforePeriodCaptionLbl: Label 'Total (LCY) Before Period';
        recGlEntry: Record "G/L Entry";
        DrBalTotal: Decimal;
        CrBalTotal: Decimal;
        txtEntryType: Text[15];
        recItem: Record Item;
        txtNarr: Text[250]; //CIT272 CHANGED SIZE FROM 100 TO 250
        cdLocCode: Code[10];
        decUnitCost: Decimal;
        Companyinfo: Record "Company Information";
        HeaderChange: Text[1];
        //CIT272 BEGIN MOVED FROM NAV TO BC
        PurInvHeader: Record "Purch. Inv. Line";
        PurCmtLine: Record "Purch. Comment Line";
        Cmts: Text[250];
        PurCrmemoHdr: Record "Purch. Cr. Memo Hdr.";
        TDSEntry: Record "TDS Entry";
        TDSamt: Decimal;
        NetAmt: Decimal;
        TotalNetAmt: Decimal;
        DetailedGSTEntryBuffer: Record 18001;
        TotalGSTAmount: Decimal;
    //CIT272 END MOVED FROM NAV TO BC
    procedure InitializeRequest(NewPrintAmountsInLCY: Boolean; NewPrintOnlyOnePerPage: Boolean; NewExcludeBalanceOnly: Boolean)
    begin
        PrintAmountsInLCY := NewPrintAmountsInLCY;
        PrintOnlyOnePerPage := NewPrintOnlyOnePerPage;
        ExcludeBalanceOnly := NewExcludeBalanceOnly;
    end;
}
