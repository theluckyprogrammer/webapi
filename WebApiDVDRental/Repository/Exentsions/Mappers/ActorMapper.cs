using Model = DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Table = DatabaseClient.TableEntity;

 

namespace DatabaseClient.Exentsions.Mappers
{
    public static class ActorMapper
    {
        /// <summary>
        /// Map only basic info available in table model
        /// </summary>
        /// <param name="actor"></param>
        /// <returns></returns>
        public static Model.Actor Map(this Table.Actor actor, 
            Table.Category mostPlayedCategory, IEnumerable<Table.Film> longestFilms, int filmCount)
        {
            return new Model.Actor { 
            Id = actor.actor_id,
            FirstName = actor.first_name,
            LastName = actor.last_name,
            MostPLayedFilmCategory = mostPlayedCategory.Map(),
            FilmCount = filmCount,
            ThreeLongestFilms = longestFilms.Map()
            };
        }
    }
}
