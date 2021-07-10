using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using OneFitnessVue.ViewModel.MemberRegistration;
using OneFitnessVue.ViewModel.Reporting;

namespace OneFitnessVue.Data.Reporting.Queries
{
    public class ReportingQueries : IReportingQueries
    {
        private readonly IConfiguration _configuration;
        public ReportingQueries(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public List<RenewalReportViewModel> Get_RenewalReport(RenewalReportingViewModel renewalReport)
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            var para = new DynamicParameters();
            para.Add("@Paymentfromdt", renewalReport.Fromdate);
            para.Add("@Paymenttodt", renewalReport.Todate);
            return con.Query<RenewalReportViewModel>("Usp_GetAllRenwalrecordsFromBetweenDate", para, null, true, 0, commandType: CommandType.StoredProcedure).ToList();
        }
        public List<YearwiseChartResponseViewModel> YearwiseChartRenewedResponse()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<YearwiseChartResponseViewModel>("Usp_GetYearwiseRenewedMember", null, null, true, 0, commandType: CommandType.StoredProcedure).ToList();
        }
        public List<YearwiseChartResponseViewModel> YearwiseChartNewResponse()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<YearwiseChartResponseViewModel>("Usp_GetYearwiseNewMember", null, null, true, 0, commandType: CommandType.StoredProcedure).ToList();
        }
        public int? GetRenewedMonthlyCount()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<int>("Usp_GetRenewedMonthly", null, null, true, 0, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }

        public int? GetNewRegistrationMonthlyCount()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<int>("Usp_GetNewRegistrationMonthly", null, null, true, 0, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }

        public List<MembershipTypeViewModel> GetTopMembershipTypeInYear()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<MembershipTypeViewModel>("Usp_GetTopMembershipType", null, null, true, 0, commandType: CommandType.StoredProcedure).ToList();
        }

        public int? GetNewRegistrationDailyCount()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<int>("Usp_GetNewRegistrationDaily", null, null, true, 0, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }

        public int? GetRefundMonthlyCount()
        {
            using var con = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            return con.Query<int>("Usp_GetRefundMonthly", null, null, true, 0, commandType: CommandType.StoredProcedure).FirstOrDefault();
        }
    }
}