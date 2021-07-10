using System;
using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using OneFitnessVue.Data.EFContext;
using OneFitnessVue.Model.MemberRegistration;
using OneFitnessVue.Model.PaymentDetails;

namespace OneFitnessVue.Data.MemberRegistration.Command
{
    public class MemberRegistrationCommand : IMemberRegistrationCommand
    {
        private readonly OneFitnessVueContext _oneFitnessVueContext;
        private readonly IConfiguration _configuration;
        public MemberRegistrationCommand(OneFitnessVueContext oneFitnessVueContext, IConfiguration configuration)
        {
            _oneFitnessVueContext = oneFitnessVueContext;
            _configuration = configuration;
        }

        public string Add(MemberRegistrationModel memberRegistration, PaymentDetailsModel paymentDetailsModel)
        {
            string result;

            using var transaction = _oneFitnessVueContext.Database.BeginTransaction();
            _oneFitnessVueContext.MemberRegistrationModels.Add(memberRegistration);
            var resultmember = _oneFitnessVueContext.SaveChanges();

            paymentDetailsModel.MemberID = memberRegistration.MemberId;
            _oneFitnessVueContext.PaymentDetailsModels.Add(paymentDetailsModel);
            var resultpayment = _oneFitnessVueContext.SaveChanges();

            if (resultmember > 0 && resultpayment > 0)
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

      

        public string Update(MemberRegistrationModel memberRegistration, PaymentDetailsModel paymentDetailsModel)
        {
            string result;

            using var transaction = _oneFitnessVueContext.Database.BeginTransaction();
            _oneFitnessVueContext.Entry(memberRegistration).State = EntityState.Modified;
            var resultmember = _oneFitnessVueContext.SaveChanges();

            _oneFitnessVueContext.Entry(paymentDetailsModel).State = EntityState.Modified;
            var resultpayment = _oneFitnessVueContext.SaveChanges();


            if (resultmember > 0 && resultpayment > 0)
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

        public long GetInvoiceNo()
        {
            using SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            try
            {
                long invoiceId = 0;
                connection.Open();
                using var transaction = connection.BeginTransaction();
                var param = new DynamicParameters();
                param.Add("@InvoiceId", dbType: DbType.Int64, direction: ParameterDirection.Output, size: 50);
                var result = connection.Execute("Usp_GetNewInvoiceId", param, transaction, 0, CommandType.StoredProcedure);
                if (result > 0)
                {
                    transaction.Commit();
                    invoiceId = param.Get<long>("@InvoiceId");
                }
                else
                {
                    transaction.Rollback();
                }

                return invoiceId;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int DeactivateMember(MemberRegistrationModel memberRegistration)
        {
            _oneFitnessVueContext.Entry(memberRegistration).State = EntityState.Modified;
            return _oneFitnessVueContext.SaveChanges();
        }

    }
}