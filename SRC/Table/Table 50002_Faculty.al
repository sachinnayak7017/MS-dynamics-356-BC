table 50002 Faculty
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                Name := UpperCase(name);
            end;

        }
        field(3; "City"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; salary; Decimal)
        {

            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if salary < 15000 Then begin
                    Message('please enter the salary more then 15k');
                    Clear(salary);
                end;

            end;

        }
        field(5; Depatment; Option)
        {
            OptionMembers = "",".Net",SAP,"MS DBC",Epicor,CSE,EE;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(key2; Name)
        {

        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Name, salary, City, Depatment)
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}