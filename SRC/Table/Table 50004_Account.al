table 50004 Account
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Account Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Customer,GL,BankAccount,Employee,Vendor;
            trigger OnValidate()
            begin
                Clear("Account No.");
            end;
        }
        field(3; "Account No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type" = const(Customer)) Customer."No."
            else if ("Account Type" = const(GL)) "G/L Account"."No."
            else if ("Account Type" = const(BankAccount)) "Bank Account"."No."
            else if ("Account Type" = const(Employee)) Employee."No."
            else if ("Account Type" = const(Vendor)) Vendor."No.";

            trigger OnLookup()
            begin
                GetAccountLookup();
            end;

        }
        field(4; "Account Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Status"; Option)
        {

            DataClassification = ToBeClassified;
            OptionMembers = Pending,Active;
            InitValue = Pending;
        }

    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }

    procedure ToggleStatus()
    begin
        if Status = Status::Pending then
            Status := Status::Active
        else
            Status := Status::Pending;
        Modify(); // Save the changes
    end;

    procedure GetAccountLookup()
    var
        CustomerRec: Record Customer;
        GLRec: Record "G/L Account";
        BankAccRec: Record "Bank Account";
        EmployeeRec: Record Employee;
        VendorRec: Record Vendor;
    begin
        case "Account Type" of
            "Account Type"::Customer:
                if Page.RunModal(Page::"Customer List", CustomerRec) = Action::LookupOK then begin
                    "Account No." := CustomerRec."No.";
                    "Account Name" := CustomerRec.Name;
                end;
            "Account Type"::GL:
                if Page.RunModal(Page::"G/L Account List", GLRec) = Action::LookupOK then begin
                    "Account No." := GLRec."No.";
                    "Account Name" := GLRec.Name;
                end;
            "Account Type"::BankAccount:
                if Page.RunModal(Page::"Bank Account List", BankAccRec) = Action::LookupOK then begin
                    "Account No." := BankAccRec."No.";
                    "Account Name" := BankAccRec.Name;
                end;
            "Account Type"::Employee:
                if Page.RunModal(Page::"Employee List", EmployeeRec) = Action::LookupOK then begin
                    "Account No." := EmployeeRec."No.";
                    "Account Name" := EmployeeRec."First Name" + ' ' + EmployeeRec."Last Name";
                end;
            "Account Type"::Vendor:
                if Page.RunModal(Page::"Vendor List", VendorRec) = Action::LookupOK then begin
                    "Account No." := VendorRec."No.";
                    "Account Name" := VendorRec.Name;
                end;
        end;
    end;


}
