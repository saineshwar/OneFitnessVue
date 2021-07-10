using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.MembershipType;
using OneFitnessVue.ViewModel.MembershipType;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;

namespace OneFitnessVue.Data.MembershipType.Queries
{
    public class MembershipTypeQueries : IMembershipTypeQueries
    {
        public List<SelectListItem> GetAllMembershipTypes(RequestMembershipType requestMembershipType)
        {
            try
            {
                var membershiptypelist = new List<SelectListItem>()
                {
                    new SelectListItem()
                    {
                        Text = "Gym 6 Months",
                        Value = "1"
                    }
                };

                membershiptypelist.Insert(0, new SelectListItem()
                {
                    Value = "",
                    Text = "---Select---"
                });

                return membershiptypelist;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public MembershipTypeModel MembershipTypeDetailsByMembershipTypeId(int? membershipTypeId)
        {
            var membershiptype = new MembershipTypeModel()
            {
                Amount = 7000.00m,
                CreatedBy =1,
                CreatedOn =DateTime.Now,
                InstallmentId =1,
                MembershipTypeId = 1,
                MembershipTypeName = "Gym 6 Months",
                ModifiedBy = 0,
                ModifiedOn = DateTime.Now,
                Status = true,
                WorkOutId = 1
            };

            return membershiptype;
        }

     
    }
}