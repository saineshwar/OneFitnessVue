using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class EditMemberRegistrationViewModel
    {
        public long MemberId { get; set; }
        public long PaymentID { get; set; }

        [Display(Name = "MemberNo")]
        [Required(ErrorMessage = "MemberNo Required")]
        public string MemberNo { get; set; }

        [Display(Name = "First Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid First Name")]
        [Required(ErrorMessage = "First Name Required")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid Last Name")]
        [Required(ErrorMessage = "Last Name Required")]
        public string LastName { get; set; }

        [Display(Name = "Middle Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid Middle Name")]
        public string MiddleName { get; set; }

        [Display(Name = "Date of Birth")]
        [Required(ErrorMessage = "Date of Birth Required")]
        public string DOB { get; set; }

        [Display(Name = "Age")]
        [Required(ErrorMessage = "Age Required")]
        public int? Age { get; set; }

        [Display(Name = "MobileNo")]
        [RegularExpression(@"^[0-9]{10}", ErrorMessage = "Enter Mobileno.")]
        [Required(ErrorMessage = "MobileNo Required")]
        public string MobileNo { get; set; }

        [Display(Name = "EmailId")]
        [Required(ErrorMessage = "EmailId Required")]
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Enter valid Email Id")]
        public string EmailId { get; set; }

        [Display(Name = "Gender")]
        [Required(ErrorMessage = "Gender Required")]
        public int? GenderId { get; set; }
        public List<SelectListItem> ListofGender { get; set; }

        [Display(Name = "Workout")]
        [Required(ErrorMessage = "Workout Required")]
        public string WorkoutId { get; set; }
        public List<SelectListItem> ListofWorkout { get; set; }

        [Display(Name = "Installment")]
        [Required(ErrorMessage = "Installment Required")]
        public string InstallmentId { get; set; }
        public List<SelectListItem> ListofInstallment { get; set; }

        [Display(Name = "MembershipType")]
        [Required(ErrorMessage = "MembershipType Required")]
        public string MembershipTypeId { get; set; }
        public List<SelectListItem> ListofMembershipType { get; set; }

        [Display(Name = "Address")]
        [Required(ErrorMessage = "Address Required")]
        public string Address { get; set; }

        [Display(Name = "Joining Date")]
        [Required(ErrorMessage = "Joining Date Required")]
        public string JoiningDate { get; set; }

        [Display(Name = "Tax Type")]
        [Required(ErrorMessage = "Tax Type Required")]
        public string TaxId { get; set; }
        public List<SelectListItem> ListofTaxTypes { get; set; }

        [Display(Name = "Payment Type")]
        [Required(ErrorMessage = "Payment Type Required")]
        public string PaymentTypeId { get; set; }
        public List<SelectListItem> ListofPaymentTypes { get; set; }

        [Display(Name = "Amount")]
        public string Amount { get; set; }

        [Display(Name = "Taxpercentage")]
        public string Taxpercentage { get; set; }

        [Display(Name = "Total")]
        public string Total { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }
        public long? InvoiceNo { get; set; }

        [Required(ErrorMessage = "Emergency Contact Name Required")]
        [Display(Name = "Emergency Contact Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid Emergency Contact Name")]
        public string EmergencyContactName { get; set; }

        [Required(ErrorMessage = "Emergency Contact No Required")]
        [Display(Name = "Emergency Contact No")]
        public string EmergencyContactNo { get; set; }
    }
}