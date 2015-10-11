using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient
{
    public class DbContextTransactionAdapter : ITransaction
    {
        protected DbContextTransaction underlyingDbContextTransaction;

        public DbContextTransactionAdapter(DbContextTransaction transaction)
        {
            underlyingDbContextTransaction = transaction;
        }

        public void Commit()
        {
            underlyingDbContextTransaction.Commit();
        }

        public void Rollback()
        {
            underlyingDbContextTransaction.Rollback();
        }

        public void Dispose()
        {
            underlyingDbContextTransaction.Dispose();
        }
    }
}
