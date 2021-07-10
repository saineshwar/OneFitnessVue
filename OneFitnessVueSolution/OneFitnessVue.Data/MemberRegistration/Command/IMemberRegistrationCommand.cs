using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.Model.PaymentDetails;

namespace OneFitnessVue.Data.MemberRegistration.Command
{
    public interface IMemberRegistrationCommand
    {
        string Add(MemberRegistrationModel memberRegistration, PaymentDetailsModel paymentDetailsModel);
        string Update(MemberRegistrationModel memberRegistration, PaymentDetailsModel paymentDetailsModel);
        long GetInvoiceNo();
        int DeactivateMember(MemberRegistrationModel memberRegistration);
    }
}