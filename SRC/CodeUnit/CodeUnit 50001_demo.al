codeunit 50001 demo
{
    trigger OnRun()
    begin
        n1 := 3;
        n2 := 5;
        result := n1 + n2;
        Message('sum of two number %1', result);
    end;

    var
        n1: Integer;
        n2: Integer;
        result: Decimal;
}