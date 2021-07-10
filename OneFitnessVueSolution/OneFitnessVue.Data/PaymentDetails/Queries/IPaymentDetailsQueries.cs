using System.Collections.Generic;
using System.Linq;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.ViewModel.MemberRegistration;
using OneFitnessVue.ViewModel.PaymentDetails;

namespace OneFitnessVue.Data.PaymentDetails.Queries
{
    public interface IPaymentDetailsQueries
    {
        List<PaymentDetailsViewModel> ListofPayments(long? memberId);

        IQueryable<PaymentDetailsViewModel> ShowAllPaymentsHistory(string sortColumn, string sortColumnDir,
            string search);


    }
}