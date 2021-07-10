using System;

namespace OneFitnessVue.ViewModel.PaymentDetails
{
    public class PaymentRefundGridViewModel
    {
        public int RefundId { get; set; }
        public decimal Amount { get; set; }
        public string MemberNo { get; set; }
        public string FirstName { get; set; }
        public string FullName { get; set; }
        public DateTime? CreatedOn { get; set; }
        public string CreatedBy { get; set; }
    }
}