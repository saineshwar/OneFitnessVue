using System.Collections.Generic;
// ReSharper disable All

namespace OneFitnessVue.ViewModel.Dashboard
{
    
    public class BarchartResponse
    {
        public string backgroundColor { get; set; }
        public string borderColor { get; set; }
        public List<int> data { get; set; }
    }
}