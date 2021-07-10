using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.UserMaster;
using OneFitnessVue.ViewModel.Usermaster;

namespace OneFitnessVue.Data.UserMaster.Queries
{
    public interface IUserMasterQueries
    {
        UserMasterModel GetUserById(int? userId);
        bool CheckUsernameExists(string username);
        UserMasterModel GetUserByUsername(string username);
        CommonUserDetailsViewModel GetCommonUserDetailsbyUserName(string username);
       
    }
}