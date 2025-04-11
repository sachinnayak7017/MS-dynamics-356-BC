table 50003 University
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; UniNo; Code[10])
        {
            DataClassification = ToBeClassified;

        }
        field(2; facultyName; Text[30])
        {
            // TableRelation = Faculty.Name;
        }
        field(3; studentname; Text[20])
        {
            // TableRelation = StudentInfo.StudentName;
        }
        field(4; salarySum; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum(Faculty.salary where(Name = field(facultyName)));

        }
        field(5; salarymax; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Max(Faculty.salary where(Name = field(facultyName)));
        }
        field(6; salaryMin; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = min(Faculty.salary where(Name = field(facultyName)));

        }
    }

    keys
    {
        key(pk; UniNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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