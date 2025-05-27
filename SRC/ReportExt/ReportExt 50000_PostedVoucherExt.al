reportextension 50000 PostedVoucherExt extends "Posted Voucher"
{
    dataset
    {
        add("G/L Entry")
        {
            column(Rejected; 'IT Manager') { }
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = './SRC/ReportExt Layout/PostedVoucher1.rdl';
        }
    }
}