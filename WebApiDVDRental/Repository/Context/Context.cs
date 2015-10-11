using DVDRental.Models;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Repositories
{
    public partial class Context
    {
        protected DVDRentalContext context;

        public Context(DVDRentalContext context = null)
        {
            this.context = context ?? new DVDRentalContext();
        }

        public void Dispose()
        {            
            context.Dispose();
        }    
    }
}
