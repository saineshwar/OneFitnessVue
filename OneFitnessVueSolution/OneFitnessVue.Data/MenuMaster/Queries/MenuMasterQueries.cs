using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using OneFitnessVue.Common;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.MenuMaster;



namespace OneFitnessVue.Data.MenuMaster.Queries
{
    public class MenuMasterQueries: IMenuMasterQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        private readonly IMemoryCache _cache;
        public MenuMasterQueries(OneFitnessVueContext oneFitnessVueContext, IMemoryCache cache)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
            _cache = cache;
        }

        public List<MenuMasterModel> GetMenuByRoleId(int? roleId, int? menuCategoryId)
        {
            var key = $"{AllMemoryCacheKeys.MenuMasterKey}_{roleId}";
            List<MenuMasterModel> menuList;
            if (_cache.Get(key) == null)
            {
                var result = (from menu in _oneFitnessVueContext.MenuMasters.AsNoTracking()
                              orderby menu.SortingOrder ascending
                              where menu.Status == true
                              select menu).ToList();

                MemoryCacheEntryOptions cacheExpirationOptions = new MemoryCacheEntryOptions
                {
                    AbsoluteExpiration = DateTime.Now.AddDays(7),
                    Priority = CacheItemPriority.Normal
                };

                _cache.Set<List<MenuMasterModel>>(key, result, cacheExpirationOptions);

                menuList = ((from menu in result
                             orderby menu.SortingOrder ascending
                             where menu.Status == true && menu.RoleId == roleId && menu.MenuCategoryId == menuCategoryId
                             select menu).ToList());
            }
            else
            {
                var storeMenuMasters = _cache.Get(key) as List<MenuMasterModel>;

                menuList = ((from menu in storeMenuMasters
                             orderby menu.SortingOrder ascending
                             where menu.Status == true && menu.RoleId == roleId && menu.MenuCategoryId == menuCategoryId
                             select menu).ToList());
            }

            return menuList;
        }

    }
}