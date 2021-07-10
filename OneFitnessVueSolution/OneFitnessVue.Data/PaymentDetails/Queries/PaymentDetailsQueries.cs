using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Dynamic.Core;
using Dapper;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.ViewModel.MemberRegistration;
using OneFitnessVue.ViewModel.PaymentDetails;

namespace OneFitnessVue.Data.PaymentDetails.Queries
{
    public class PaymentDetailsQueries : IPaymentDetailsQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        private readonly IConfiguration _configuration;
        public PaymentDetailsQueries(OneFitnessVueContext oneFitnessVueContext, IConfiguration configuration)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
            _configuration = configuration;
        }

        public List<PaymentDetailsViewModel> ListofPayments(long? memberId)
        {
            var result = (from paymentDetails in _oneFitnessVueContext.PaymentDetailsModels.AsNoTracking()
                          where paymentDetails.MemberID == memberId
                          orderby paymentDetails.CreatedOn descending
                         
                          select new PaymentDetailsViewModel()
                          {
                              PaymentID = paymentDetails.PaymentID,
                              MembershipType = "Gym 6 Months",
                              WorkOut = "GYM",
                              Amount = paymentDetails.Amount,
                              Installment = "6 Month",
                              NextRenewalDate = $"{paymentDetails.NextRenewalDate:yyyy-MM-dd}",
                              PaymentFromdt = $"{paymentDetails.PaymentFromdt:yyyy-MM-dd}",
                              PaymentTodt = $"{paymentDetails.PaymentTodt:yyyy-MM-dd}",
                              TaxPercentage = Convert.ToDecimal(paymentDetails.TaxPercentage),
                              TotalAmount = paymentDetails.TotalAmount,
                              Tax = "GST",
                              PaymentType = "Cash",
                              CreateDate = paymentDetails.CreatedOn,
                              MemberID = paymentDetails.MemberID,
                              ApplicationType = paymentDetails.ApplicationType
                          }).ToList();



            return result;
        }

        public IQueryable<PaymentDetailsViewModel> ShowAllPaymentsHistory(string sortColumn, string sortColumnDir, string search)
        {
            try
            {
                var queryableMenuMaster = (from paymentDetails in _oneFitnessVueContext.PaymentDetailsModels.AsNoTracking()

                                           orderby paymentDetails.NextRenewalDate ascending
                                           join memberRegistration in _oneFitnessVueContext.MemberRegistrationModels on paymentDetails.MemberID equals memberRegistration.MemberId
                                           
                                       


                                           select new PaymentDetailsViewModel()
                                           {
                                               PaymentID = paymentDetails.PaymentID,
                                               MembershipType = "Gym 6 Months",
                                               WorkOut = "GYM",
                                               Amount = paymentDetails.Amount,
                                               Installment = "6 Month",
                                               NextRenewalDate = $"{paymentDetails.NextRenewalDate:yyyy-MM-dd}",
                                               PaymentFromdt = $"{paymentDetails.PaymentFromdt:yyyy-MM-dd}",
                                               PaymentTodt = $"{paymentDetails.PaymentTodt:yyyy-MM-dd}",
                                               TaxPercentage = Convert.ToDecimal(paymentDetails.TaxPercentage),
                                               TotalAmount = paymentDetails.TotalAmount,
                                               Tax = "GST",
                                               PaymentType = "Cash",
                                               CreateDate = paymentDetails.CreatedOn,
                                               MemberID = paymentDetails.MemberID,
                                               FirstName = memberRegistration.FirstName,
                                               MemberNo = memberRegistration.MemberNo,
                                               FullName = $"{memberRegistration.FirstName} {memberRegistration.MiddleName} {memberRegistration.LastName}",
                                               ApplicationType = paymentDetails.ApplicationType == "NW" ? "New" :
                                                   paymentDetails.ApplicationType == "RE" ? "Renewed" :
                                                   paymentDetails.ApplicationType == "RF" ? "Refund" : "--"

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


    


    }
}