namespace ALProject.ALProject;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50000 salesSalesReceivablesExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; StudentID; Code[10])
        {
            TableRelation = "No. Series";
        }

    }
}
