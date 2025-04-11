table 50001 StudentInfo
{
    DataClassification = ToBeClassified;
    Caption = 'StudentInfo';

    fields
    {
        field(1; "StudentID"; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "StudentID" <> xRec."StudentID" then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."StudentID");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "StudentName"; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; "StudentRoll"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "DOB"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Department"; Enum Department)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; State; Option)
        {
            OptionMembers = " ",UP,HR,DL,UK,MP;
        }
        field(8; Curr_state; Boolean)
        {

        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; StudentID)
        {
            Clustered = true;
        }
        key(key2; StudentName)
        {

        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; StudentID, StudentName, StudentRoll, Department, State)
        {

        }
    }

    trigger OnInsert()
    begin
        IF "StudentID" = '' THEN BEGIN
            SalesSetup.GET;
            SalesSetup.TESTFIELD("StudentID");
            // NoSeriesMgt.InitSeries(SalesSetup.StudentID, xRec."StudentID", 0D, "StudentID", "StudentID");
            StudentID := NoSeriesMgt.GetNextNo(SalesSetup.StudentID, 0D, true);
        END;
    end;



    var
        SalesSetup: Record 311;
        NoSeriesMgt: Codeunit 396;

}