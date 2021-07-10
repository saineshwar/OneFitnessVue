using System;

namespace OneFitnessVue.ViewModel.PaymentDetails
{
    public class PaymentDetailsViewModel
    {
        public long PaymentID { get; set; }
        public long? MemberID { get; set; }
        public string MembershipType { get; set; }
        public string WorkOut { get; set; }
        public string Installment { get; set; }
        public string PaymentFromdt { get; set; }
        public string PaymentTodt { get; set; }
        public string NextRenewalDate { get; set; }
        public DateTime? CreateDate { get; set; }
        public string Tax { get; set; }
        public string PaymentType { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal TaxPercentage { get; set; }
        public decimal Amount { get; set; }
        public string MemberNo { get; set; }
        public string FirstName { get; set; }
        public string FullName { get; set; }
        public string ApplicationType { get; set; }
    }
}