using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.MenuMaster;



namespace OneFitnessVue.Data.MenuMaster.Queries
{
    public interface IMenuMasterQueries
    {
    
        List<MenuMasterModel> GetMenuByRoleId(int? roleId, int? menuCategoryId);
    }
}