using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OneFitnessVue.Data.PaymentType.Queries
{
    public interface IPaymentTypeQueries
    {
        List<SelectListItem> ListofPaymentTypes();
    }
}