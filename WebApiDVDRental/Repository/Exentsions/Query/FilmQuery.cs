using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions.Query
{
    public static class FilmQuery
    {
        public static IQueryable<Film> GetFilmsByActor(this DVDRentalContext context, int actorId)
        {
            var filmIds = context.GetFilmToActor(actorId).Select(relation => { return relation.film_id; });
            return context.Films.Where(film => filmIds.Contains(film.film_id));
        }

        public static int GetFilmCountForActor(this DVDRentalContext context, int actorId)
        {
            return context.GetFilmToActor(actorId).Count();
        }

        public static IQueryable<Film> GetThreeLongestFilmsByActor(this DVDRentalContext context, int actorId)
        {
           return context.GetFilmsByActor(actorId).OrderByDescending(film => film.length).Take(3);
        }
    }
}
