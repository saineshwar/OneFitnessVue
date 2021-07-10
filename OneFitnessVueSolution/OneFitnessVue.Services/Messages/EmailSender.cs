using OneFitnessVue.Model.UserMaster;
using OneFitnessVue.ViewModel.Messages;

namespace OneFitnessVue.Services.Messages
{
    public class EmailSender : IEmailSender
    {
        public string CreateRegistrationVerificationEmail(UserMasterModel user, string token)
        {
            throw new System.NotImplementedException();
        }

        public string CreateVerificationEmail(UserMasterModel user, string token)
        {
            throw new System.NotImplementedException();
        }

        public string SendMailusingSmtp(MessageTemplate messageTemplate)
        {
            throw new System.NotImplementedException();
        }
    }
}