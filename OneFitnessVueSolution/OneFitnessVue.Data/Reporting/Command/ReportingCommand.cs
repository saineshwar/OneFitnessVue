using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.Reporting;

namespace OneFitnessVue.Data.Reporting.Command
{
    public class ReportingCommand : IReportingCommand
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public ReportingCommand(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }


        public void SaveReceiptHistory(ReceiptHistoryModel receiptHistoryModel)
        {
            _oneFitnessVueContext.ReceiptHistory.Add(receiptHistoryModel);
            _oneFitnessVueContext.SaveChangesAsync();
        }

    }
}