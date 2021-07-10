using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.MemberRegistration
{
    [Table("MemberRegistration")]
    public class MemberRegistrationModel
    {
        [Key]
        public long MemberId { get; set; }
        public string MemberNo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public DateTime? DOB { get; set; }
        public int? Age { get; set; }
        public string MobileNo { get; set; }
        public string EmailId { get; set; }
        public int? GenderId { get; set; }
        public string Address { get; set; }
        public DateTime? JoiningDate { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public bool Status { get; set; }
        public string EmergencyContactName { get; set; }
        public string EmergencyContactNo { get; set; }
    }
}