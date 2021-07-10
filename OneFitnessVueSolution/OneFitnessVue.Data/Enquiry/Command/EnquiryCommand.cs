using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.Enquiry;
using OneFitnessVue.Model.MemberRegistration;

namespace OneFitnessVue.Data.Enquiry.Command
{
    public class EnquiryCommand : IEnquiryCommand
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        private readonly IConfiguration _configuration;
        public EnquiryCommand(OneFitnessVueContext oneFitnessVueContext, IConfiguration configuration)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
            _configuration = configuration;
        }

        public string Add(EnquiryModel enquiryModel)
        {
            string result;

            using var transaction = _oneFitnessVueContext.Database.BeginTransaction();
            _oneFitnessVueContext.EnquiryModels.Add(enquiryModel);
            var resultmember = _oneFitnessVueContext.SaveChanges();

            if (resultmember > 0)
            {
                transaction.Commit();
                result = "success";
            }
            else
            {
                transaction.Rollback();
                result = "failed";
            }

            return result;
        }

        public int Delete(EnquiryModel enquiryModel)
        {
            _oneFitnessVueContext.Entry(enquiryModel).State = EntityState.Deleted;
            return _oneFitnessVueContext.SaveChanges();
        }

    }
}