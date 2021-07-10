using AutoMapper;
using OneFitnessVue.Model.Enquiry;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.ViewModel.Enquiry;
using OneFitnessVue.ViewModel.MemberRegistration;

namespace OneFitnessVue.Web.Mapping
{
    public class OneFitnessVueAutoMapper : Profile
    {
        public OneFitnessVueAutoMapper()
        {
            CreateMap<MemberRegistrationViewModel, MemberRegistrationModel>();
            CreateMap<EditMemberRegistrationViewModel, MemberRegistrationModel>();
            CreateMap<EnquiryViewModel, EnquiryModel>();
        }
    }
}