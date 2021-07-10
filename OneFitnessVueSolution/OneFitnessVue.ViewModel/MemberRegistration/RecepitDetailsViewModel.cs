using System;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class RecepitDetailsViewModel
    {
        public string MemberNo { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string PaymentFromdt { get; set; }
        public string PaymentTodt { get; set; }
        public string NextRenewalDate { get; set; }
        public string InstallmentName { get; set; }
        public string MembershipTypeName { get; set; }
        public string WorkOutName { get; set; }
        public string PaymentTypeName { get; set; }
        public decimal? TaxRate { get; set; }
        public string IdentificationNo { get; set; }
        public string TaxType { get; set; }
        public decimal? Amount { get; set; }
        public decimal? TaxPercentage { get; set; }
        public decimal? TotalAmount { get; set; }
        public decimal? TaxPercentageAmount { get; set; }
        public string ApplicationType { get; set; }
        public long InvoiceNo { get; set; }
        public string CreatedBy { get; set; }
    }

    public class LastPaymentDetailsViewModel
    {
        public string PaymentID { get; set; }
        public string MemberNo { get; set; }
        public string FullName { get; set; }
        public string PaymentFromdt { get; set; }
        public string PaymentTodt { get; set; }
        public string NextRenewalDate { get; set; }
        public string InstallmentName { get; set; }
        public string MembershipTypeName { get; set; }
        public string WorkOutName { get; set; }
        public string PaymentTypeName { get; set; }
        public decimal? TaxRate { get; set; }
        public string IdentificationNo { get; set; }
        public string TaxType { get; set; }
        public decimal? Amount { get; set; }
        public decimal? TaxPercentage { get; set; }
        public decimal? TotalAmount { get; set; }
        public decimal? TaxPercentageAmount { get; set; }

        

    }
}