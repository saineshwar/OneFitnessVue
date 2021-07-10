using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Routing;

namespace OneFitnessVue.Web.Helpers
{
    public static class CustomQueryStringHelper
    {
        public static string EncryptString(string areas, string actionName, string controllerName, object routeValues)
        {
            var dataProtectionProvider = DataProtectionProvider.Create("OneFitnessVue");
            var protector = dataProtectionProvider.CreateProtector("OneFitnessVue.QueryStrings");

            string mainString;
            string queryString = string.Empty;
            var rvd = new RouteValueDictionary(routeValues);
            IList<string> strings = new List<string>();

            if (routeValues != null)
            {
                for (int i = 0; i < rvd.Keys.Count; i++)
                {
                    strings.Add(rvd.Keys.ElementAt(i) + "=" + rvd.Values.ElementAt(i));
                }
                queryString += string.Join(",", strings);

                var format = new CultureInfo("en-GB");
                var random = Guid.NewGuid().ToString("N").Substring(0, 10).ToUpper();
                var values = string.Join("[", random, queryString, DateTime.Now.ToString(format));

                if (string.IsNullOrEmpty(areas))
                {
                    mainString = $"/{controllerName}/{actionName}?q={protector.Protect(values)}";
                }
                else
                {
                    mainString = $"/{areas}/{controllerName}/{actionName}?q={protector.Protect(values)}";
                }

            }
            else
            {
                if (string.IsNullOrEmpty(areas))
                {
                    mainString = $"/{controllerName}/{actionName}";
                }
                else
                {
                    mainString = $"/{areas}/{controllerName}/{actionName}";
                }
            }

            return mainString;
        }
    }
}