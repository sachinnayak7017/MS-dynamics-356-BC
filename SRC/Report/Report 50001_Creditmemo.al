report 50001 Creditmemo
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report Layout/CreditMemo.rdl';
    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {

            column(comp_Name; comp.Name) { }
            column(comp_Address; comp.Address) { }
            column(comp_Address_2; comp."Address 2") { }
            column(comp_City; comp.City) { }
            column(comp_Phone_No_; comp."Phone No.") { }
            column(comp_GST_Registration_No_; comp."GST Registration No.") { }
            column(comp_E_Mail; comp."E-Mail") { }
            column(comp_VAT_Registration_No_; comp."VAT Registration No.") { }
            column(comp_State_Code; comp."State Code") { }
            column(comp_State; comp.City) { }
            column(comp_Contact_Person; comp."Contact Person") { }
            column(comp_pic; comp.Picture) { }

            column(Bill_to_Name; "Bill-to Name") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_Address_2; "Bill-to Address 2") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Ship_to_GST_Reg__No_; "Ship-to GST Reg. No.") { }
            column(Bill_to_County; "Bill-to County") { }
            column(Bill_to_Post_Code; "Bill-to Post Code") { }

            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_Code; "Ship-to Code") { }
            column(Sell_to_City; "Sell-to City") { }
            column(Ship_to_Contact; "Ship-to Contact") { }

            column(Applies_to_Doc__No_; "Applies-to Doc. No.") { }
            column(GST_Invoice; "GST Invoice") { }
            column(E_Way_Bill_No_; "E-Way Bill No.") { }
            column(Reference_Invoice_No_; "Reference Invoice No.") { }
            column(Order_Date; "Order Date") { }
            column(Registration_Number; "Registration Number") { }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description) { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(Unit_Price; "Unit Price") { }
                column(Line_Discount__; "Line Discount %") { }
                column(Amount; Amount) { }
                column(S_No; S_No) { }

                trigger OnAfterGetRecord()
                begin
                    S_No := S_No + 1;
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
    trigger OnPreReport()
    begin
        S_No := 0;
        comp.GET;
        comp.CalcFields(Picture);
    end;

    var
        comp: Record 79;
        S_No: Integer;
}