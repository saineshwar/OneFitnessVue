using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Common;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.Enquiry.Command;
using OneFitnessVue.Data.Enquiry.Queries;
using OneFitnessVue.Data.MemberRegistration.Queries;
using OneFitnessVue.Data.WorkOut.Queries;
using OneFitnessVue.Model.Enquiry;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.ViewModel.Enquiry;
using OneFitnessVue.ViewModel.MemberRegistration;
using OneFitnessVue.Web.Filters;
using OneFitnessVue.Web.Helpers;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class EnquiryController : Controller
    {
        private readonly IWorkOutQueries _workOutQueries;
        private readonly IMemberRegistrationQueries _memberRegistrationQueries;
        private readonly IEnquiryQueries _enquiryQueries;
        private readonly IEnquiryCommand _enquiryCommand;
        private readonly INotificationService _notificationService;
        private readonly IMapper _mapper;
        public EnquiryController(IWorkOutQueries workOutQueries, 
            IMemberRegistrationQueries memberRegistrationQueries,
            IEnquiryQueries enquiryQueries,
            IEnquiryCommand enquiryCommand, IMapper mapper, INotificationService notificationService)
        {
            _workOutQueries = workOutQueries;
            _memberRegistrationQueries = memberRegistrationQueries;
            _enquiryQueries = enquiryQueries;
            _enquiryCommand = enquiryCommand;
            _mapper = mapper;
            _notificationService = notificationService;
        }

        public IActionResult Application()
        {
            var  enquiryView = new EnquiryViewModel()
            {
                ListofGender = _memberRegistrationQueries.ListofGender(),
                ListofWorkout = _workOutQueries.GetWorkOuts(),
                Status = true,
                ListofReason = _enquiryQueries.GetReasonsList()
            };

            return View(enquiryView);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Application(EnquiryViewModel enquiryView)
        {
            if (ModelState.IsValid)
            {
                if (_memberRegistrationQueries.CheckMemberMobileNoExists(enquiryView.MobileNo))
                {
                    ModelState.AddModelError("", "MobileNo Already Exists");
                }
                else if (_memberRegistrationQueries.CheckMemberEmailExists(enquiryView.EmailId))
                {
                    ModelState.AddModelError("", "Email Already Exists");
                }
                else
                {
                    var userid = HttpContext.Session.GetInt32(AllSessionKeys.UserId);

                    var mappedobject = _mapper.Map<EnquiryModel>(enquiryView);
                    mappedobject.FirstName = enquiryView.FirstName.ToUpperFirstLetter();
                    mappedobject.MiddleName = enquiryView.MiddleName.ToUpperFirstLetter();
                    mappedobject.LastName = enquiryView.LastName.ToUpperFirstLetter();
                    mappedobject.CreatedOn = DateTime.Now;
                    mappedobject.CreatedBy = userid;

                    var result = _enquiryCommand.Add(mappedobject);

                    if (result == "success")
                    {
                        _notificationService.SuccessNotification("Message", "Enquiry Saved Successfully!");
                        return RedirectToAction("Index", "Enquiry");
                    }
                }
            }

            enquiryView.ListofGender = _memberRegistrationQueries.ListofGender();
            enquiryView.ListofWorkout = _workOutQueries.GetWorkOuts();
            enquiryView.ListofReason = _enquiryQueries.GetReasonsList();

            return View(enquiryView);
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ShowAllEnquiry()
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
                    _enquiryQueries.ShowAllEnquiry(sortColumn, sortColumnDirection, searchValue);
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

        public JsonResult Delete(int? enquiryId)
        {
            try
            {
                if (enquiryId != null)
                {
                    var enquiryDetails = _enquiryQueries.GetEnquiryDetailsByEnquiryId(enquiryId);
                    var result = _enquiryCommand.Delete(enquiryDetails);
                    if (result > 0)
                    {
                        _notificationService.SuccessNotification("Message", "The Enquiry was Deleted successfully!");
                        return Json(new { Result = "success" });
                    }
                    else
                    {
                        return Json(new { Result = "failed", Message = "Cannot Delete" });
                    }
                }
                else
                {
                    return Json(new { Result = "failed", Message = "Cannot Delete" });
                }

            }
            catch (Exception)
            {
                return Json(new { Result = "failed", Message = "Cannot Delete" });
            }
        }
    }
}
