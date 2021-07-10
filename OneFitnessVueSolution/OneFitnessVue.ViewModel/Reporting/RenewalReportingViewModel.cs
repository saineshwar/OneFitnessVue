using System.ComponentModel.DataAnnotations;

namespace OneFitnessVue.ViewModel.Reporting
{
    public class RenewalReportingViewModel
    {
        [Display(Name = "From Date")]
        [Required(ErrorMessage = "Required From Date")]
        public string Fromdate { get; set; }

        [Display(Name = "To Date")]
        [Required(ErrorMessage = "Required To Date")]
        public string Todate { get; set; }
    }
}