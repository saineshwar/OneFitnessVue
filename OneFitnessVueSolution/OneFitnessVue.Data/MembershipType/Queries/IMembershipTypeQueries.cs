using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using OneFitnessVue.Model.MembershipType;
using OneFitnessVue.ViewModel.MembershipType;

namespace OneFitnessVue.Data.MembershipType.Queries
{
    public interface IMembershipTypeQueries
    {
        List<SelectListItem> GetAllMembershipTypes(RequestMembershipType requestMembershipType);
        MembershipTypeModel MembershipTypeDetailsByMembershipTypeId(int? membershipTypeId);
    }
}