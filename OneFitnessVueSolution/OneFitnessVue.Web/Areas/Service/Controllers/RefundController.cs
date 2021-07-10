using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using OneFitnessVue.Common;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.MemberRegistration.Command;
using OneFitnessVue.Data.PaymentDetails.Command;
using OneFitnessVue.Data.PaymentDetails.Queries;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.ViewModel.PaymentDetails;
using OneFitnessVue.Web.Filters;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class RefundController : Controller
    {
        private readonly IPaymentDetailsQueries _paymentDetailsQueries;
      
        public RefundController(IPaymentDetailsQueries paymentDetailsQueries
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
