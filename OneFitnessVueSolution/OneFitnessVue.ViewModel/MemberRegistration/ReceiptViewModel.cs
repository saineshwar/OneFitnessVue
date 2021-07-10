using OneFitnessVue.Model.GeneralSetting;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class ReceiptViewModel
    {
        public GeneralSettingsModel GeneralSettings { get; set; }
        public RecepitDetailsViewModel RecepitDetails { get; set; }
        public long InvoiceNo { get; set; }
        public string InvoiceDate { get; set; }
    }
}