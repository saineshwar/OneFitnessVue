using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.TaxMaster;

namespace OneFitnessVue.Data.TaxMaster.Queries
{
    public interface ITaxMasterQueries
    {
        List<SelectListItem> GetTaxList();
        TaxMasterModel GetTaxDetailsbyTaxId(int taxId);
    }
}