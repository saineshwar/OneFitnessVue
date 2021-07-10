using System.ComponentModel.DataAnnotations;

namespace OneFitnessVue.ViewModel.Login
{
    public class ResetPasswordModel
    {
        [MinLength(7, ErrorMessage = "Minimum Password must be 7 in characters")]
        [Required(ErrorMessage = "Password Required")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm Password Required")]
        [Compare("Password", ErrorMessage = "Enter Valid Password")]
        public string ConfirmPassword { get; set; }
    }
}