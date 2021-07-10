using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Data.EFContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;

namespace OneFitnessVue.Data.WorkOut.Queries
{
    public class WorkOutQueries : IWorkOutQueries
    {
       
        public List<SelectListItem> GetWorkOuts()
        {
            try
            {
                var workoutslist = new List<SelectListItem>()
                {
                    new SelectListItem()
                    {
                        Text = "GYM",
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


       

    }
}