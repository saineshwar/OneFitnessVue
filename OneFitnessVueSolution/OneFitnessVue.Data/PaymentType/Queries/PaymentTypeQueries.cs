using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OneFitnessVue.Data.EFContext;

namespace OneFitnessVue.Data.PaymentType.Queries
{
    public class PaymentTypeQueries : IPaymentTypeQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public PaymentTypeQueries(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }

        public List<SelectListItem> ListofPaymentTypes()
        {
            var result =  new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text = "Cash",
                    Value = "1"
                }
            };

            result.Insert(0, new SelectListItem()
            {
                Value = "",
                Text = "---Select---"
            });

            return result;
        }

    }
}