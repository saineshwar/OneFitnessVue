using System;
using System.Linq;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;

namespace OneFitnessVue.Web.Filters
{
    public class HandleExceptionAttribute : ExceptionFilterAttribute
    {
        private readonly ILogger<HandleExceptionAttribute> _logger;
        public HandleExceptionAttribute(ILogger<HandleExceptionAttribute> logger)
        {
            _logger = logger;
        }
        public override void OnException(ExceptionContext filterContext)
        {
            bool isAjaxCall = filterContext.HttpContext.Request.Headers["x-requested-with"] == "XMLHttpRequest";
            filterContext.HttpContext.Session.Clear();

            if (isAjaxCall)
            {
                filterContext.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                var data = new
                {
                    filterContext.Exception.Message,
                    filterContext.Exception.StackTrace
                };
                filterContext.Result = new JsonResult(data);
                filterContext.ExceptionHandled = true;
            }

            if (!isAjaxCall)
            {
                filterContext.Result = new RedirectResult("/Error/Error");
            }

            _logger.LogError(GetExceptionDetails(filterContext.Exception));

            filterContext.ExceptionHandled = true;
            base.OnException(filterContext);

        }

        private string GetExceptionDetails(Exception exception)
        {
            var properties = exception.GetType()
                .GetProperties();
            var fields = properties
                .Select(property => new
                {
                    Name = property.Name,
                    Value = property.GetValue(exception, null)
                })
                .Select(x => $"{x.Name} = {(x.Value != null ? x.Value.ToString() : String.Empty)}");
            return String.Join("\n", fields);
        }
    }
}