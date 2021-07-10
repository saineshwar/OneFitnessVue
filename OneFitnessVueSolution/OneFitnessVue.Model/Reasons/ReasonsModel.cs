using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.Reasons
{
    [Table("Reasons")]
    public class ReasonsModel
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ReasonId { get; set; }
        [MaxLength(50)]
        public string ReasonName { get; set; }
    }

}