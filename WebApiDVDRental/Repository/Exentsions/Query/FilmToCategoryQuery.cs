using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions.Query
{
    public static class FilmToCategoryQuery
    {       
        public static IEnumerable<FilmToCategory> GetCategoryOfFilm(this DVDRentalContext context, params int[] filmId)
        {
          if (!filmId.Any())
              return new List<FilmToCategory>();

          string parameter = string.Join(",", filmId);
          return context.FillEntity<FilmToCategory>(string.Format("select * from film_category where film_id IN ({0})", parameter));
        }
    }
}
