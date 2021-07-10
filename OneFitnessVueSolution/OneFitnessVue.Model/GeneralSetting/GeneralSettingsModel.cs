using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.GeneralSetting
{
    [Table("GeneralSettings")]
    public class GeneralSettingsModel
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "Company Id")]
        public int CompanyId { get; set; }
        [MaxLength(100)]
        [Display(Name = "Name")]
        public string Name { get; set; }
        [MaxLength(100)]
        [Display(Name = "Support Email Id")]
        public string SupportEmailId { get; set; }
        [MaxLength(100)]
        [Display(Name = "Website Title")]
        public string WebsiteTitle { get; set; }
        [MaxLength(100)]
        [Display(Name = "Website Url")]
        public string WebsiteUrl { get; set; }
        [MaxLength(15)]
        [Display(Name = "Telephone No")]
        public string TelephoneNo { get; set; }
        [MaxLength(10)]
        [Display(Name = "Mobile No")]
        public string MobileNo { get; set; }
        [Display(Name = "Status")]
        public bool Status { get; set; }

        [MaxLength(100)]
        [Display(Name = "Logopath")]
        public string Logopath { get; set; }

        [MaxLength(100)]
        public string LogoFileName { get; set; }

        [MaxLength(200)]
        [Display(Name = "Address")]
        public string Address { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int? ModifiedBy { get; set; }

    }

}