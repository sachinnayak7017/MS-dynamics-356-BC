page 50100 "Customer API"
{
    PageType = API;
    Caption = 'Customer API';
    APIPublisher = 'MyCompany';
    APIGroup = 'MyApp';
    APIVersion = 'v1.0';
    EntityName = 'customer';
    EntitySetName = 'customers';
    SourceTable = Customer;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
            }
        }
    }
}