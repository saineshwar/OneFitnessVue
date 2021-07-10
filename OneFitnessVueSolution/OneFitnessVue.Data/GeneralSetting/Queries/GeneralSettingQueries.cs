using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.GeneralSetting;
using OneFitnessVue.ViewModel.MemberRegistration;
using System;
using System.Data;
using System.Linq;
using System.Linq.Dynamic.Core;

namespace OneFitnessVue.Data.GeneralSetting.Queries
{
    public class GeneralSettingQueries : IGeneralSettingQueries
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        private readonly IConfiguration _configuration;
        public GeneralSettingQueries(OneFitnessVueContext oneFitnessVueContext, IConfiguration configuration)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
            _configuration = configuration;
        }


        public GeneralSettingsModel GetActiveGeneralSettings()
        {
            var result = (from generalSetting in _oneFitnessVueContext.GeneralSettings
                select generalSetting).FirstOrDefault();

            return result;
        }

        public RecepitDetailsViewModel GetRecepitDetails(string memberId, string paymentId)
        {
            using SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            try
            {
                var param = new DynamicParameters();
                param.Add("@MemberID", memberId);
                param.Add("@PaymentID", paymentId);
                var result = connection.Query<RecepitDetailsViewModel>("Usp_GetRecepitDetails", param,null,true,0,CommandType.StoredProcedure).FirstOrDefault();
                return result;
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}