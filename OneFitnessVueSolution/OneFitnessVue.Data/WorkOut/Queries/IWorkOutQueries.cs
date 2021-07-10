using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;

namespace OneFitnessVue.Data.WorkOut.Queries
{
    public interface IWorkOutQueries
    {
        List<SelectListItem> GetWorkOuts();
    }
}