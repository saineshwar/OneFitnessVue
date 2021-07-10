using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace OneFitnessVue.ViewModel.Documents
{
    public class AttachmentGridViewModel
    {
        public int ADId { get; set; }
        public string DocumentName { get; set; }
        public long? MemberId { get; set; }

    }

}