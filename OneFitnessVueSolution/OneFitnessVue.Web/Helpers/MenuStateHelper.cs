using System;
using Microsoft.AspNetCore.Mvc;

namespace OneFitnessVue.Web.Helpers
{
    public static class MenuStateHelper
    {
        public static string MakeActiveClass(this IUrlHelper urlHelper, string controller, string action)
        {
            try
            {
                string result = "active";

                if (!string.IsNullOrEmpty(Convert.ToString(urlHelper.ActionContext.RouteData.DataTokens["area"])))
                {
                    string areaName = urlHelper.ActionContext.RouteData.DataTokens["area"]?.ToString();
                }

                string controllerName = urlHelper.ActionContext.RouteData.Values?["controller"]?.ToString();
                string methodName = urlHelper.ActionContext.RouteData.Values?["action"]?.ToString();
                if (string.IsNullOrEmpty(controllerName)) return null;
                if (controllerName.Equals(controller, StringComparison.OrdinalIgnoreCase))
                {
                    if (methodName != null && methodName.Equals(action, StringComparison.OrdinalIgnoreCase))
                    {
                        return result;
                    }
                }

                return null;
            }
            catch (Exception)
            {
                return null;
            }

        }
    }
}