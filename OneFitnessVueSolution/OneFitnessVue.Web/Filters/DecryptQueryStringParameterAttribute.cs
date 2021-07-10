using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using OneFitnessVue.Common;

namespace OneFitnessVue.Web.Filters
{
    public class DecryptQueryStringParameterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                var dataProtectionProvider = DataProtectionProvider.Create("OneFitnessVue");
                var protector = dataProtectionProvider.CreateProtector("OneFitnessVue.QueryStrings");

                Dictionary<string, object> decryptedParameters = new Dictionary<string, object>();
                if (filterContext.HttpContext.Request.Query["q"].ToString() != null)
                {
                    string decrptedString = protector.Unprotect(filterContext.HttpContext.Request.Query["q"].ToString());
                    string[] getRandom = decrptedString.Split('[');

                    var format = new CultureInfo("en-GB");
                    var dateCheck = Convert.ToDateTime(getRandom[2], format);

                    TimeSpan diff = Convert.ToDateTime(DateTime.Now, format) - dateCheck;

                    /* For Development it is been commented */
                    //if (diff.Minutes > 3)
                    //{
                    //    filterContext.Result = new RedirectResult("/Error/Error");
                    //}

                    string[] paramsArrs = getRandom[1].Split(',');

                    foreach (var t in paramsArrs)
                    {
                        string[] paramArr = t.Split('=');
                        decryptedParameters.Add(paramArr[0], Convert.ToString(paramArr[1]));
                    }

                }
                for (int i = 0; i < decryptedParameters.Count; i++)
                {
                    filterContext.ActionArguments[decryptedParameters.Keys.ElementAt(i)] = decryptedParameters.Values.ElementAt(i);
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}