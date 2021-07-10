using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Common;
using OneFitnessVue.Common.Notification;

using OneFitnessVue.Data.Installments.Queries;
using OneFitnessVue.Data.MemberRegistration.Command;
using OneFitnessVue.Data.MemberRegistration.Queries;
using OneFitnessVue.Data.MembershipType.Queries;
using OneFitnessVue.Data.PaymentDetails.Queries;
using OneFitnessVue.Data.PaymentType.Queries;
using OneFitnessVue.Data.TaxMaster.Queries;
using OneFitnessVue.Data.WorkOut.Queries;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.ViewModel.MemberRegistration;
using OneFitnessVue.ViewModel.MembershipType;
using OneFitnessVue.Web.Filters;
using OneFitnessVue.Web.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using OneFitnessVue.ViewModel.Documents;

namespace OneFitnessVue.Web.Areas.Service.Controllers
{
    [Area("Service")]
    [AuthorizeUser]
    public class MemberController : Controller
    {
        private readonly IMemberRegistrationQueries _memberRegistrationQueries;
        private readonly IInstallmentQueries _installmentQueries;
        private readonly IWorkOutQueries _workOutQueries;
        private readonly IMembershipTypeQueries _membershipTypeQueries;
        private readonly IMemberRegistrationCommand _memberRegistrationCommand;
        private readonly IMapper _mapper;
        private readonly INotificationService _notificationService;
        private readonly ITaxMasterQueries _taxMasterQueries;
        private readonly IPaymentTypeQueries _paymentTypeQueries;

        private readonly IPaymentDetailsQueries _paymentDetailsQueries;

        public MemberController(IMemberRegistrationQueries memberRegistrationQueries,
            IInstallmentQueries installmentQueries,
            IWorkOutQueries workOutQueries,
            IMembershipTypeQueries membershipTypeQueries,
            IMemberRegistrationCommand memberRegistrationCommand,
            IMapper mapper,
            INotificationService notificationService,
            ITaxMasterQueries taxMasterQueries,
            IPaymentTypeQueries paymentTypeQueries,

            IPaymentDetailsQueries paymentDetailsQueries)
        {
            _memberRegistrationQueries = memberRegistrationQueries;
            _installmentQueries = installmentQueries;
            _workOutQueries = workOutQueries;
            _membershipTypeQueries = membershipTypeQueries;
            _memberRegistrationCommand = memberRegistrationCommand;
            _mapper = mapper;
            _notificationService = notificationService;
            _taxMasterQueries = taxMasterQueries;
            _paymentTypeQueries = paymentTypeQueries;

            _paymentDetailsQueries = paymentDetailsQueries;

        }

        [HttpGet]
        public IActionResult Application()
        {
            KeyGenerator keyGenerator = new KeyGenerator();
            var uniqueNo = keyGenerator.GetUniqueKey(10).ToUpper();
            var dayofyear = DateTime.Now.DayOfYear;
            MemberRegistrationViewModel memberRegistration = new MemberRegistrationViewModel
            {
                ListofGender = _memberRegistrationQueries.ListofGender(),
                ListofInstallment = _installmentQueries.GetInstallments(),
                ListofWorkout = _workOutQueries.GetWorkOuts(),
                ListofTaxTypes = _taxMasterQueries.GetTaxList(),
                ListofPaymentTypes = _paymentTypeQueries.ListofPaymentTypes(),
                ListofMembershipType = new List<SelectListItem>()
                {
                    new SelectListItem()
                    {
                        Text = "Select",
                        Value = ""
                    }
                },
                MemberNo = $"OFV{dayofyear.ToString()}{uniqueNo}",
                Status = true
            };


            return View(memberRegistration);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Application(MemberRegistrationViewModel memberRegistration)
        {
            if (ModelState.IsValid)
            {
                if (_memberRegistrationQueries.CheckMemberMobileNoExists(memberRegistration.MobileNo))
                {
                    ModelState.AddModelError("", "MobileNo Already Exists");
                }
                else if (_memberRegistrationQueries.CheckMemberEmailExists(memberRegistration.EmailId))
                {
                    ModelState.AddModelError("", "Email Already Exists");
                }
                else
                {
                    var userid = HttpContext.Session.GetInt32(AllSessionKeys.UserId);

                    var mappedobject = _mapper.Map<MemberRegistrationModel>(memberRegistration);
                    mappedobject.FirstName = memberRegistration.FirstName.ToUpperFirstLetter();
                    mappedobject.MiddleName = memberRegistration.MiddleName.ToUpperFirstLetter();
                    mappedobject.LastName = memberRegistration.LastName.ToUpperFirstLetter();
                    mappedobject.CreatedOn = DateTime.Now;
                    mappedobject.CreatedBy = userid;


                    var calculation = new CalcuationRespone();
                    if (memberRegistration.TaxId == "1")
                    {
                        calculation = CalcuateGst(Convert.ToInt32(memberRegistration.MembershipTypeId),
                            Convert.ToInt32(memberRegistration.TaxId));
                    }
                    else if (memberRegistration.TaxId == "2")
                    {
                        calculation = CalcuateVat(Convert.ToInt32(memberRegistration.MembershipTypeId),
                            Convert.ToInt32(memberRegistration.TaxId));
                    }

                    var joiningDate = DateTime.Parse(memberRegistration.JoiningDate);

                    var installmodel =
                        _installmentQueries.GetInstallmentByInstallmentId(
                            Convert.ToInt32(memberRegistration.InstallmentId));

                    var nextRenwalDate = joiningDate.AddMonths(Convert.ToInt32(installmodel.InstallmentMonths));

                    var paymentDetailsModel = new PaymentDetailsModel()
                    {
                        MemberID = mappedobject.MemberId,
                        WorkOutId = Convert.ToInt32(memberRegistration.WorkoutId),
                        PaymentTypeId = Convert.ToInt32(memberRegistration.PaymentTypeId),
                        MembershipTypeId = Convert.ToInt32(memberRegistration.MembershipTypeId),
                        CreatedOn = DateTime.Now,
                        PaymentFromdt = DateTime.Parse(memberRegistration.JoiningDate),
                        NextRenewalDate = nextRenwalDate,
                        PaymentID = 0,
                        PaymentTodt = nextRenwalDate,
                        RecStatus = "A",
                        CreatedBy = userid,
                        Amount = Convert.ToDecimal(calculation.Amount),
                        TotalAmount = Convert.ToDecimal(calculation.Total),
                        TaxId = Convert.ToInt32(memberRegistration.TaxId),
                        TaxPercentage = Convert.ToDecimal(calculation.Taxpercentage),
                        InstallmentId = Convert.ToInt32(memberRegistration.InstallmentId),
                        MemberNo = memberRegistration.MemberNo,
                        TaxPercentageAmount = Convert.ToDecimal(calculation.TaxPercentageAmount),
                        ApplicationType = "NW",
                        InvoiceNo = _memberRegistrationCommand.GetInvoiceNo()
                    };

                    var result = _memberRegistrationCommand.Add(mappedobject, paymentDetailsModel);

                    if (result == "success")
                    {
                        _notificationService.SuccessNotification("Message", "Member was added Successfully!");
                        return RedirectToAction("Index", "Member");
                    }
                }
            }

            memberRegistration.ListofGender = _memberRegistrationQueries.ListofGender();
            memberRegistration.ListofInstallment = _installmentQueries.GetInstallments();
            memberRegistration.ListofWorkout = _workOutQueries.GetWorkOuts();
            memberRegistration.ListofPaymentTypes = _paymentTypeQueries.ListofPaymentTypes();
            memberRegistration.ListofMembershipType = new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text = "Select",
                    Value = ""
                }
            };
            return View(memberRegistration);
        }

        [HttpGet]
        public IActionResult EditApplication(long? memberId)
        {
            if (memberId != null && !Regex.IsMatch(Convert.ToString(memberId)!, "^[0-9]*$"))
            {
                _notificationService.DangerNotification("Message", "Some Thing Went Wrong !");
                return RedirectToAction("Dashboard", "Dashboard");
            }

            var memberRegistration = _memberRegistrationQueries.GetMemberRegistrationById(memberId);

            memberRegistration.ListofGender = _memberRegistrationQueries.ListofGender();
            memberRegistration.ListofInstallment = _installmentQueries.GetInstallments();
            memberRegistration.ListofWorkout = _workOutQueries.GetWorkOuts();
            memberRegistration.ListofTaxTypes = _taxMasterQueries.GetTaxList();
            memberRegistration.ListofPaymentTypes = _paymentTypeQueries.ListofPaymentTypes();
            memberRegistration.ListofMembershipType = new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text = "Select",
                    Value = ""
                }
            };

            return View(memberRegistration);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult EditApplication(EditMemberRegistrationViewModel memberRegistration)
        {
            if (ModelState.IsValid)
            {

                var editmemberRegistration =
                    _memberRegistrationQueries.GetMemberDetailsByMemberId(memberRegistration.MemberId);

                memberRegistration.ListofGender = _memberRegistrationQueries.ListofGender();
                memberRegistration.ListofInstallment = _installmentQueries.GetInstallments();
                memberRegistration.ListofWorkout = _workOutQueries.GetWorkOuts();
                memberRegistration.ListofPaymentTypes = _paymentTypeQueries.ListofPaymentTypes();
                memberRegistration.ListofMembershipType = new List<SelectListItem>()
                {
                    new SelectListItem()
                    {
                        Text = "Select",
                        Value = ""
                    }
                };

                if (editmemberRegistration.MobileNo != memberRegistration.MobileNo)
                {
                    if (_memberRegistrationQueries.CheckMemberMobileNoExists(memberRegistration.MobileNo))
                    {
                        ModelState.AddModelError("", "MobileNo Already Exists");
                    }
                }

                if (editmemberRegistration.EmailId != memberRegistration.EmailId)
                {
                    if (_memberRegistrationQueries.CheckMemberEmailExists(memberRegistration.EmailId))
                    {
                        ModelState.AddModelError("", "Email Already Exists");
                    }
                }


                var userid = HttpContext.Session.GetInt32(AllSessionKeys.UserId);
                var mappedobject = _mapper.Map<MemberRegistrationModel>(memberRegistration);

                mappedobject.FirstName = memberRegistration.FirstName.ToUpperFirstLetter();
                mappedobject.MiddleName = memberRegistration.MiddleName.ToUpperFirstLetter();
                mappedobject.LastName = memberRegistration.LastName.ToUpperFirstLetter();
                mappedobject.ModifiedOn = DateTime.Now;
                mappedobject.ModifiedBy = userid;
                mappedobject.CreatedBy = editmemberRegistration.CreatedBy;
                mappedobject.CreatedOn = editmemberRegistration.CreatedOn;


                var calculation = new CalcuationRespone();
                if (memberRegistration.TaxId == "1")
                {
                    calculation = CalcuateGst(Convert.ToInt32(memberRegistration.MembershipTypeId),
                        Convert.ToInt32(memberRegistration.TaxId));
                }
                else if (memberRegistration.TaxId == "2")
                {
                    calculation = CalcuateVat(Convert.ToInt32(memberRegistration.MembershipTypeId),
                        Convert.ToInt32(memberRegistration.TaxId));
                }

                var joiningDate = DateTime.Parse(memberRegistration.JoiningDate);
                var installmodel =
                    _installmentQueries.GetInstallmentByInstallmentId(
                        Convert.ToInt32(memberRegistration.InstallmentId));

                var nextRenewalDate = joiningDate.AddMonths(Convert.ToInt32(installmodel.InstallmentMonths));

                var paymentDetailsModel = new PaymentDetailsModel()
                {
                    MemberID = mappedobject.MemberId,
                    WorkOutId = Convert.ToInt32(memberRegistration.WorkoutId),
                    PaymentTypeId = Convert.ToInt32(memberRegistration.PaymentTypeId),
                    MembershipTypeId = Convert.ToInt32(memberRegistration.MembershipTypeId),
                    CreatedOn = DateTime.Now,
                    PaymentFromdt = DateTime.Parse(memberRegistration.JoiningDate),
                    NextRenewalDate = nextRenewalDate,
                    PaymentID = memberRegistration.PaymentID,
                    PaymentTodt = nextRenewalDate,
                    RecStatus = "A",
                    CreatedBy = userid,
                    Amount = Convert.ToDecimal(calculation.Amount),
                    TotalAmount = Convert.ToDecimal(calculation.Total),
                    TaxId = Convert.ToInt32(memberRegistration.TaxId),
                    TaxPercentage = Convert.ToDecimal(calculation.Taxpercentage),
                    MemberNo = mappedobject.MemberNo,
                    ApplicationType = "NW",
                    InstallmentId = Convert.ToInt32(memberRegistration.InstallmentId),
                    ModifiedOn = DateTime.Now,
                    ModifiedBy = userid,
                    TaxPercentageAmount = Convert.ToDecimal(calculation.TaxPercentageAmount),
                    InvoiceNo = memberRegistration.InvoiceNo

                };

                var result = _memberRegistrationCommand.Update(mappedobject, paymentDetailsModel);
                if (result == "success")
                {
                    _notificationService.SuccessNotification("Message", "Member Details Updated Successfully!");
                    return RedirectToAction("Index", "Member");
                }

            }


            return View(memberRegistration);
        }

        public IActionResult GetMembershipTypes(RequestMembershipType requestMembershipType)
        {
            var listofAllMembershipTypes = _membershipTypeQueries.GetAllMembershipTypes(requestMembershipType);
            return Json(listofAllMembershipTypes);
        }

        public IActionResult CalculateAmount(RequestTotalAmount requestTotalAmount)
        {
            if (requestTotalAmount.Membershiptypeid == null)
            {
                return Json(new { Values = "" });
            }

            if (requestTotalAmount.Taxtypeid == null)
            {
                return Json(new { Values = "" });
            }

            if (requestTotalAmount.Taxtypeid == 1)
            {
                var value = CalcuateGst(requestTotalAmount.Membershiptypeid, requestTotalAmount.Taxtypeid);
                return Json(new { Values = value });
            }
            else if (requestTotalAmount.Taxtypeid == 2)
            {
                var value = CalcuateVat(requestTotalAmount.Membershiptypeid, requestTotalAmount.Taxtypeid);
                return Json(new { Values = value });
            }

            return Json(new { Values = "" });
        }

        public IActionResult CheckMobileNo(RequestCheckMobile request)
        {
            if (_memberRegistrationQueries.CheckMemberMobileNoExists(request.MobileNo))
            {
                return Json(new { result = "Exists" });
            }
            else
            {
                return Json(new { result = "" });
            }
        }

        public IActionResult CheckEmailId(RequestCheckEmail request)
        {
            if (_memberRegistrationQueries.CheckMemberEmailExists(request.EmailId))
            {
                return Json(new { result = "Exists" });
            }
            else
            {
                return Json(new { result = "" });
            }
        }

        private CalcuationRespone CalcuateGst(int? membershiptypeid, int? taxtypeid)
        {
            var amount = _membershipTypeQueries.MembershipTypeDetailsByMembershipTypeId(membershiptypeid);
            var taxtypepercentage = _taxMasterQueries.GetTaxDetailsbyTaxId(taxtypeid.Value);
            var taxpercentage = taxtypepercentage.TaxRate;
            if (taxpercentage != null)
            {
                var value = (double)taxpercentage / 100;
                var gstatPercentage = value * Convert.ToDouble(amount.Amount);
                var total = Convert.ToDouble(amount.Amount) + gstatPercentage;

                var calcuationRespone = new CalcuationRespone()
                {
                    Amount = Convert.ToDouble(amount.Amount),
                    Taxpercentage = taxpercentage,
                    Total = total,
                    TaxPercentageAmount = gstatPercentage
                };
                return calcuationRespone;
            }
            else
            {
                return new CalcuationRespone();
            }

        }

        private CalcuationRespone CalcuateVat(int? membershiptypeid, int? taxtypeid)
        {
            var amount = _membershipTypeQueries.MembershipTypeDetailsByMembershipTypeId(membershiptypeid);
            var taxtypepercentage = _taxMasterQueries.GetTaxDetailsbyTaxId(taxtypeid.Value);
            var taxpercentage = taxtypepercentage.TaxRate;
            if (taxpercentage != null)
            {
                var value = (double)taxpercentage / 100;
                var vatatPercentage = value * Convert.ToDouble(amount.Amount);
                var total = Convert.ToDouble(amount.Amount) + vatatPercentage;
                var calcuationRespone = new CalcuationRespone()
                {
                    Amount = Convert.ToDouble(amount.Amount),
                    Taxpercentage = taxpercentage,
                    Total = total,
                    TaxPercentageAmount = vatatPercentage
                };
                return calcuationRespone;
            }
            else
            {
                return new CalcuationRespone();
            }
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
                    _memberRegistrationQueries.ShowAllMemberRegistration(sortColumn, sortColumnDirection, searchValue);
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

        [HttpGet]
        public IActionResult MemberProfile(long? memberId)
        {
            if (memberId != null && !Regex.IsMatch(Convert.ToString(memberId)!, "^[0-9]*$"))
            {
                _notificationService.DangerNotification("Message", "Some Thing Went Wrong !");
                return RedirectToAction("Dashboard", "Dashboard");
            }

            if (memberId != null)
            {


                var memberMainViewModel = new MemberMainViewModel();
                var memberprofile = _memberRegistrationQueries.GetMemberRegistrationProfileById(memberId);


                if (memberprofile != null)
                {
                    memberMainViewModel.MemberDetails = memberprofile;
                }


                memberMainViewModel.ListofDocuments = new List<AttachmentGridViewModel>();


                var payment = _paymentDetailsQueries.ListofPayments(memberId.Value);
                if (payment != null)
                {
                    memberMainViewModel.ListofPayments = payment;
                }

                return View(memberMainViewModel);
            }

            return View();
        }


        [HttpPost]
        public IActionResult InActiveMember(long? memberId)
        {
            if (memberId != null)
            {
                var memberdetails = _memberRegistrationQueries.GetMemberDetailsByMemberId(memberId);
                memberdetails.Status = false;
                _memberRegistrationCommand.DeactivateMember(memberdetails);
                return Json(new { Result = "success" });
            }

            return Json(new { Result = "failed" });
        }

        [HttpPost]
        public IActionResult ActiveMember(long? memberId)
        {
            if (memberId != null)
            {
                var memberdetails = _memberRegistrationQueries.GetMemberDetailsByMemberId(memberId);
                memberdetails.Status = true;
                _memberRegistrationCommand.DeactivateMember(memberdetails);
                return Json(new { Result = "success" });
            }

            return Json(new { Result = "failed" });
        }


    }
}
