using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.Reporting
{
    [Table("ReceiptHistory")]
    public class ReceiptHistoryModel
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long ReceiptHistoryId { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int? CreatedBy { get; set; }
        public long? InvoiceNo { get; set; }
        [MaxLength(20)]
        public string MemberNo { get; set; }
    }

}