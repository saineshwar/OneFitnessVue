using System;
using System.Collections.Generic;
using System.Linq.Dynamic.Core;
using OneFitnessVue.Data.EFContext;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.UserMaster;
using OneFitnessVue.ViewModel.Usermaster;

namespace OneFitnessVue.Data.UserMaster.Queries
{
    public class UserMasterQueries : IUserMasterQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        public UserMasterQueries(OneFitnessVueContext oneFitnessVueContext)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
        }

        public UserMasterModel GetUserById(int? userId)
        {
            try
            {
                return _oneFitnessVueContext.UserMasters.Find(userId);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool CheckUsernameExists(string username)
        {
            try
            {
                var result = (from menu in _oneFitnessVueContext.UserMasters
                    where menu.UserName == username
                    select menu).Any();

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UserMasterModel GetUserByUsername(string username)
        {
            try
            {
                var result = (from usermaster in _oneFitnessVueContext.UserMasters
                    where usermaster.UserName == username
                    select usermaster).FirstOrDefault();

                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public CommonUserDetailsViewModel GetCommonUserDetailsbyUserName(string username)
        {
            var userdata = (from tempuser in _oneFitnessVueContext.UserMasters
                
                
                where tempuser.UserName == username
                select new CommonUserDetailsViewModel()
                {
                    FirstName = tempuser.FirstName,
                    EmailId = tempuser.EmailId,
                    LastName = tempuser.LastName,
                    RoleId = 2,
                    UserId = tempuser.UserId,
                    RoleName = "SystemUser",
                    Status = tempuser.Status,
                    UserName = tempuser.UserName,
                    PasswordHash = tempuser.PasswordHash,
                    MobileNo = tempuser.MobileNo
                }).FirstOrDefault();

            return userdata;
        }
    }
}