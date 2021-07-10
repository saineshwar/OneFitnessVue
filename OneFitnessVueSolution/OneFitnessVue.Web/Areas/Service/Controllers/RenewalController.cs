using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.Installments.Queries;
using OneFitnessVue.Data.MemberRegistration.Command;
using OneFitnessVue.Data.MemberRegistration.Queries;
using OneFitnessVue.Data.MembershipType.Queries;
using OneFitnessVue.Data.PaymentDetails.Command;
using OneFitnessVue.Data.PaymentDetails.Queries;
using OneFitnessVue.Data.PaymentType.Queries;
using OneFitnessVue.Data.TaxMaster.Queries;
using OneFitnessVue.Data.WorkOut.Queries;
using OneFitnessVue.Web.Filters;
using System;
using System.Linq;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class RenewalController : Controller
    {
   
        private readonly IPaymentDetailsQueries _paymentDetailsQueries;

        public RenewalController(
           
            IPaymentDetailsQueries paymentDetailsQueries
   
          )
        {

            _paymentDetailsQueries = paymentDetailsQueries;

        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

      

    }
}
