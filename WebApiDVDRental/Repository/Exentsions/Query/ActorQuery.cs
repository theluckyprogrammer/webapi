using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions.Query
{
    public static class ActorQuery
    {
        public static Actor GetActorById(this DVDRentalContext context, int id)
        {
            return context.Actors.SingleOrDefault(actor => actor.actor_id == id);            
        }  
      
    }
}
