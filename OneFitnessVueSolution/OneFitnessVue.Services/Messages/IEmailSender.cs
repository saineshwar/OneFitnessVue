using OneFitnessVue.Model.UserMaster;
using OneFitnessVue.ViewModel.Messages;

namespace OneFitnessVue.Services.Messages
{
    public interface IEmailSender
    {
        string SendMailusingSmtp(MessageTemplate messageTemplate);
        string CreateVerificationEmail(UserMasterModel user, string token);
        string CreateRegistrationVerificationEmail(UserMasterModel user, string token);
    }
}