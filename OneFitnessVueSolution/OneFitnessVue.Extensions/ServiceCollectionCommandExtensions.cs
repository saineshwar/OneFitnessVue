using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using OneFitnessVue.Data.Enquiry.Command;
using OneFitnessVue.Data.MemberRegistration.Command;
using OneFitnessVue.Data.PaymentDetails.Command;
using OneFitnessVue.Data.Reporting.Command;

namespace OneFitnessVue.Extensions
{
    public static class ServiceCollectionCommandExtensions
    {
        public static IServiceCollection AddServicesCommand(this IServiceCollection services,
            IConfiguration configuration)
        {
            
            services.AddScoped<IMemberRegistrationCommand, MemberRegistrationCommand>();
          
            services.AddScoped<IPaymentDetailsCommand, PaymentDetailsCommand>();
            services.AddScoped<IReportingCommand, ReportingCommand>();
            services.AddScoped<IEnquiryCommand, EnquiryCommand>();
            return services;
        }
    }
}
