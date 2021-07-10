using Microsoft.EntityFrameworkCore;
using OneFitnessVue.Model.Enquiry;
using OneFitnessVue.Model.GeneralSetting;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.Model.MenuCategory;
using OneFitnessVue.Model.MenuMaster;
using OneFitnessVue.Model.PaymentDetails;
using OneFitnessVue.Model.Reasons;
using OneFitnessVue.Model.Reporting;
using OneFitnessVue.Model.UserMaster;

namespace OneFitnessVue.Data.EFContext
{
    public class OneFitnessVueContext : DbContext
    {
        public OneFitnessVueContext(DbContextOptions<OneFitnessVueContext> options) : base(options)
        {

        }
    
        public DbSet<MenuCategoryModel> MenuCategorys { get; set; }
        public DbSet<MenuMasterModel> MenuMasters { get; set; }
        public DbSet<UserMasterModel> UserMasters { get; set; }
        public DbSet<MemberRegistrationModel> MemberRegistrationModels { get; set; }
        public DbSet<PaymentDetailsModel> PaymentDetailsModels { get; set; }
        public DbSet<GeneralSettingsModel> GeneralSettings { get; set; }
        public DbSet<ReceiptHistoryModel> ReceiptHistory { get; set; }
        public DbSet<EnquiryModel> EnquiryModels { get; set; }
        public DbSet<ReasonsModel> ReasonsModels { get; set; }
    }
}