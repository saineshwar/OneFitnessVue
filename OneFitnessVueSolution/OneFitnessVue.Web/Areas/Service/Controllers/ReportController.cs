using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using OfficeOpenXml;
using OfficeOpenXml.Table;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.Reporting.Queries;
using OneFitnessVue.ViewModel.Reporting;
using OneFitnessVue.Web.Filters;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class ReportController : Controller
    {
        private readonly IReportingQueries _reportingQueries;
        private readonly INotificationService _notificationService;
        public ReportController(IReportingQueries reportingQueries, INotificationService notificationService)
        {
            _reportingQueries = reportingQueries;
            _notificationService = notificationService;
        }

        [HttpGet]
        public IActionResult Renewal()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Renewal(RenewalReportingViewModel renewalReporting)
        {
            if (ModelState.IsValid)
            {
                var result = _reportingQueries.Get_RenewalReport(renewalReporting);
                if (result.Any())
                {
                    string reportname = $"Renewal_{Guid.NewGuid():N}.xlsx";
                    var exportbytes = ExporttoExcel<RenewalReportViewModel>(result, reportname);
                    return File(exportbytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", reportname);
                }
                else
                {
                    _notificationService.DangerNotification("Message", "No Data Available");
                }
            }

            return View(renewalReporting);
        }

        private byte[] ExporttoExcel<T>(List<T> table, string filename)
        {

            using (ExcelPackage pack = new ExcelPackage())
            {
                ExcelWorksheet ws = pack.Workbook.Worksheets.Add(filename);
                ws.Cells["A1"].LoadFromCollection(table, true, TableStyles.Light1);
                return pack.GetAsByteArray();
            }
        }
    }
}
