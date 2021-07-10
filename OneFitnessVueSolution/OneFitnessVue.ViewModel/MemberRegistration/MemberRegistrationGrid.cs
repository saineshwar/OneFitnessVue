using System;

namespace OneFitnessVue.ViewModel.MemberRegistration
{
    public class MemberRegistrationGrid
    {
        public long MemberId { get; set; }
        public string MemberNo { get; set; }
        public string FullName { get; set; }
        public string MobileNo { get; set; }
        public DateTime? JoiningDate { get; set; }
        public string Status { get; set; }
        public string FirstName { get; set; }
        public string PhotoStatus { get; set; }
        public string DocumentStatus { get; set; }
    }
}