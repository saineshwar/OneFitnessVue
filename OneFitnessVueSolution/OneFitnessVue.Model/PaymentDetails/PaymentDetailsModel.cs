using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.PaymentDetails
{
    [Table("PaymentDetails")]
    public class PaymentDetailsModel
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "Payment ID")]
        public long PaymentID { get; set; }
        [Display(Name = "Membership Type Id")]
        public int? MembershipTypeId { get; set; }
        [Display(Name = "Work Out Id")]
        public int? WorkOutId { get; set; }
        
        [Display(Name = "Payment Fromdt")]
        public DateTime? PaymentFromdt { get; set; }
        [Display(Name = "Payment Todt")]
        public DateTime? PaymentTodt { get; set; }

        [Display(Name = "Next Renwal Date")]
        public DateTime? NextRenewalDate { get; set; }
        [Display(Name = "Create Date")]
        public DateTime? CreatedOn { get; set; }
        [Display(Name = "Create User ID")]
        public int? CreatedBy { get; set; }
        [Display(Name = "Modify Date")]
        public DateTime? ModifiedOn { get; set; }
        [Display(Name = "Modify User ID")]
        public int? ModifiedBy { get; set; }
        [MaxLength(1)]
        [Display(Name = "Rec Status")]
        public string RecStatus { get; set; }
        [Display(Name = "Member ID")]
        public long? MemberID { get; set; }

        [Display(Name = "PaymentTypeId")]
        public int? PaymentTypeId { get; set; }

        [Display(Name = "TaxId")]
        public int? TaxId { get; set; }

        [Display(Name = "Amount")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal Amount { get; set; }

        [Display(Name = "Tax Percentage")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal? TaxPercentage { get; set; }

        [Display(Name = "Tax Amount")]
        [Column(TypeName = "decimal(18,2)")]
        public decimal TotalAmount { get; set; }
        public string MemberNo { get; set; }
        public int? InstallmentId { get; set; }

        [Column(TypeName = "decimal(18,2)")]
        public decimal? TaxPercentageAmount { get; set; }
        public string ApplicationType { get; set; }
        public long? InvoiceNo { get; set; }
    }
}