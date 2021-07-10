using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.TaxMaster;

namespace OneFitnessVue.Data.TaxMaster.Queries
{
    public class TaxMasterQueries : ITaxMasterQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public TaxMasterQueries(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }


        public List<SelectListItem> GetTaxList()
        {
            try
            {
                var workoutslist = new List<SelectListItem>()
                {
                    new SelectListItem()
                    {
                        Text = "GST",
                        Value = "1"
                    }
                };

                workoutslist.Insert(0, new SelectListItem()
                {
                    Value = "",
                    Text = "---Select---"
                });

                return workoutslist;
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public TaxMasterModel GetTaxDetailsbyTaxId(int taxId)
        {
            var taxdetails = new TaxMasterModel()
            {
                TaxId =1,
                Status = true,
                TaxRate = 10,
                TaxType = "GST",
                IdentificationNo = "155555555555"
            };

            return taxdetails;

        }
    }
}