using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OneFitnessVue.Model.TaxMaster
{
    
    public class TaxMasterModel
    {
        public int TaxId { get; set; }
        public string TaxType { get; set; }
        public decimal? TaxRate { get; set; }
        public bool? Status { get; set; }
        public string IdentificationNo { get; set; }
    }

}