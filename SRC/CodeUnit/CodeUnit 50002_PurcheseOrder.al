codeunit 50100 "Purchase Approval GST Handler"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterCalcPurchaseDocAmount', '', false, false)]
    local procedure AddGSTToApprovalAmount(
        PurchaseHeader: Record "Purchase Header";
        TotalPurchaseLine: Record "Purchase Line";
        TotalPurchaseLineLCY: Record "Purchase Line";
        var ApprovalAmount: Decimal;
        var ApprovalAmountLCY: Decimal
    )
    var
        PurchaseLine: Record "Purchase Line";
        GSTSetup: Record "GST Setup";
        TaxTransactionValue: Record "Tax Transaction Value";
        TotalGSTAmount: Decimal;
        ComponentName: Code[40];
    begin
        GSTSetup.Get();
        if GSTSetup."GST Tax Type" = 'GST' then
            if "PurchaseLine"."GST Jurisdiction Type" = "PurchaseLine"."GST Jurisdiction Type"::Interstate then
                ComponentName := 'IGST'
            else
                ComponentName := 'CGST';


        PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
        PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
        if PurchaseLine.FindSet() then
            repeat
                TaxTransactionValue.Reset();
                TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                TaxTransactionValue.SetRange("Tax Type", 'GST');
                TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                if TaxTransactionValue.FindSet() then
                    repeat
                        TotalGSTAmount += TaxTransactionValue.Amount;
                    until TaxTransactionValue.Next() = 0;
            until PurchaseLine.Next() = 0;

        ApprovalAmount += TotalGSTAmount;
        ApprovalAmountLCY += TotalGSTAmount;
    end;
}

