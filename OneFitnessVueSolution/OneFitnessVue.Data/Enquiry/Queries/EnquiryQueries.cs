using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.Enquiry;
using OneFitnessVue.ViewModel.Enquiry;

namespace OneFitnessVue.Data.Enquiry.Queries
{
    public class EnquiryQueries : IEnquiryQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public EnquiryQueries(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }

        public EnquiryModel GetEnquiryDetailsByEnquiryId(int? enquiryId)
        {
            try
            {
                var enquirydetails = (from enquiry in _oneFitnessVueContext.EnquiryModels
                                          where enquiry.EnquiryId == enquiryId
                                          select enquiry
                    ).FirstOrDefault();

                return enquirydetails;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int? EnquiryCount()
        {
            try
            {
                var enquirycount = (from enquiry in _oneFitnessVueContext.EnquiryModels
                        select enquiry
                    ).Count();

                return enquirycount;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<SelectListItem> GetReasonsList()
        {
            try
            {
                var reasonList = (from reasons in _oneFitnessVueContext.ReasonsModels

                                  select new SelectListItem()
                                  {
                                      Text = reasons.ReasonName,
                                      Value = reasons.ReasonId.ToString()
                                  }).ToList();

                reasonList.Insert(0, new SelectListItem()
                {
                    Value = "",
                    Text = "---Select---"
                });

                return reasonList;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IQueryable<EnquiryGrid> ShowAllEnquiry(string sortColumn, string sortColumnDir, string search)
        {
            try
            {
                var queryable = (from enquiry in _oneFitnessVueContext.EnquiryModels
                                 
                                 join reasons in _oneFitnessVueContext.ReasonsModels on enquiry.ReasonId equals reasons.ReasonId
                                 orderby enquiry.EnquiryId descending
                                 select new EnquiryGrid()
                                 {
                                     EnquiryId = enquiry.EnquiryId,
                                     Status = enquiry.Status == true ? "Active" : "InActive",
                                     FullName = $"{enquiry.FirstName} {enquiry.MiddleName} {enquiry.LastName}",
                                     Workout = "GYM",
                                     EmailId = enquiry.EmailId,
                                     MobileNo = enquiry.MobileNo,
                                     FirstName = enquiry.FirstName,
                                     Gender = enquiry.GenderId == 1 ? "Male" : "Female",
                                     Reason = reasons.ReasonName
                                 }
                    );

                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
                {
                    queryable = queryable.OrderBy(sortColumn + " " + sortColumnDir);
                }


                if (!string.IsNullOrEmpty(search))
                {
                    queryable = queryable.Where(m => m.FirstName.Contains(search) || m.MobileNo.Contains(search));
                }

                return queryable;

            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}