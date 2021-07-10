using System.ComponentModel.DataAnnotations;

namespace OneFitnessVue.ViewModel.Login
{
    public class ForgotPasswordModel
    {
        [Required(ErrorMessage = "EmailID Required")]
        [RegularExpression(
            @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$",
            ErrorMessage = "Please enter a valid e-mail address")]
        public string EmailId { get; set; }
    }
}