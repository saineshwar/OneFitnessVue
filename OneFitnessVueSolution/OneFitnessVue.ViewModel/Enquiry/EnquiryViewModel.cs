using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OneFitnessVue.ViewModel.Enquiry
{
    public class EnquiryViewModel
    {
        [Display(Name = "First Name")]
        [Required(ErrorMessage = "First Name Required")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid Last Name")]
        [Required(ErrorMessage = "Last Name Required")]
        public string LastName { get; set; }

        [Display(Name = "Middle Name")]
        [RegularExpression("^[a-zA-Z ]*$", ErrorMessage = "Enter Valid Middle Name")]
        public string MiddleName { get; set; }

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

        [Display(Name = "FoundUs")]
        [Required(ErrorMessage = "FoundUs Required")]
        public string ReasonId { get; set; }
        public List<SelectListItem> ListofReason { get; set; }

        public string EnquiryDetails { get; set; }

        [Display(Name = "Status")]
        public bool Status { get; set; }
    }
}