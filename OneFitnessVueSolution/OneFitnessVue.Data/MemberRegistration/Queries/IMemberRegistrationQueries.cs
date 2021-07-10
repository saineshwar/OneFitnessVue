using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.ViewModel.MemberRegistration;

namespace OneFitnessVue.Data.MemberRegistration.Queries
{
    public interface IMemberRegistrationQueries
    {
        List<SelectListItem> ListofGender();
        bool CheckMemberMobileNoExists(string mobileNo);
        bool CheckMemberEmailExists(string emailId);
        IQueryable<MemberRegistrationGrid> ShowAllMemberRegistration(string sortColumn, string sortColumnDir,
            string search);

        EditMemberRegistrationViewModel GetMemberRegistrationById(long? memberId);
        MemberRegistrationProfileViewModel GetMemberRegistrationProfileById(long? memberId);
        List<MemberRenewalRespone> GetMemberList(string membername);
        MemberRegistrationModel GetMemberDetailsByMemberId(long? memberId);
    }
}