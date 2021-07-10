namespace OneFitnessVue.ViewModel.Installments
{
    public class InstallmentEditViewModel
    {
        public int InstallmentId { get; set; }
        public string InstallmentName { get; set; }
        public bool Status { get; set; }
        public int? InstallmentMonths { get; set; }
    }
}