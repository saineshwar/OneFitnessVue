using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.MenuMaster
{
    [Table("MenuMaster")]
    public class MenuMasterModel
    {
        [Key]
        public int MenuId { get; set; }
        public string MenuName { get; set; }
        public string Area { get; set; }
        public string ControllerName { get; set; }
        public string ActionMethod { get; set; }
        public bool Status { get; set; }
        public DateTime? CreatedOn { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }

        [ForeignKey("MenuCategory")]
        public int? MenuCategoryId { get; set; }
        public int? RoleId { get; set; }
        public int? SortingOrder { get; set; }
    }
}