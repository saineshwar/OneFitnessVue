using System.Collections.Generic;
using OneFitnessVue.ViewModel.Documents;
using OneFitnessVue.ViewModel.PaymentDetails;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class MemberMainViewModel
    {
        public MemberRegistrationProfileViewModel MemberDetails { get; set; }
        public List<PaymentDetailsViewModel> ListofPayments { get; set; }
        public List<AttachmentGridViewModel> ListofDocuments { get; set; }
    }
}