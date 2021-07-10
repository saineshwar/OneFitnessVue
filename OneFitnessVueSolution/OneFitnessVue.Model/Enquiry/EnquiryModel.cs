using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace OneFitnessVue.Model.Enquiry
{
    [Table("Enquiry")]
    public class EnquiryModel
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EnquiryId { get; set; }
        public int? WorkOutId { get; set; }
        [MaxLength(100)]
        public string FirstName { get; set; }
        [MaxLength(100)]
        public string LastName { get; set; }
        [MaxLength(100)]
        public string MiddleName { get; set; }
        [MaxLength(10)]
        public string MobileNo { get; set; }
        [MaxLength(100)]
        public string EmailId { get; set; }
        public int? GenderId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public bool? Status { get; set; }
        [MaxLength(100)]
        public string EnquiryDetails { get; set; }
        public int? ReasonId { get; set; }
    }

}
