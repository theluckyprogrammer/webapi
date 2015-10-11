using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions.Query
{
    public static class FilmToActorQuery
    {
        public static IEnumerable<FilmToActor> GetFilmToActor(this DVDRentalContext context, int actorId)
        {
            return context.FillEntity<FilmToActor>(string.Format("select * from film_actor where actor_id = {0}", actorId));
        }
    }
}
