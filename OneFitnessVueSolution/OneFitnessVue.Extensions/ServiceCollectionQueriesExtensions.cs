using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using OneFitnessVue.Common.Notification;
using OneFitnessVue.Data.Enquiry.Queries;
using OneFitnessVue.Data.GeneralSetting.Queries;
using OneFitnessVue.Data.Installments.Queries;
using OneFitnessVue.Data.MemberRegistration.Queries;
using OneFitnessVue.Data.MembershipType.Queries;
using OneFitnessVue.Data.MenuCategory.Queries;
using OneFitnessVue.Data.MenuMaster.Queries;
using OneFitnessVue.Data.PaymentDetails.Queries;
using OneFitnessVue.Data.PaymentType.Queries;
using OneFitnessVue.Data.Reporting.Queries;
using OneFitnessVue.Data.TaxMaster.Queries;
using OneFitnessVue.Data.UserMaster.Queries;
using OneFitnessVue.Data.WorkOut.Queries;
using OneFitnessVue.Services.Messages;

namespace OneFitnessVue.Extensions
{
    public static class ServiceCollectionQueriesExtensions
    {
        public static IServiceCollection AddServicesQueries(this IServiceCollection services,
            IConfiguration configuration)
        {
            services.AddTransient<INotificationService, NotificationService>();
            services.AddTransient<IEmailSender, EmailSender>();

            services.AddTransient<IUserMasterQueries, UserMasterQueries>();
        
            services.AddTransient<IMenuMasterQueries, MenuMasterQueries>();
            services.AddTransient<IMenuCategoryQueries, MenuCategoryQueries>();
            
            services.AddTransient<IWorkOutQueries, WorkOutQueries>();
            services.AddTransient<IInstallmentQueries, InstallmentQueries>();

            services.AddTransient<IMembershipTypeQueries, MembershipTypeQueries>();
            services.AddTransient<IMemberRegistrationQueries, MemberRegistrationQueries>();
            services.AddTransient<ITaxMasterQueries, TaxMasterQueries>();
            services.AddTransient<IPaymentTypeQueries, PaymentTypeQueries>();
         
            services.AddTransient<IPaymentDetailsQueries, PaymentDetailsQueries>();
            services.AddTransient<IGeneralSettingQueries, GeneralSettingQueries>();
            services.AddScoped<IReportingQueries, ReportingQueries>();
            services.AddScoped<IEnquiryQueries, EnquiryQueries>();
            return services;
        }
    }
}