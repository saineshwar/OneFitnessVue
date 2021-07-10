using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.MenuCategory;


namespace OneFitnessVue.Data.MenuCategory.Queries
{
    public interface IMenuCategoryQueries
    {
        List<MenuCategoryModel> GetCategoryByRoleId(int? roleId);
    }
}