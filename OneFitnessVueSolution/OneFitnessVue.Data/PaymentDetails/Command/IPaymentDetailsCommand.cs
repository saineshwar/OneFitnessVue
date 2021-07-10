using OneFitnessVue.Model.PaymentDetails;

namespace OneFitnessVue.Data.PaymentDetails.Command
{
    public interface IPaymentDetailsCommand
    {
        string Add(PaymentDetailsModel paymentDetailsModel);
    }
}