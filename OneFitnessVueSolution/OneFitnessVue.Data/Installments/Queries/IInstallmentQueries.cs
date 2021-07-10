using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using OneFitnessVue.ViewModel.Installments;

namespace OneFitnessVue.Data.Installments.Queries
{
    public interface IInstallmentQueries
    {
        List<SelectListItem> GetInstallments();
        InstallmentEditViewModel GetInstallmentByInstallmentId(int? installmentId);
    }
}