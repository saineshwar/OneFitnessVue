using System;
using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace OneFitnessVue.Data.EFContext
{
    public class SqlConnectionManager : IDisposable
    {
        private IDbConnection _connection;
        private IDbTransaction _transaction;
        private readonly IConfiguration _configuration;
        public SqlConnectionManager(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public (IDbConnection, IDbTransaction) StartTransaction()
        {
            _connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            _connection.Open();
            _transaction = _connection.BeginTransaction();
            return (_connection, _transaction);
        }

        public IDbConnection StartConnection()
        {
            _connection = new SqlConnection(_configuration.GetConnectionString("DatabaseConnection"));
            _connection.Open();
            return _connection;
        }

        public void Commit()
        {
            _transaction?.Commit();
        }

        public void Rollback()
        {
            _transaction?.Rollback();
        }

        public void Dispose()
        {
            if (_connection.State == ConnectionState.Open)
            {
                _connection?.Close();
            }

            _transaction = null;
            _connection = null;
        }
    }
}