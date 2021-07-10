using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.MenuCategory
{
    [Table("MenuCategory")]
    public class MenuCategoryModel
    {
        [Key]
        public int MenuCategoryId { get; set; }
        public string MenuCategoryName { get; set; }
        public int RoleId { get; set; }
        public bool Status { get; set; }
        public DateTime? CreatedOn { get; set; } = DateTime.Now;
        public DateTime? ModifiedOn { get; set; }
        public int? CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public int? SortingOrder { get; set; }
    }
}