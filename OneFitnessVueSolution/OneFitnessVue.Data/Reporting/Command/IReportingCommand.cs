using OneFitnessVue.Model.Reporting;

namespace OneFitnessVue.Data.Reporting.Command
{
    public interface IReportingCommand
    {
        void SaveReceiptHistory(ReceiptHistoryModel receiptHistoryModel);
    }
}