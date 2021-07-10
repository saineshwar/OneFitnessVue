using OneFitnessVue.Model.Enquiry;

namespace OneFitnessVue.Data.Enquiry.Command
{
    public interface IEnquiryCommand
    {
        string Add(EnquiryModel enquiryModel);
        int Delete(EnquiryModel enquiryModel);
    }
}