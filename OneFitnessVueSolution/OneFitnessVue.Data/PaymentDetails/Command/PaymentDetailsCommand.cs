using System;
using Microsoft.EntityFrameworkCore;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.PaymentDetails;

namespace OneFitnessVue.Data.PaymentDetails.Command
{
    public class PaymentDetailsCommand : IPaymentDetailsCommand
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public PaymentDetailsCommand(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }

        public string Add(PaymentDetailsModel paymentDetailsModel)
        {
            string result;

            using var transaction = _oneFitnessVueContext.Database.BeginTransaction();
            _oneFitnessVueContext.PaymentDetailsModels.Add(paymentDetailsModel);
            var resultpayment = _oneFitnessVueContext.SaveChanges();

            if (resultpayment > 0)
            {
                transaction.Commit();
                result = "success";
            }
            else
            {
                transaction.Rollback();
                result = "failed";
            }

            return result;
        }

    }

}