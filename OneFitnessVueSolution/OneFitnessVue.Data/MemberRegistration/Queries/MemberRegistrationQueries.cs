using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.ViewModel.MemberRegistration;


namespace OneFitnessVue.Data.MemberRegistration.Queries
{
    public class MemberRegistrationQueries : IMemberRegistrationQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public MemberRegistrationQueries(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }

        public List<SelectListItem> ListofGender()
        {
            var listofgender = new List<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text="Select",
                    Value =""
                },
                new SelectListItem()
                {
                    Text="Male",
                    Value ="1"
                },
                new SelectListItem()
                {
                    Text="Female",
                    Value ="2"
                }
            };

            return listofgender;
        }

        public bool CheckMemberMobileNoExists(string mobileNo)
        {
            try
            {
                var result = (from member in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                              where member.MobileNo == mobileNo
                              select member).Any();

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool CheckMemberEmailExists(string emailId)
        {
            try
            {
                var result = (from member in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                              where member.EmailId == emailId
                              select member).Any();

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public IQueryable<MemberRegistrationGrid> ShowAllMemberRegistration(string sortColumn, string sortColumnDir, string search)
        {
            try
            {
                var queryableMenuMaster = (from mreg in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                                          
                                           orderby mreg.MemberId descending
                                           select new MemberRegistrationGrid()
                                           {
                                               MemberId = mreg.MemberId,
                                               Status = mreg.Status == true ? "Active" : "InActive",
                                               FullName = $"{mreg.FirstName} {mreg.MiddleName} {mreg.LastName}",
                                               JoiningDate = mreg.JoiningDate,
                                               MemberNo = mreg.MemberNo,
                                               MobileNo = mreg.MobileNo,
                                               FirstName = mreg.FirstName,
                                               PhotoStatus =  "Pending" ,
                                               DocumentStatus = "Pending",

                                           }
                    );

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
                {
                    queryableMenuMaster = queryableMenuMaster.OrderBy(sortColumn + " " + sortColumnDir);
                }


                if (!string.IsNullOrEmpty(search))
                {
                    queryableMenuMaster = queryableMenuMaster.Where(m => m.MemberNo.Contains(search) || m.FirstName.Contains(search));
                }

                return queryableMenuMaster;

            }
            catch (Exception)
            {
                throw;
            }
        }

        public EditMemberRegistrationViewModel GetMemberRegistrationById(long? memberId)
        {
            try
            {
                var memberRegistration = (from mreg in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                                          where mreg.MemberId == memberId
                                          join paymentDetails in _oneFitnessVueContext.PaymentDetailsModels on mreg.MemberId equals paymentDetails.MemberID
                                          orderby mreg.MemberId descending
                                          select new EditMemberRegistrationViewModel()
                                          {
                                              MemberId = mreg.MemberId,
                                              PaymentID = paymentDetails.PaymentID,
                                              Status = mreg.Status,
                                              FirstName = mreg.FirstName,
                                              LastName = mreg.LastName,
                                              MiddleName = mreg.MiddleName,
                                              JoiningDate = $"{mreg.JoiningDate:yyyy-MM-dd}",
                                              MemberNo = mreg.MemberNo,
                                              MembershipTypeId = paymentDetails.MembershipTypeId.ToString(),
                                              MobileNo = mreg.MobileNo,
                                              WorkoutId = paymentDetails.WorkOutId.ToString(),
                                              InstallmentId = paymentDetails.InstallmentId.ToString(),
                                              Address = mreg.Address,
                                              Age = mreg.Age,
                                              Amount = paymentDetails.Amount.ToString(CultureInfo.InvariantCulture),
                                              DOB = $"{mreg.DOB:yyyy-MM-dd}",
                                              EmailId = mreg.EmailId,
                                              GenderId = mreg.GenderId,
                                              PaymentTypeId = paymentDetails.PaymentTypeId.ToString(),
                                              Total = paymentDetails.TotalAmount.ToString(CultureInfo.InvariantCulture),
                                              TaxId = "1",
                                              Taxpercentage = "10",
                                              InvoiceNo= paymentDetails.InvoiceNo,
                                              EmergencyContactName = mreg.EmergencyContactName,
                                              EmergencyContactNo =mreg.EmergencyContactNo
                                          }
                    ).FirstOrDefault();

                return memberRegistration;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public MemberRegistrationProfileViewModel GetMemberRegistrationProfileById(long? memberId)
        {
            try
            {
                var memberRegistration = (from mreg in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                                          where mreg.MemberId == memberId
                                          join paymentDetails in _oneFitnessVueContext.PaymentDetailsModels on mreg.MemberId equals paymentDetails.MemberID
                        
                                          orderby mreg.MemberId descending
                                          select new MemberRegistrationProfileViewModel()
                                          {
                                              MemberId = mreg.MemberId,
                                              MemberNo = mreg.MemberNo,
                                              FullName = $"{mreg.FirstName} {mreg.LastName} {mreg.MiddleName}",
                                              JoiningDate = $"{mreg.JoiningDate:yyyy-MM-dd}",
                                              MembershipType = "Gym 6 Months",
                                              MobileNo = mreg.MobileNo,
                                              Workout = "",
                                              Installment = "6 Month",
                                              Address = mreg.Address,
                                              Age = mreg.Age,
                                              DOB = $"{mreg.DOB:yyyy-MM-dd}",
                                              EmailId = mreg.EmailId,
                                              Gender = mreg.GenderId == 1 ? "Male" : "Female",
                                              EmergencyContactName = mreg.EmergencyContactName,
                                              EmergencyContactNo = mreg.EmergencyContactNo
                                          }
                    ).FirstOrDefault();

                return memberRegistration;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<MemberRenewalRespone> GetMemberList(string membername)
        {
            try
            {
                var result = (from member in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                              where member.FirstName.Contains(membername)
                              select new MemberRenewalRespone()
                              {
                                  MemberId = $"{member.FirstName} {member.MiddleName} {member.LastName} | {member.MemberId.ToString()}",
                                  Name = $"{member.FirstName} {member.MiddleName} {member.LastName} | {member.MemberNo} | {member.MemberId.ToString()}"
                              }).ToList();

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public MemberRegistrationModel GetMemberDetailsByMemberId(long? memberId)
        {
            try
            {
                var memberRegistration = (from mreg in _oneFitnessVueContext.MemberRegistrationModels.AsNoTracking()
                                          where mreg.MemberId == memberId
                                          select mreg
                    ).FirstOrDefault();

                return memberRegistration;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}