using Model = DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Table = DatabaseClient.TableEntity;

namespace DatabaseClient.Exentsions.Mappers
{
    public static class FilmMapper
    {
        public static IEnumerable<Model.Film> Map(this IEnumerable<Table.Film> films)
        {
            return films.Select(film => film.Map());
        }

        public static Model.Film Map(this Table.Film film)
        {
            var modelFilm = new Model.Film()
            {
                Description = film.description,
                Id = film.film_id,
                Length = film.length,
                Title = film.title,
                ReleaseYear = film.release_year
            };
            return modelFilm;
        }

        public static Table.Film Map(this Model.Film film)
        {
            return new Table.Film
            {
                description = film.Description,
                length = film.Length,
                release_year = film.ReleaseYear,
                title = film.Title
            };
        }
    }
}
