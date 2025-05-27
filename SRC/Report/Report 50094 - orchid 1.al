report 50094 "orchid 1"
{
    // version LSL
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/orchid 1.rdl';

    Permissions = TableData 112 = rimd,
                  TableData 113 = rimd;
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            CalcFields = "QR Code";
            RequestFilterFields = "No.";
            column(ExternalDocsNo; "Sales Invoice Header"."External Document No.")
            {
            }
            column(QRCode; "Sales Invoice Header"."QR Code")
            {
            }
            column(AckNo; "Sales Invoice Header"."Acknowledgement No.")
            {
            }
            column(IRNNo; "Sales Invoice Header"."IRN Hash")
            {
            }
            column(AckDateq; "Sales Invoice Header"."Acknowledgement Date")
            {
            }
            column(SalesComments; SalesComments)
            {
            }
            column(CopyText2; CopyText)
            {
            }
            column(InvText; InvText)
            {
            }
            column(SrNo; SrNo)
            {
            }
            column(V1; V1)
            {
            }
            column(V2; V2)
            {
            }
            column(V3; V3)
            {
            }
            column(V4; V4)
            {
            }
            column(V5; V5)
            {
            }
            column(V6; V6)
            {
            }
            column(V7; V7)
            {
            }
            column(V8; V8)
            {
            }
            column(V9; V9)
            {
            }
            column(V10; V10)
            {
            }
            column(V11; V11)
            {
            }
            column(V12; V12)
            {
            }
            column(V13; V13)
            {
            }
            column(V14; V14)
            {
            }
            column(V15; V15)
            {
            }
            column(V16; V16)
            {
            }
            column(V17; V17)
            {
            }
            column(V18; V18)
            {
            }
            column(V19; V19)
            {
            }
            column(CompPic; CompRec.Picture)
            {
            }
            column(Comp_Name; CompRec.Name)
            {
            }
            column(Comp_GSTTIN; CompRec."GST Registration No.")
            {
            }
            column(Comp_Add; CompRec.Address)
            {
            }
            column(Comp_Add2; CompRec."Address 2" + CompRec.City + '-' + CompRec."Post Code")
            {
            }
            column(CIN_No; CompRec."Registration No.")
            {
            }
            column(Comp_State; CompRec."State Code")
            {
            }
            column(CompStateName; StateComp.Description)
            {
            }
            column(CompStateCode; StateComp."State Code (GST Reg. No.)")
            {
            }
            column(CompPhoneNo; CompRec."Phone No." + ' ' + CompRec."Phone No. 2")
            {
            }
            column(CompEmail; CompRec."E-Mail")
            {
            }
            column(CompPAN; CompRec."P.A.N. No.")
            {
            }
            column(PaymentTermsCode_; "Sales Invoice Header"."Payment Terms Code")
            {
            }
            column(DespatchThrough; DespatchThrough)
            {
            }
            column(InvoiceDiscountAmount; "Sales Invoice Header"."Invoice Discount Amount")
            {
            }
            column(CompWeb; CompRec."Home Page")
            {
            }
            column(AmtToCust; TotAmt)
            {
            }
            column(TCSAmount; ABS(TCSAmount))
            {
            }
            dataitem(CopyLoop; Integer)////Table2000000026
            {
                DataItemTableView = SORTING(Number);
                column(PageNo1; CurrReport.PAGENO)
                {
                }
                column(CopyText; CopyText)
                {
                }
                column(OutputNo; OutputNo)
                {
                }
                column(ExternalNo; ExternalNo)
                {
                }
                column(RoundOff3; RoundOff)
                {
                }
                column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
                {
                }
                column(ShiptoName_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Name")
                {
                }
                column(ShiptoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Ship-to Address")
                {
                }
                column(BilltoName_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Customer Name")
                {
                }
                column(BilltoAddress_SalesInvoiceHeader; "Sales Invoice Header"."Sell-to Address" + ' ' + "Sales Invoice Header"."Sell-to Address 2" + ',Pin Code- ' + "Sales Invoice Header"."Sell-to Post Code")
                {
                }
                column(PostingDate_SalesInvoiceHeader; "Sales Invoice Header"."Posting Date")
                {
                }
                column(SIHOrderNo; "Sales Invoice Header"."Order No.")
                {
                }
                column(Ewaybill; "Sales Invoice Header"."E-Way Bill No.")
                {
                }
                column(AmtInWord; NumTxt[1] + NumTxt[2])
                {
                }
                column(AmtInWord1; NumTxt1[1] + NumTxt1[2])
                {
                }
                column(Ship_Name; "Sales Invoice Header"."Ship-to Name")
                {
                }
                column(Ship_Add; "Sales Invoice Header"."Ship-to Address" + ' ' + "Sales Invoice Header"."Ship-to Address 2")
                {
                }
                column(Destination; "Sales Invoice Header"."Ship-to City" + ', Pin Code- ' + "Sales Invoice Header"."Sell-to Post Code")
                {
                }
                column(Ship_PostCode; "Sales Invoice Header"."Sell-to Post Code")
                {
                }
                column(Cust_St; Cust_St)
                {
                }
                column(Cust_StCode; Cust_StCode)
                {
                }
                column(Cust_GSTNo; Cust_GSTNo)
                {
                }
                column(Ship_StCode; Ship_StCode)
                {
                }
                column(Ship_St; Ship_St)
                {
                }
                column(Ship_GSTNo; "Sales Invoice Header"."Ship-to GST Reg. No.")
                {
                }
                column(Pic; CompRec.Picture)
                {
                }
                column(VehicleNo_SalesInvoiceHeader; "Sales Invoice Header"."Vehicle No.")
                {
                }
                column(TransportMethod_SalesInvoiceHeader; "Sales Invoice Header"."Transport Method")
                {
                }
                column(ShipmentDate_SalesInvoiceHeader; "Sales Invoice Header"."Shipment Date")
                {
                }
                column(Freight; Freight)
                {
                }
                column(Insurance; Insurance)
                {
                }
                column(Packing; Packing)
                {
                }
                column(TotAmt; TotAmt)
                {
                }
                column(AmounttoCustomer_SalesInvoiceHeader; "Sales Invoice Header".Amount)//"Amount to Customer")
                {
                }
                column(ShipPAN; ShipPAN)
                {
                }
                column(ShipStateName; ShipStateName)
                {
                }
                column(ContactPersn; ContactPersn)
                {
                }
                column(PlaceOfSuply; "Sales Invoice Header"."Ship-to City")
                {
                }
                column(ContactNo; ContactNo)
                {
                }
                column(ContctEmail; ContctEmail)
                {
                }
                column(ShipToCode; "Sales Invoice Header"."Ship-to Code")
                {
                }
                column(ShiptoGSTIN; ShiptoGSTIN)
                {
                }
                column(IRNNo_SalesInvoiceHeader; "Sales Invoice Header"."IRN Hash")
                {
                }
                column(BarCode_SalesInvoiceHeader; '')//"Sales Invoice Header"."Bar Code")
                {
                }
                column(QRCode_SalesInvoiceHeader; "Sales Invoice Header"."QR Code")
                {
                }
                column(AckDate_SalesInvoiceHeader; MonthText + Daytext + YearText)
                {
                }
                column(PageCaption; PageCaptionCap)
                {
                }
                dataitem("Sales Invoice Line"; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = FIELD("No.");
                    DataItemLinkReference = "Sales Invoice Header";
                    DataItemTableView = SORTING("Document No.", "No.")
                                        ORDER(Ascending)
                                        WHERE("No." = FILTER(<> 46000051),
                                              Quantity = FILTER(<> 0));
                    column(CustLYC; CustLYC)
                    {
                    }
                    column(S_No; S_No)
                    {
                    }
                    column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                    {
                    }
                    column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                    {
                    }
                    column(UnitofMeasure_SalesInvoiceLine; "Sales Invoice Line"."Unit of Measure")
                    {
                    }
                    column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                    {
                    }
                    column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
                    {
                    }
                    column(LineDiscountAmount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount Amount")
                    {
                    }
                    column(Amount_SalesInvoiceLine; "Sales Invoice Line"."Line Amount")
                    {
                    }
                    column(TaxAmount_SalesInvoiceLine; ABS(IGST_Amt) + ABS(CGST_Amt) + ABS(SGST_Amt))//cgst+igst+sgst
                    {
                    }
                    column(AmountToCustomer_SalesInvoiceLine; "Sales Invoice Line".Amount)
                    {
                    }
                    column(ChargesToCustomer_SalesInvoiceLine; 0)//"Sales Invoice Line"."Charges To Customer")
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
                    column(SGST_Perc; ABS(SGST_Perc))
                    {
                    }
                    column(SGST_Amt; ABS(SGST_Amt))
                    {
                    }
                    column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
                    {
                    }
                    column(GSTPlaceofSupply_SalesInvoiceLine; "Sales Invoice Line"."GST Place of Supply")
                    {
                    }
                    column(GST_Group_Type; "Sales Invoice Line"."GST Group Type")
                    {
                    }
                    column(HSA_SAC_Caption; HSA_SAC_Caption)
                    {
                    }
                    column(TotalIGSTAmt; TotalIGSTAmt)
                    {
                    }
                    column(LineDiscount_; "Sales Invoice Line"."Line Discount %")
                    {
                    }
                    column(LineDiscountAmount_; "Sales Invoice Line"."Line Discount Amount")
                    {
                    }
                    column(GST_SalesInvoiceLine; ROUND(ABS(IGST_Perc) + ABS(CGST_Perc) + ABS(SGST_Perc), 1))//Line GST % from 18001
                    {
                    }
                    column(HSNIGSTPerc; HSNIGSTPerc)
                    {
                    }
                    column(HSNSGSTPerc; HSNSGSTPerc)
                    {
                    }
                    column(HSNCGSTPerc; HSNCGSTPerc)
                    {
                    }
                    column(HSNCGSTAmt; ABS(HSNCGSTAmt))
                    {
                    }
                    column(HSNSGSTAmt; ABS(HSNSGSTAmt))
                    {
                    }
                    column(HSNIGSTAmt; ABS(HSNIGSTAmt))
                    {
                    }
                    column(OrderNo_; "Sales Invoice Line"."Order No.")
                    {
                    }
                    column(TotalGSTAmount_; ABS(IGST_Amt) + ABS(CGST_Amt) + ABS(SGST_Amt))//cgst+sgst_igst
                    {
                    }
                    column(GSTJurisdictionType_; "Sales Invoice Line"."GST Jurisdiction Type")
                    {
                    }
                    column(GSTBaseAmount_SalesInvoiceLine; "Sales Invoice Line"."Line Amount")//18001 base amount//////
                    {
                    }
                    column(GLQty; GLQty)
                    {
                    }
                    column(GSTPer; GSTPer)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        CLEAR(TotalIGSTAmt);

                        IF ItemNoGroup <> "Sales Invoice Line"."No." THEN BEGIN
                            ItemNoGroup := "Sales Invoice Line"."No.";
                            S_No := S_No + 1;
                        END;

                        Freight := 0;
                        GLQty := 0;
                        SLRec1.RESET;
                        SLRec1.SETRANGE("Document No.", "Document No.");
                        SLRec1.SETRANGE(Type, SLRec1.Type::"G/L Account");
                        SLRec1.SETRANGE("No.", '20080150');
                        IF SLRec1.FINDFIRST THEN BEGIN
                            Freight := SLRec1."Line Amount";
                            GLQty := SLRec1.Quantity;
                        END;

                        IGST_Perc := 0;
                        IGST_Amt := 0;
                        CGST_Perc := 0;
                        CGST_Amt := 0;
                        SGST_Perc := 0;
                        SGST_Amt := 0;
                        TotalIGSTAmt := 0;
                        DetailedGSTEntryBuffer.RESET;
                        DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Sales);
                        DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                        DetailedGSTEntryBuffer.SETRANGE("No.", "No.");
                        IF DetailedGSTEntryBuffer.FINDSET THEN
                            REPEAT
                                IF (DetailedGSTEntryBuffer."GST Component Code" = 'IGST') OR (DetailedGSTEntryBuffer."GST Component Code" = 'IGST-I') THEN BEGIN
                                    IGST_Perc := DetailedGSTEntryBuffer."GST %";
                                    IGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                END;
                                IF DetailedGSTEntryBuffer."GST Component Code" = 'SGST' THEN BEGIN
                                    SGST_Perc := DetailedGSTEntryBuffer."GST %";
                                    SGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                END;
                                IF DetailedGSTEntryBuffer."GST Component Code" = 'CGST' THEN BEGIN
                                    CGST_Perc := DetailedGSTEntryBuffer."GST %";
                                    CGST_Amt := DetailedGSTEntryBuffer."GST Amount";
                                    //   MESSAGE('%1|%2',CGST_Perc,CGST_Amt);
                                END;
                            UNTIL DetailedGSTEntryBuffer.NEXT = 0;
                        //CustLYC:=AmtToCust+ABS(SGST_Amt+CGST_Amt+IGST_Amt)
                        IF "Sales Invoice Line"."GST Group Type" = "Sales Invoice Line"."GST Group Type"::Goods THEN
                            HSA_SAC_Caption := 'HSA'
                        ELSE
                            HSA_SAC_Caption := 'SAC';

                        DetailedGSTEntryBuffer.RESET;
                        DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Sales);
                        DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                        IF DetailedGSTEntryBuffer.FINDSET THEN
                            REPEAT
                                TotalIGSTAmt += ABS(DetailedGSTEntryBuffer."GST Amount");
                            UNTIL DetailedGSTEntryBuffer.NEXT = 0;

                        HSNIGSTPerc := 0;
                        HSNIGSTAmt := 0;
                        HSNCGSTPerc := 0;
                        HSNCGSTAmt := 0;
                        HSNSGSTPerc := 0;
                        HSNSGSTAmt := 0;
                        DetailedGSTEntryBuffer.RESET;
                        DetailedGSTEntryBuffer.SETCURRENTKEY("Transaction Type", "Document No.", "HSN/SAC Code");
                        DetailedGSTEntryBuffer.SETRANGE("Transaction Type", DetailedGSTEntryBuffer."Transaction Type"::Sales);
                        DetailedGSTEntryBuffer.SETRANGE("Document No.", "Document No.");
                        DetailedGSTEntryBuffer.SETRANGE("HSN/SAC Code", "HSN/SAC Code");
                        IF DetailedGSTEntryBuffer.FINDSET THEN
                            REPEAT
                                IF (DetailedGSTEntryBuffer."GST Component Code" = 'IGST') OR (DetailedGSTEntryBuffer."GST Component Code" = 'IGST-I') THEN BEGIN
                                    HSNIGSTPerc := DetailedGSTEntryBuffer."GST %";
                                    HSNIGSTAmt += DetailedGSTEntryBuffer."GST Amount";
                                END;
                                IF DetailedGSTEntryBuffer."GST Component Code" = 'SGST' THEN BEGIN
                                    HSNSGSTPerc := DetailedGSTEntryBuffer."GST %";
                                    HSNSGSTAmt += DetailedGSTEntryBuffer."GST Amount";
                                END;
                                IF DetailedGSTEntryBuffer."GST Component Code" = 'CGST' THEN BEGIN
                                    HSNCGSTPerc := DetailedGSTEntryBuffer."GST %";
                                    HSNCGSTAmt += DetailedGSTEntryBuffer."GST Amount";
                                END;
                            UNTIL DetailedGSTEntryBuffer.NEXT = 0;

                        TotAmt := 0;
                        DiscountAmt := 0;
                        SLRec.RESET;
                        SLRec.SETRANGE("Document No.", "Document No.");
                        SLRec.SETFILTER(Type, '<>%1', SLRec.Type::"G/L Account");
                        IF SLRec.FINDSET THEN
                            REPEAT
                                TotAmt += SLRec."Line Amount";

                                DiscountAmt += SLRec."Line Discount Amount";
                            UNTIL SLRec.NEXT = 0;
                        TotAmt := TotAmt + TotalIGSTAmt + RoundOff - "Sales Invoice Header"."Invoice Discount Amount";
                        CheckRep.InitTextVariable;
                        CheckRep.FormatNoText(NumTxt, TotAmt, "Sales Invoice Header"."Currency Code");
                        //CheckRep.FormatNoText(NumTxt,"Sales Invoice Header"."Amount to Customer","Sales Invoice Header"."Currency Code"); GP

                        CheckRep.InitTextVariable;
                        CheckRep.FormatNoText(NumTxt1, TotalIGSTAmt, "Sales Invoice Header"."Currency Code");
                        GSTPer1 := '';
                        //GSTPer := 0; //Calculate 18001
                        IF ROUND(ABS(IGST_Perc) + ABS(CGST_Perc) + ABS(SGST_Perc), 0.01) <> 0 THEN
                            GSTPer1 := FORMAT(ROUND(ABS(IGST_Perc) + ABS(CGST_Perc) + ABS(SGST_Perc), 0.01))
                        ELSE
                            GSTPer1 := COPYSTR("Sales Invoice Line"."GST Group Code", 1, 2);
                        //IF "Sales Invoice Line"."GST %"<>0 THEN // GP
                        GSTPer := ABS(IGST_Perc) + ABS(CGST_Perc) + ABS(SGST_Perc);
                        // ELSE
                        //  CurrReport.SKIP;
                        //EVALUATE(GSTPer,GSTPer1);
                    end;

                    trigger OnPreDataItem();
                    begin
                        CLEAR(TotalIGSTAmt);
                    end;
                }

                trigger OnAfterGetRecord();
                var
                    SalesPost: Codeunit 80;
                begin
                    /*IF CurrReport.PAGENO = 1 THEN BEGIN
                     CopyText :='ORIGINAL FOR RECIPIENT';
                     PageV := 1;
                    END;
                    IF Number = 2 THEN BEGIN
                     CopyText :='DUPLICATE FOR TRANSPORTER';
                      PageV := 2;
                    END;
                    
                    IF Number = 3 THEN BEGIN
                     CopyText :='TRIPLICATE FOR SUPPLIER';
                      PageV := 3;
                    END;
                    
                    IF Number > 3 THEN BEGIN
                      CopyText :='EXTRA COPY';
                      PageV := 4;
                    END;
                    */
                    CurrReport.PAGENO := 1;
                    OutputNo += 1;
                    S_No := 0;
                    ItemNoGroup := '';

                end;

                trigger OnPreDataItem();
                var
                    SalesPost: Codeunit 80;
                begin
                    NoOfLoops := ABS(NoOfCopies) + 1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    //CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    //SETRANGE(Number, 1, 1);
                    OutputNo := 1;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                AmtToCust := 0;
                "Sales Invoice Header".CALCFIELDS(Amount);

                IF "Sales Invoice Header"."Invoice Type" = "Sales Invoice Header"."Invoice Type"::Supplementary THEN
                    InvText := 'SUPPLEMENTARY INVOICE'
                ELSE
                    InvText := 'TAX INVOICE';

                SalesComments := '';
                IF "Sales Invoice Header"."Invoice Type" = "Sales Invoice Header"."Invoice Type"::Supplementary THEN BEGIN
                    SalesCommentLine.RESET;
                    SalesCommentLine.SETRANGE("No.", "No.");
                    SalesCommentLine.SETRANGE("Document Line No.", 0);
                    IF SalesCommentLine.FINDFIRST THEN
                        SalesComments := SalesCommentLine.Comment;
                END;

                SrNo := 0;
                SaleInvLine.RESET;
                SaleInvLine.SETCURRENTKEY("Document No.", "No.");
                SaleInvLine.SETRANGE("Document No.", "No.");
                SaleInvLine.SETFILTER("No.", '<>%1', '46000051');
                SaleInvLine.SETFILTER(Quantity, '<>%1', 0);
                IF SaleInvLine.FINDFIRST THEN
                    REPEAT
                        IF ItemNo <> SaleInvLine."No." THEN BEGIN
                            SrNo += 1;
                            ItemNo := SaleInvLine."No.";
                        END;
                    UNTIL SaleInvLine.NEXT = 0;
                HSNNo := 0;
                SaleInvLine.RESET;
                SaleInvLine.SETCURRENTKEY("Document No.", "HSN/SAC Code");
                SaleInvLine.SETRANGE("Document No.", "No.");
                SaleInvLine.SETFILTER("No.", '<>%1', '46000051');
                SaleInvLine.SETFILTER(Quantity, '<>%1', 0);
                IF SaleInvLine.FINDFIRST THEN
                    REPEAT
                        IF HSNCode <> SaleInvLine."HSN/SAC Code" THEN BEGIN
                            HSNNo += 1;
                            HSNCode := SaleInvLine."HSN/SAC Code";
                        END;
                    UNTIL SaleInvLine.NEXT = 0;
                V1 := FALSE;
                V2 := FALSE;
                V3 := FALSE;
                V4 := FALSE;
                V5 := FALSE;
                V6 := FALSE;
                V7 := FALSE;
                V8 := FALSE;
                V9 := FALSE;
                V10 := FALSE;
                V11 := FALSE;
                V12 := FALSE;
                V13 := FALSE;
                V14 := FALSE;
                V15 := FALSE;
                V16 := FALSE;
                V17 := FALSE;
                V18 := FALSE;
                V19 := FALSE;
                IF (((SrNo > 24) AND (SrNo < 27)) OR ((SrNo > 51) AND (SrNo < 53)) OR ((SrNo > 71) AND (SrNo < 73))) THEN
                    V1 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 28)) OR ((SrNo > 51) AND (SrNo < 54)) OR ((SrNo > 71) AND (SrNo < 74))) THEN
                    V2 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 29)) OR ((SrNo > 51) AND (SrNo < 55)) OR ((SrNo > 71) AND (SrNo < 75))) THEN
                    V3 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 30)) OR ((SrNo > 51) AND (SrNo < 56)) OR ((SrNo > 71) AND (SrNo < 76))) THEN
                    V4 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 31)) OR ((SrNo > 51) AND (SrNo < 57)) OR ((SrNo > 71) AND (SrNo < 77))) THEN
                    V5 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 32)) OR ((SrNo > 51) AND (SrNo < 58)) OR ((SrNo > 71) AND (SrNo < 78))) THEN
                    V6 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 33)) OR ((SrNo > 51) AND (SrNo < 59))) THEN
                    V7 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 34)) OR ((SrNo > 51) AND (SrNo < 60))) THEN
                    V8 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 35)) OR ((SrNo > 51) AND (SrNo < 61))) THEN
                    V9 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 36)) OR ((SrNo > 51) AND (SrNo < 62))) THEN
                    V10 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 37)) OR ((SrNo > 51) AND (SrNo < 63))) THEN
                    V11 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 38)) OR ((SrNo > 51) AND (SrNo < 64))) THEN
                    V12 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 39)) OR ((SrNo > 51) AND (SrNo < 65))) THEN
                    V13 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 40)) OR ((SrNo > 51) AND (SrNo < 66))) THEN
                    V14 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 41)) OR ((SrNo > 51) AND (SrNo < 67))) THEN
                    V15 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 42)) OR ((SrNo > 51) AND (SrNo < 68))) THEN
                    V16 := TRUE;
                IF (((SrNo > 24) AND (SrNo < 43)) OR ((SrNo > 51) AND (SrNo < 69))) THEN
                    V17 := TRUE;
                IF ((((SrNo > 24) AND (SrNo < 44)) OR ((SrNo > 51) AND (SrNo < 70))) AND ("Invoice Discount Amount" = 0)) THEN
                    V18 := TRUE;
                IF ((((SrNo > 24) AND (SrNo < 45)) OR ((SrNo > 51) AND (SrNo < 71))) AND ("Invoice Discount Amount" = 0)) THEN
                    V19 := TRUE;


                IF SrNo = 1 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                END;
                IF ((SrNo = 2) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                END;
                IF ((SrNo = 2) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                END;
                IF ((SrNo = 3) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                END;
                IF ((SrNo = 3) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                END;
                IF ((SrNo = 3) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF ((SrNo = 4) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                END;
                IF ((SrNo = 4) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF ((SrNo = 4) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF ((SrNo = 4) AND (HSNNo = 4)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF ((SrNo = 5) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF ((SrNo = 5) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF ((SrNo = 5) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF ((SrNo = 5) AND (HSNNo = 4)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF ((SrNo = 5) AND (HSNNo = 5)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 6) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF ((SrNo = 6) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF ((SrNo = 6) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF ((SrNo = 6) AND (HSNNo = 4)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 6) AND (HSNNo = 5)) THEN BEGIN
                    V1 := TRUE;
                END;
                IF ((SrNo = 7) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF ((SrNo = 7) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF ((SrNo = 7) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 7) AND ((HSNNo = 4) OR (HSNNo = 5) OR (HSNNo = 6))) THEN BEGIN
                    V1 := TRUE;
                END;

                IF ((SrNo = 8) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF ((SrNo = 8) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF ((SrNo = 8) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 8) AND (HSNNo = 4)) THEN BEGIN
                    V1 := TRUE;
                END;

                IF ((SrNo = 8) AND (HSNNo > 4)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                END;
                IF ((SrNo = 9) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF ((SrNo = 9) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 9) AND (HSNNo = 3)) THEN BEGIN
                    V1 := TRUE;
                END;
                IF ((SrNo = 9) AND (HSNNo > 3)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                END;
                IF ((SrNo = 10) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF ((SrNo = 10) AND (HSNNo = 2)) THEN BEGIN
                    V1 := TRUE;
                END;
                IF ((SrNo = 10) AND (HSNNo > 2)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                END;
                IF ((SrNo = 11) AND (HSNNo = 1)) THEN BEGIN
                    V1 := TRUE;
                END;
                IF ((SrNo = 11) AND (HSNNo > 1)) THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF SrNo = 12 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF SrNo = 13 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 14 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF SrNo = 15 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF SrNo = 16 THEN BEGIN
                    V1 := TRUE;
                END;

                IF SrNo = 61 THEN
                    V1 := TRUE;
                V2 := TRUE;
                V3 := TRUE;
                IF SrNo = 62 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 63 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 64 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF SrNo = 65 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF SrNo = 68 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF SrNo = 69 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF SrNo = 70 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF SrNo = 71 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 72 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 73 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                END;
                IF SrNo = 74 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF SrNo = 75 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                END;
                IF SrNo = 93 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                    V11 := TRUE;
                    V12 := TRUE;
                    V13 := TRUE;
                END;
                IF SrNo = 94 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                    V11 := TRUE;
                    V12 := TRUE;
                END;
                IF SrNo = 95 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                    V11 := TRUE;
                END;
                IF SrNo = 96 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                    V10 := TRUE;
                END;
                IF SrNo = 97 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                    V9 := TRUE;
                END;
                IF SrNo = 98 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                    V8 := TRUE;
                END;
                IF SrNo = 99 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                    V7 := TRUE;
                END;
                IF SrNo = 100 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                    V6 := TRUE;
                END;
                IF SrNo = 101 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                    V5 := TRUE;
                END;
                IF SrNo = 102 THEN BEGIN
                    V1 := TRUE;
                    V2 := TRUE;
                    V3 := TRUE;
                    V4 := TRUE;
                END;
                IF SrNo = 23 THEN BEGIN
                    V2 := FALSE;
                    V3 := FALSE;
                END;
                Cust_StCode := '';
                Cust_St := '';
                IF CustRec.GET("Bill-to Customer No.") THEN BEGIN
                    Cust_St := CustRec."State Code";
                    Cust_GSTNo := CustRec."GST Registration No.";
                    IF StateRec.GET(CustRec."State Code") THEN
                        Cust_StCode := StateRec."State Code (GST Reg. No.)";
                END;
                Ship_StCode := '';
                Ship_St := '';
                ShipPAN := '';
                ShipStateName := '';
                ContactPersn := '';
                PlaceOfSuply := '';
                ContactNo := '';
                ContctEmail := '';
                IF CustRec.GET("Sell-to Customer No.") THEN BEGIN
                    Ship_St := CustRec."State Code";
                    Ship_GSTNo := CustRec."GST Registration No.";
                    ShipPAN := CustRec."P.A.N. No.";
                    PlaceOfSuply := CustRec.City;
                    ContactPersn := CustRec.Contact;
                    ContactNo := CustRec."Phone No.";
                    ContctEmail := CustRec."E-Mail";
                    IF StateRec.GET(Ship_St) THEN BEGIN
                        Ship_StCode := StateRec."State Code (GST Reg. No.)";
                        ShipStateName := StateRec.Description;
                    END;
                END;
                /*
                IF ("Ship-to Code"<>'') THEN BEGIN
                    IF ShiptoAddress.GET("Sell-to Customer No.","Ship-to Code") THEN BEGIN
                       Ship_Name:=ShiptoAddress.Name;
                       Ship_Add:=ShiptoAddress.Address+ShiptoAddress."Address 2"+ShiptoAddress.City;
                       Ship_St:=ShiptoAddress.State;                       PlaceOfSuply := ShiptoAddress.City;
                       ContactNo := ShiptoAddress."Phone No.";
                       ContctEmail := ShiptoAddress."E-Mail";
                       IF StateRec.GET(Ship_St) THEN BEGIN
                         Ship_StCode:=StateRec."State Code (GST Reg. No.)";
                         ShipStateName := StateRec.Description;
                       END;
                    END;
                    IF CustRec.GET("Sell-to Customer No.") THEN BEGIN
                       Ship_Name:=CustRec.Name;
                       Ship_Add:=CustRec.Address+CustRec."Address 2"+CustRec.City;
                       Ship_St:=CustRec."State Code";
                       Ship_GSTNo:=CustRec."GST Registration No.";
                       ShipPAN := CustRec."P.A.N. No.";
                       PlaceOfSuply := CustRec.City;
                       ContactPersn := CustRec.Contact;
                       ContactNo := CustRec."Phone No.";
                       ContctEmail := CustRec."E-Mail";
                       IF StateRec.GET(Ship_St) THEN BEGIN
                         Ship_StCode:=StateRec."State Code (GST Reg. No.)";
                         ShipStateName := StateRec.Description;
                       END;
                    END;
                END;
                */
                RoundOff := 0;
                // Str_Odr_Dtls.RESET;
                // Str_Odr_Dtls.SETRANGE("No.", "No.");
                // IF Str_Odr_Dtls.FINDSET THEN
                //     REPEAT
                //         //  IF Str_Odr_Dtls."Tax/Charge Group"='FRIGHT' THEN
                //         //     Freight:=Str_Odr_Dtls."Calculation Value";
                //         IF Str_Odr_Dtls."Tax/Charge Group" = 'INSURANCE' THEN
                //             Insurance := Str_Odr_Dtls."Calculation Value";
                //         IF Str_Odr_Dtls."Tax/Charge Group" = 'PACKING' THEN
                //             Packing := Str_Odr_Dtls."Calculation Value";
                //         IF Str_Odr_Dtls."Tax/Charge Group" = 'ROUNDOFF' THEN
                //             RoundOff += Str_Odr_Dtls."Calculation Value";
                //     UNTIL Str_Odr_Dtls.NEXT = 0;

                IF StateComp.GET(CompRec."State Code") THEN;

                IF "Sales Invoice Header"."Shipping Agent Code" <> '' THEN BEGIN
                    IF ShippingAgent.GET("Sales Invoice Header"."Shipping Agent Code") THEN
                        DespatchThrough := ShippingAgent.Name;
                END ELSE
                    DespatchThrough := "Sales Invoice Header"."Vehicle No.";

                IF "Sales Invoice Header"."Ship-to Code" = '' THEN
                    ShiptoGSTIN := Cust_GSTNo
                ELSE
                    ShiptoGSTIN := "Sales Invoice Header"."Ship-to GST Reg. No.";

                // BarCodeTxt := 'IRN No - ' + "Sales Invoice Header"."IRN No" + 'ACK No-' + "Sales Invoice Header"."Ack No" + 'ACK Date-' + "Sales Invoice Header"."Ack Date";
                // GenrateQRCode(BarCodeTxt);
                /*
                QRCodeProvider:=QRCodeProvider.QRCodeProvider();
                ServerFileName:=QRCodeProvider.GetBarcode(BarCodeTxt);
                
                ClientFileName:=FileMgmt.ClientTempFileName('');
                FileMgmt.DownloadToFile(ServerFileName,ClientFileName);
                FileMgmt.BLOBImport(TempBlob,ClientFileName);
                
                QRCodeProvider.GetBarcode(BarCodeTxt);
                "Sales Invoice Header"."QR Code":=TempBlob.Blob;
                "Sales Invoice Header".MODIFY;
                
                QRCodeProvider:=QRCodeProvider.QRCodeProvider();
                BarCodeProvider := QRCodeProvider;
                ServerFileName:=BarCodeProvider.GetBarcode(BarCodeTxt);
                
                ClientFileName:=FileMgmt.ClientTempFileName('');
                FileMgmt.DownloadToFile(ServerFileName,ClientFileName);
                FileMgmt.BLOBImport(TempBlob,ClientFileName);
                
                BarCodeProvider.GetBarcode(BarCodeTxt);
                "Sales Invoice Header"."Bar Code":=TempBlob.Blob;
                "Sales Invoice Header".MODIFY;
                */
                IF "Sales Invoice Header"."Currency Code" <> '' THEN BEGIN
                    sales1.RESET;
                    sales1.SETCURRENTKEY("Document No.");
                    sales1.SETRANGE("Document No.", "No.");
                    IF sales1.FINDFIRST THEN BEGIN
                        REPEAT
                            AmtToCust += sales1.Amount + TotalIGSTAmt;//cgst+sgst+igst
                        UNTIL sales1.NEXT = 0;
                    END;
                END ELSE BEGIN
                    AmtToCust := "Sales Invoice Header".Amount;
                END;
                // sales2.RESET;
                // sales2.SETCURRENTKEY("Document No.");
                // sales2.SETRANGE("Document No.","No.");
                // IF sales2.FINDFIRST THEN BEGIN
                // gstpercenTage:=sales2.("GST %")/2;
                // gstamt:=(sales2."Total GST Amount")/2;

                Daytext := Format("Sales Invoice Header"."Acknowledgement Date", 6, 2) + '/';
                MonthText := Format("Sales Invoice Header"."Acknowledgement Date", 9, 2) + '/';
                YearText := Format("Sales Invoice Header"."Acknowledgement Date", 1, 4);
                //MESSAGE(Daytext+MonthText+YearText);
                IF "Sales Invoice Header"."Invoice Type" = "Sales Invoice Header"."Invoice Type"::Supplementary THEN
                    ExternalNo := "Sales Invoice Header"."External Document No."
                ELSE
                    ExternalNo := '';
                //  AmtToCust:="Sales Invoice Header"."Amount to Customer";

                GLEntry.RESET;
                GLEntry.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                GLEntry.SETRANGE("G/L Account No.", '11342107');
                IF GLEntry.FINDFIRST THEN
                    TCSAmount := GLEntry.Amount;

            end;

            trigger OnPreDataItem();
            begin
                CLEAR(AmtToCust);
                IF DocNo <> '' THEN
                    SETRANGE("No.", DocNo);

                IF NoOfCopies = 0 THEN
                    CopyText := 'ORIGINAL FOR RECIPIENT';
                IF NoOfCopies = 1 THEN
                    CopyText := 'DUPLICATE FOR TRANSPORTER';
                IF NoOfCopies = 2 THEN
                    CopyText := 'TRIPLICATE FOR SUPPLIER';
                IF NoOfCopies = 3 THEN
                    CopyText := 'EXTRA COPY';
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                // Caption = 'Copies';
                field("No. Of Copies"; NoOfCopies)
                {
                    MaxValue = 3;
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

    trigger OnPreReport();
    begin
        CompRec.GET;
        CompRec.CALCFIELDS(Picture);
        S_No := 0;

        IF NoCopy1 <> 0 THEN
            NoOfCopies := NoCopy1;
    end;

    var
        S_No: Integer;
        DetailedGSTEntryBuffer: Record 18001;
        IGST_Perc: Decimal;
        IGST_Amt: Decimal;
        CGST_Perc: Decimal;
        CGST_Amt: Decimal;
        SGST_Perc: Decimal;
        SGST_Amt: Decimal;
        NumTxt: array[2] of Text[250];
        CheckRep: Report "Posted Voucher";
        TotAmt: Decimal;
        SLRec: Record 113;
        CompRec: Record 79;
        StateRec: Record State;
        Ship_StCode: Code[20];
        Cust_StCode: Code[20];
        CustRec: Record 18;
        Cust_St: Code[10];
        Ship_St: Code[10];
        ShiptoAddress: Record 222;
        Cust_GSTNo: Code[20];
        Ship_GSTNo: Code[20];
        Ship_Name: Text[50];
        Ship_Add: Text[250];
        //Str_Odr_Dtls: Record 13760;
        Freight: Decimal;
        Insurance: Decimal;
        Packing: Decimal;

        HSA_SAC_Caption: Text;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Code[50];
        OutputNo: Integer;
        StateComp: Record State;
        ShipPAN: Code[20];
        ShipStateName: Text;
        ContactPersn: Text;
        PlaceOfSuply: Text;
        ContactNo: Text;
        ContctEmail: Text;
        TotalIGSTAmt: Decimal;
        NumTxt1: array[2] of Text[250];
        DiscountAmt: Decimal;
        DespatchThrough: Code[250];
        HSNIGSTPerc: Decimal;
        HSNSGSTPerc: Decimal;
        HSNCGSTPerc: Decimal;
        HSNIGSTAmt: Decimal;
        HSNSGSTAmt: Decimal;
        HSNCGSTAmt: Decimal;
        ShippingAgent: Record 291;
        ShiptoGSTIN: Code[20];
        RoundOff: Decimal;
        DocNo: Code[20];
        HSNIGSTAmt1: Decimal;
        HSNCGSTAmt1: Decimal;
        HSNSGSTAmt1: Decimal;
        FileMgmt: Codeunit 419;
        TempBlob: Codeunit "Temp Blob";
        BarCodeTxt: Text;
        //QRCodeProvider: DotNet "'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.QRCodeProvider" RUNONCLIENT;
        //BarCodeProvider: DotNet "'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider" RUNONCLIENT;
        ServerFileName: Text;
        ClientFileName: Text;
        Adate: Date;
        Daytext: Text;
        MonthText: Text;
        YearText: Text;
        ItemNoGroup: Code[20];
        SaleInvLine: Record 113;
        SrNo: Integer;
        ItemNo: Code[20];
        V1: Boolean;
        V2: Boolean;
        V3: Boolean;
        V4: Boolean;
        V5: Boolean;
        V6: Boolean;
        V7: Boolean;
        V8: Boolean;
        V9: Boolean;
        V10: Boolean;
        V11: Boolean;
        V12: Boolean;
        V13: Boolean;
        V14: Boolean;
        V15: Boolean;
        V16: Boolean;
        V17: Boolean;
        V18: Boolean;
        V19: Boolean;
        HSNNo: Integer;
        HSNCode: Code[20];
        PageV: Integer;
        PageCaptionCap: TextConst ENU = 'Page %1 of %2', ENN = 'Page %1 of %2';
        InvText: Text;
        GSTPer1: Text;
        GSTPer: Decimal;
        ExternalNo: Code[20];
        SLRec1: Record 113;
        GLQty: Decimal;
        NoCopy1: Integer;
        SalesComments: Text;
        SalesCommentLine: Record 44;
        CustLYC: Decimal;
        AmtToCust: Decimal;
        sales1: Record 113;
        sales2: Record 113;
        gstpercenTage: Decimal;
        gstamt: Decimal;
        TCSAmount: Decimal;
        GLEntry: Record 17;

    procedure SetDocNo(DocNo1: Code[20]; NoCopy: Integer);
    begin
        DocNo := DocNo1;
        NoCopy1 := NoCopy;
    end;

    // local procedure GenrateQRCode(QRCodeTxt: Text);
    // var
    //     TempBlob: Codeunit "Temp Blob";
    //     FieldRef: FieldRef;
    //     QRCodeInput: Text;
    //     QRCodeFileName: Text;
    //     FileManagement: Codeunit 419;
    // begin
    //     // Save a QR code image into a file in a temporary folder.
    //     QRCodeInput := QRCodeTxt;
    //     QRCodeFileName := GetQRCode(QRCodeInput);
    //     QRCodeFileName := MoveToMagicPath(QRCodeFileName); // To avoid confirmation dialogue on RTC.

    //     // Load the image from file into the BLOB field.
    //     CLEAR(TempBlob);
    //     TempBlob.CALCFIELDS(Blob);
    //     FileManagement.BLOBImport(TempBlob, QRCodeFileName);

    //     "Sales Invoice Header"."QR Code" := TempBlob.Blob;
    //     "Sales Invoice Header".MODIFY;
    //     /*
    //     FieldRef := RecRef.FIELD(16629);
    //     FieldRef.VALUE := TempBlob.Blob;
    //     RecRef.MODIFY;
    //     */
    //     // Erase the temporary file.
    //     IF NOT ISSERVICETIER THEN
    //         IF EXISTS(QRCodeFileName) THEN
    //             ERASE(QRCodeFileName);

    // end;

    // procedure MoveToMagicPath(SourceFileName: Text) DestinationFileName: Text[1024];
    // var
    //     FileSystemObject: Automation "{F935DC20-1CF0-11D0-ADB9-00C04FD58A0B} 1.0:{0D43FE01-F093-11CF-8940-00A0C9054228}:'Windows Script Host Object Model'.FileSystemObject";
    //     FileManagement: Codeunit 419;
    // begin
    //     // User Temp Path
    //     DestinationFileName := COPYSTR(FileManagement.ClientTempFileName(''), 1, 1024);
    //     IF ISCLEAR(FileSystemObject) THEN
    //         CREATE(FileSystemObject, TRUE, TRUE);
    //     FileSystemObject.MoveFile(SourceFileName, DestinationFileName);
    // end;

    // local procedure GetQRCode(QRCodeInput: Text) QRCodeFileName: Text;
    // var
    //     IBarCodeProvider: DotNet "'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider" RUNONCLIENT;
    // begin
    //     GetBarCodeProvider(IBarCodeProvider);
    //     QRCodeFileName := IBarCodeProvider.GetBarcode(QRCodeInput);
    // end;

    // procedure GetBarCodeProvider(var IBarCodeProvider: DotNet "'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.IBarcodeProvider");
    // var
    //     QRCodeProvider: DotNet "'Microsoft.Dynamics.Nav.MX, Version=9.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.MX.BarcodeProviders.QRCodeProvider" RUNONCLIENT;
    // begin
    //     CLEAR(QRCodeProvider);
    //     QRCodeProvider := QRCodeProvider.QRCodeProvider;
    //     IBarCodeProvider := QRCodeProvider;
    // end;
}

