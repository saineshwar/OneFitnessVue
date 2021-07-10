using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using OneFitnessVue.Common;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.Enquiry.Queries;
using OneFitnessVue.Data.Reporting.Queries;
using OneFitnessVue.Data.UserMaster.Queries;
using OneFitnessVue.ViewModel.Dashboard;
using OneFitnessVue.ViewModel.Reporting;
using OneFitnessVue.ViewModel.Usermaster;
using OneFitnessVue.Web.Filters;
using System;
using System.Collections.Generic;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    [ResponseCache(NoStore = true, Location = ResponseCacheLocation.None)]

    public class DashboardController : Controller
    {
        private readonly IReportingQueries _reportingQueries;
        private readonly INotificationService _notificationService;
      
        private readonly IUserMasterQueries _userMasterQueries;
        private readonly IEnquiryQueries _enquiryQueries;
        public DashboardController(IReportingQueries reportingQueries,
            INotificationService notificationService,
          
            IUserMasterQueries userMasterQueries, IEnquiryQueries enquiryQueries)
        {
            _reportingQueries = reportingQueries;
            _notificationService = notificationService;
            _userMasterQueries = userMasterQueries;
            _enquiryQueries = enquiryQueries;
        }

        public IActionResult Dashboard()
        {
            var dashboardViewModel = new DashboardViewModel();
            var dataNew = _reportingQueries.YearwiseChartNewResponse();
            var datarenewed = _reportingQueries.YearwiseChartRenewedResponse();
            if (dataNew != null)
            {
                var listofchart = new List<BarchartResponse>()
                {
                    new BarchartResponse()
                    {
                        backgroundColor = "#007bff",
                        borderColor = "#007bff",
                        data = new List<int>()
                        {
                            dataNew[0].April,
                            dataNew[0].May,
                            dataNew[0].June,
                            dataNew[0].July,
                            dataNew[0].August,
                            dataNew[0].Sept,
                            dataNew[0].Oct,
                            dataNew[0].Nov,
                            dataNew[0].Dec,
                            dataNew[0].Jan,
                            dataNew[0].Feb,
                            dataNew[0].March
                        }
                    },
                    new BarchartResponse()
                    {
                        backgroundColor = "#ced4da",
                        borderColor = "#ced4da",
                        data = new List<int>()
                        {
                            datarenewed[0].April,
                            datarenewed[0].May,
                            datarenewed[0].June,
                            datarenewed[0].July,
                            datarenewed[0].August,
                            datarenewed[0].Sept,
                            datarenewed[0].Oct,
                            datarenewed[0].Nov,
                            datarenewed[0].Dec,
                            datarenewed[0].Jan,
                            datarenewed[0].Feb,
                            datarenewed[0].March
                        }
                    }
                };
                ViewBag.Data = JsonConvert.SerializeObject(listofchart);
            }


            if (_reportingQueries.GetNewRegistrationMonthlyCount() != null)
            {
                ViewBag.NewMembersCount = _reportingQueries.GetNewRegistrationMonthlyCount();
            }

            if (_reportingQueries.GetRenewedMonthlyCount() != null)
            {
                ViewBag.RenewedMembersCount = _reportingQueries.GetRenewedMonthlyCount();
            }

            if (_reportingQueries.GetRefundMonthlyCount() != null)
            {
                ViewBag.RefundMonthlyCount = _reportingQueries.GetRefundMonthlyCount();
            }

            if (_enquiryQueries.EnquiryCount() != null)
            {
                ViewBag.EnquiryCount = _enquiryQueries.EnquiryCount();
            }
            
            if (_reportingQueries.GetTopMembershipTypeInYear() != null)
            {
                dashboardViewModel.ListofMembershipType = _reportingQueries.GetTopMembershipTypeInYear();
            }
            else
            {
                dashboardViewModel.ListofMembershipType = null;
            }

            return View(dashboardViewModel);
        }

       

      
    }
}
