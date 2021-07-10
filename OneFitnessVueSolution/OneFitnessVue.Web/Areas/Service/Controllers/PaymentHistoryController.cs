using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using OneFitnessVue.Data.PaymentDetails.Queries;
using OneFitnessVue.Web.Filters;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class PaymentHistoryController : Controller
    {
        private readonly IPaymentDetailsQueries _paymentDetailsQueries;
        public PaymentHistoryController(IPaymentDetailsQueries paymentDetailsQueries)
        {
            _paymentDetailsQueries = paymentDetailsQueries;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ShowAllMemberRegistration()
        {
            try
            {
                var draw = HttpContext.Request.Form["draw"].FirstOrDefault();
                var start = Request.Form["start"].FirstOrDefault();
                var length = Request.Form["length"].FirstOrDefault();
                var sortColumn = Request
                    .Form["columns[" + Request.Form["order[0][column]"].FirstOrDefault() + "][name]"].FirstOrDefault();
                var sortColumnDirection = Request.Form["order[0][dir]"].FirstOrDefault();
                var searchValue = Request.Form["search[value]"].FirstOrDefault();
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;
                var records =
                    _paymentDetailsQueries.ShowAllPaymentsHistory(sortColumn, sortColumnDirection, searchValue);
                recordsTotal = records.Count();
                var data = records.Skip(skip).Take(pageSize).ToList();
                var jsonData = new
                    { draw = draw, recordsFiltered = recordsTotal, recordsTotal = recordsTotal, data = data };
                return Ok(jsonData);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
