using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions
{
    public static class ConvertTransaction
    {
        public static ITransaction ToITransaction(this DbContextTransaction transaction)
        {
            return new DbContextTransactionAdapter(transaction);
        }
    }
}
