report 50000 "PCI SC Bank"
{

    Permissions = TableData 271 = rm;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
        {
            //DataItemTableView = where("Export File" = Filter(false));
            RequestFilterFields = "Document No.";

            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = SORTING("Document Type", "Vendor No.", "Posting Date", "Currency Code");
                dataitem(DetailedVendorLedgEntry1; "Detailed Vendor Ledg. Entry")
                {
                    DataItemLink = "Applied Vend. Ledger Entry No." = FIELD("Entry No.");
                    DataItemLinkReference = "Vendor Ledger Entry";
                    DataItemTableView = SORTING("Applied Vend. Ledger Entry No.", "Entry Type")
                                        WHERE(Unapplied = CONST(false));
                    dataitem(VendLedgEntry1; "Vendor Ledger Entry")
                    {
                        CalcFields = "Amount (LCY)";
                        DataItemLink = "Entry No." = FIELD("Vendor Ledger Entry No.");
                        DataItemLinkReference = DetailedVendorLedgEntry1;
                        DataItemTableView = SORTING("Entry No.");

                        trigger OnAfterGetRecord();
                        begin
                            IF "Entry No." = "Vendor Ledger Entry"."Entry No." THEN
                                CurrReport.SKIP;

                            IF DocumentNumber <> "Bank Account Ledger Entry"."Document No." THEN
                                InvoiceNumberInt := 0;

                            InvoiceNumberInt := InvoiceNumberInt + 1;

                            IF InvoiceNumberInt <= 9 THEN
                                InvoiceLineNumber := '0000' + FORMAT(InvoiceNumberInt);
                            IF InvoiceNumberInt >= 10 THEN
                                InvoiceLineNumber := '000' + FORMAT(InvoiceNumberInt);
                            IF InvoiceNumberInt >= 100 THEN
                                InvoiceLineNumber := '00' + FORMAT(InvoiceNumberInt);
                            IF InvoiceNumberInt >= 1000 THEN
                                InvoiceLineNumber := '0' + FORMAT(InvoiceNumberInt);
                            IF InvoiceNumberInt >= 10000 THEN
                                InvoiceLineNumber := FORMAT(InvoiceNumberInt);

                            NegPmtDiscInvCurrVendLedgEntry1 := 0;
                            NegPmtTolInvCurrVendLedgEntry1 := 0;
                            PmtDiscPmtCurr := 0;
                            PmtTolPmtCurr := 0;

                            NegShowAmountVendLedgEntry1 := -DetailedVendorLedgEntry1.Amount;


                            NegPmtDiscInvCurrVendLedgEntry1 := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                            NegPmtTolInvCurrVendLedgEntry1 := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");
                            AppliedAmount := -DetailedVendorLedgEntry1.Amount;


                            PmtDiscPmtCurr := ROUND("Pmt. Disc. Rcd.(LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            PmtTolPmtCurr := ROUND("Pmt. Tolerance (LCY)" * "Vendor Ledger Entry"."Original Currency Factor");

                            g_intDt := 0;
                            g_intDt := DATE2DMY(VendLedgEntry1."Posting Date", 1);
                            g_intMonth := 0;
                            g_intMonth := DATE2DMY(VendLedgEntry1."Posting Date", 2);
                            g_intYear := 0;
                            g_intYear := DATE2DMY(VendLedgEntry1."Posting Date", 3);

                            IF g_intMonth < 10 THEN BEGIN
                                IF g_intDt < 10 THEN
                                    PaymentDate := COPYSTR(FORMAT(g_intYear), 3, 4) + '0' + FORMAT(g_intMonth) + '0' + FORMAT(g_intDt)
                                ELSE
                                    PaymentDate := COPYSTR(FORMAT(g_intYear), 3, 4) + '0' + FORMAT(g_intMonth) + FORMAT(g_intDt);
                            END
                            ELSE BEGIN
                                IF g_intDt < 10 THEN
                                    PaymentDate := COPYSTR(FORMAT(g_intYear), 3, 4) + FORMAT(g_intMonth) + '0' + FORMAT(g_intDt)
                                ELSE
                                    PaymentDate := COPYSTR(FORMAT(g_intYear), 3, 4) + FORMAT(g_intMonth) + FORMAT(g_intDt);
                            END;

                            WCTAmount := FORMAT(0);
                            DeducationAmount := FORMAT(0);

                            //HeaderDetail(VendLedgEntry1); //Ashwini //Hold 20.12.2024
                            DocumentNumber := "Bank Account Ledger Entry"."Document No.";
                            BankAccount1.get("Bank Account Ledger Entry"."Bank Account No.");
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin

                end;
            }

            trigger OnAfterGetRecord();
            begin
                //Payment Line
                Lines_Payment("Bank Account Ledger Entry");
            end;

            trigger OnPostDataItem();
            begin
                TotalPaymentAmount.RESET;
                TotalPaymentAmount.SETFILTER("Document No.", "Bank Account Ledger Entry"."Document No.");
                TotalPaymentAmount.CALCSUMS(Amount);
                TotalAmount := TotalPaymentAmount.Amount * -1;
                TotalPayment := TotalPaymentAmount.COUNT;
                IF TotalPayment <= 9 THEN
                    TotalPaymentText := '0000' + FORMAT(TotalPayment);
                IF TotalPayment >= 10 THEN
                    TotalPaymentText := '000' + FORMAT(TotalPayment);
                IF TotalPayment >= 100 THEN
                    TotalPaymentText := '00' + FORMAT(TotalPayment);
                IF TotalPayment >= 1000 THEN
                    TotalPaymentText := '0' + FORMAT(TotalPayment);
                IF TotalPayment >= 10000 THEN
                    TotalPaymentText := FORMAT(TotalPayment);


                TxtBuilder.AppendLine('"T",' +
                                '"' + format(TotalPayment) + '",' +
                                '"",' +
                                '"",' +
                                '"",' +
                                '"",' +
                                '"' + format(Abs(TotalAmount)) + '",'
                               );
            end;

            trigger OnPreDataItem();
            begin
                Day := 0;
                Month := 0;
                Day := DATE2DMY(TODAY, 1);
                Month := DATE2DMY(TODAY, 2);
                YearFile := DATE2DMY(TODAY, 3);
                IF Day < 10 THEN
                    DayText := '0' + FORMAT(Day)
                ELSE
                    DayText := FORMAT(Day);
                IF Month < 10 THEN
                    Monthtxt := '0' + FORMAT(Month)
                ELSE
                    Monthtxt := FORMAT(Month);

                YearText := FORMAT(YearFile);
                SalesReceivablesSetup.GET;

                FileName := 'TestFile_' + UserId + '_' + Format(CurrentDateTime) + '.csv';

                TotalPaymentAmount.RESET;
                TotalPaymentAmount.SETFILTER("Document No.", GetFilter("Bank Account Ledger Entry"."Document No."));
                TotalPaymentAmount.CALCSUMS(Amount);
                TotalAmount := TotalPaymentAmount.Amount * -1;
                TotalPayment := TotalPaymentAmount.COUNT;

                IF TotalPayment <= 9 THEN
                    TotalPaymentText := '0000' + FORMAT(TotalPayment);
                IF TotalPayment >= 10 THEN
                    TotalPaymentText := '000' + FORMAT(TotalPayment);
                IF TotalPayment >= 100 THEN
                    TotalPaymentText := '00' + FORMAT(TotalPayment);
                IF TotalPayment >= 1000 THEN
                    TotalPaymentText := '0' + FORMAT(TotalPayment);
                IF TotalPayment >= 10000 THEN
                    TotalPaymentText := FORMAT(TotalPayment);



                // TxtBuilder.AppendLine('"H-P",' +
                // '"H-ACH",' +
                // '"H-BA",' +
                // '"' + COPYSTR(YearText, 3, 4) + Monthtxt + DayText + '",' +
                // '"' + BankAccount1."Bank Account No." + '",' +
                // '"INR",' +
                // '"' + TotalPaymentText + '",' +
                // '"' + DELCHR(FORMAT(TotalAmount), '=', ',') + '"');

                TxtBuilder.AppendLine('"H","P"');
                TxtBuilder.AppendLine('"P","ACH","BA"');

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        TempBlob.CreateOutStream(OutS);
        OutS.WriteText(TxtBuilder.ToText());
        TempBlob.CreateInStream(InS);
        DownloadFromStream(InS, '', '', '', FileName);
    end;

    local procedure HeaderDetail(VendorLedgerEntry_L: Record "Vendor Ledger Entry")
    var
        myInt: Integer;
    begin
        TxtBuilder.AppendLine('"1000",' +
          '"00001",' +
          '"' + LineNumberText + '",' +
          '"' + InvoiceLineNumber + '",' +
          '"' + VendLedgEntry1."Document No." + '",' +
          '"' + PaymentDate + '",' +
          '"",' +
          '"' + (DELCHR(FORMAT(VendorLedgerEntry_L."Amount (LCY)" * -1), '=', ',')) + '",' +
          '"0",' +
          '"0",' +
          '"' + DELCHR(FORMAT(AppliedAmount * -1), '=', ',') + '",' +
          '"",' +
          '""');
    end;

    local procedure Lines_Payment(BankAccountLedgerEntry_L: Record "Bank Account Ledger Entry")
    var
        vendorName_L: Text[100];
        PostingDate: Date;
        FormattedDate: Text;

    begin
        PaymentLine += 1;
        Vendor.GET(BankAccountLedgerEntry_L."Bal. Account No.");
        IF PaymentLine <= 9 THEN
            LineNumberText := '0000' + FORMAT(PaymentLine);
        IF PaymentLine >= 10 THEN
            LineNumberText := '000' + FORMAT(PaymentLine);
        IF PaymentLine >= 100 THEN
            LineNumberText := '00' + FORMAT(PaymentLine);
        IF PaymentLine >= 1000 THEN
            LineNumberText := '0' + FORMAT(PaymentLine);
        IF PaymentLine >= 10000 THEN
            LineNumberText := FORMAT(PaymentLine);
        vendorName_L := '';
        IF Vendor."Payee Name as per Bank ACC" = '' THEN
            vendorName_L := '"' + DELCHR(Vendor.Name, '=', '`!@#$%^&*()-+=<>/?.,[]{}]') + '",'
        ELSE
            vendorName_L := '"' + DELCHR(Vendor."Payee Name as per Bank ACC", '=', '`!@#$%^&*()-+=<>/?.,[]{}]') + '",';

        PostingDate := BankAccountLedgerEntry_L."Posting Date";

        FormattedDate :=
     Format(PostingDate, 0, '<Day,2>') + '/' +
     Format(PostingDate, 0, '<Month,2>') + '/20' +
     Format(PostingDate, 0, '<Year>');


        TxtBuilder.AppendLine('"I",' +//1
        '"' + BankAccountLedgerEntry_L."Document No." + '",' +//2
        // '"' + Format(BankAccountLedgerEntry_L."Posting Date", 0, '<Day,2>/<Month,2>/<Year,4>') + '",' +//3
        '="' + FormattedDate + '",' +//3

        vendorName_L +//4
        '"' + "Bank Account Ledger Entry"."Bank Account No." + '",' +//5
        '"' + "Bank Account Ledger Entry".Description + '",' +//6
        '"' + Format("Bank Account Ledger Entry"."Amount (LCY)") + '",' +//7
        '"' + DELCHR(Vendor."Vendor IFSC Code", '=', ',') + '",' +  //8
        '"",' +//17
        '"",' +//18
        '"",' +//19
        '"' + Vendor."Bank Account No." + '",' + //20
        '"",' +//21
        '"",' +//22
        '"",' +//23
        '"",' +//24
        '"",' +//25
        '"",' +//26
        '"",' +//27
        '"",' +//28
        '"",' +//29
        '"0",' +//30
        '"0",' +//31
        '"",' +//32
        '"",' +//33
        '"0",' +//34
        '"0",' +//35
        '"0",' +//36
        '"4",' + //LineNumberText + '",' +//37
        '"INR",' +//38
        '"' + DELCHR(FORMAT(BankAccountLedgerEntry_L."Amount (LCY)" * -1), '=', ',') + '",' +//39
        '"",' +//40
        '"",' +//41
        '"",' +//42
        '"",' +//43
        '"",' +//44
        '"",' +//45
        '"",' +//46
        '"",' +//47
        '"",' +//48
        '"",' +//49
        '"",' +//50
        '"",' +//51
        '"",' +//52
        '"",' +//53
        '"",' +//54
        '"",' +//55
        '"",' +//56
        '"",' +//57
        '"",' +//58
        '"",' +//59
        '"",' +//60
        '"SCBLINBBXXX",' +//61
        '"",' +//62
        '"' + DELCHR(Vendor."E-Mail", '=', ',') + '",' +  //63

        '"' + FORMAT(Vendor."Bank Account Type") + '",' +
        '"",' +//65
        '"",' +//66
        '"",' +//67
        '"",' +//68
        '"",' +//69
        '"",' +//70
        '"",' +//71
        '"",' +//72
        '"",' +//73
        '"",' +//74
        '"",' +//75
        '"",' +//76
        '"",' +//77
        '"",' +//78
        '"",' +//79
        '"",' +//80
        '"",' +//81
        '"",' +//82
        '"",' +//83
        '"",' +//84
        '"",' +//85
        '"",' +//86
        '"",' +//87
        '"",' +//88
        '"",' +//89
        '"",' +//90
        '"",' +//91
        '"",' +//92
        '"",' +//93
        '"",' +//94
        '"",' +//95
        '"",' +//96
        '"",' +//97
        '"",' +//98
        '"",' +//99
        '"",' +//100
        '"",' +//101
        '"",' +//102
        '"",' +//103
        '"",' +//104
        '"",' +//105
        '"",' +//106
        '"",' +//107
        '"",' +//108
        '"",' +//109
        '"",' +//110
        '"",' +//111
        '"",' +//112
        '"",' +//113
        '"",' +//114
        '"",' +//115
        '"",' +//116
        '"",' +//117
        '"",' +//118
        '"",' +//119
        '"",' +//120
        '"",' +//121
        '"",' +//122
        '"",' +//123
        '"",' +//124
        '"",' +//125
        '"",' +//126
        '"",' +//127
        '"",' +//128
        '"",' +//129
        '"",' +//130
        '"",' +//131
        '"",' +//132
        '"",' +//133
        '"",' +//134
        '"",' +//135
        '"",' +//136
        '"",' +//137
        '"",' +//138
        '"",' +//139
        '"",' +//140
        '"",' +//141
        '"",' +//142
        '"",' +//143
        '"",' +//144
        '"",' +//145
        '"",' +//146
        '"",' +//147
        '"",' +//148
        '"",' +//149
        '"",' +//150
        '"",' +//151
        '"",' +//152
        '"",' +//153
        '"",' +//154
        '"",' +//155
        '"",' +//156
        '"",' +//157
        '"",' +//158
        '"",' +//159
        '"",' +//160
        '"",' +//161
        '"",' +//162
        '"",' +//163
        '"",' +//164
        '"",' +//165
        '"",' +//166
        '"",' +//167
        '"",' +//168
        '"",' +//169
        '"",' +//170
        '"",' +//171
        '"",' +//172
        '"",' +//173
        '"",' +//174
        '"",' +//175
        '"",' +//176
        '"",' +//177
        '"",' +//178
        '"",' +//179
        '"",' +//180
        '"",' +//181
        '"",' +//182
        '"",' +//183
        '"",' +//184
        '"",' +//185
        '"",' +//186
        '"",' +//187
        '"",' +//188
        '"",' +//189
        '"",' +//190
        '"",' +//191
        '"",' +//192
        '"",' +//193
        '"",' +//194
        '"",' +//195
        '"",' +//196
        '"",' +//197
        '"",' +//198
        '"",' +//199
        '"",' +//200
        '"",' +//201
        '"",' +//202
        '"",' +//203
        '"",' +//204
        '"",' +//205
        '"",' +//206
        '"",' +//207
        '"",' +//208
        '"",' +//209
        '"",' +//210
        '"",' +//211
        '"",' +//212
        '"",' +//213
        '"",' +//214
        '"",' +//215
        '"",' +//216
        '"",' +//217
        '"",' +//218
        '"",' +//219
        '"",' +//220
        '"",' +//221
        '"",' +//222
        '"",' +//223
        '""');//224


    end;

    var
        TempBlob: Codeunit "Temp Blob";
        InS: InStream;
        OutS: OutStream;
        TxtBuilder: TextBuilder;
        FileName: Text;
        Day: Integer;
        Month: Integer;
        DayText: Text[5];
        Monthtxt: Text[5];
        YearText: Text;
        YearFile: Integer;
        Vendor: Record Vendor;
        g_intDt: Integer;
        g_intMonth: Integer;
        g_intYear: Integer;
        PaymentDate: Text;
        BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        NegPmtDiscInvCurrVendLedgEntry1: Decimal;
        NegPmtTolInvCurrVendLedgEntry1: Decimal;
        PmtDiscPmtCurr: Decimal;
        PmtTolPmtCurr: Decimal;
        NegShowAmountVendLedgEntry1: Decimal;
        AppliedAmount: Decimal;
        WCTAmount: Text;
        DeducationAmount: Text;
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
        FileNo: Code[20];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        BankAccount: Record "Bank Account";
        TotalPaymentAmount: Record "Bank Account Ledger Entry";
        TotalAmount: Decimal;
        TotalPayment: Integer;
        TotalPaymentText: Text;
        PaymentLine: Integer;
        LineNumberText: Text;
        InvoiceLineNumber: Text;
        InvoiceNumberInt: Integer;
        DocumentNumber: Code[50];

        XmlFileName: Text;
        XmlFileName1: Text;
        OrFilePath: Text;
        IncRFilePath: Text;
        TxetFileName: Text;
        BankAccount1: Record "Bank Account";

}

