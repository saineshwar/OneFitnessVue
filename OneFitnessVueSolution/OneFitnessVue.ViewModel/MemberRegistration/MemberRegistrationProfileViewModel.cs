using System.ComponentModel.DataAnnotations;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class MemberRegistrationProfileViewModel
    {
        public  long MemberId { get; set; }

        [Display(Name = "MemberNo")]
        public string MemberNo { get; set; }

        [Display(Name = "Full Name")]
        public string FullName { get; set; }

        [Display(Name = "Date of Birth")]
        public string DOB { get; set; }

        [Display(Name = "Age")]
        public int? Age { get; set; }
        public string MobileNo { get; set; }
        public string EmailId { get; set; }
        public string Gender { get; set; }
        public string Workout { get; set; }
        public string Installment { get; set; }
        public string MembershipType { get; set; }
        public string Address { get; set; }
        public string JoiningDate { get; set; }
        public string EmergencyContactName { get; set; }
        public string EmergencyContactNo { get; set; }

    }
}