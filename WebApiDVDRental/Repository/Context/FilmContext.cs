using Contract.DatabaseContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model = DVDRental.Models;
using DatabaseClient.Exentsions.Mappers;
using DVDRental.Repository;
using DatabaseClient.Exentsions.Query;

namespace DatabaseClient.Repositories
{
    public class FilmContext : Context, IFilmContext
    {
        public FilmContext(DVDRentalContext context = null) : base(context) { }

        public void AddCategoryToFilm(int filmId, int categoryId)
        {
            using (var transaction = context.BeginTransaction())
            {
                try
                {
                    context.ExecuteSqlCommand(false,
                        "insert into film_category(film_id, category_id) VALUES ({0},{1})",
                        filmId.ToString(),
                        categoryId.ToString());

                    context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                }
            }
        }

        public void AddFilm(Model.Film film)
        {
            context.Films.Add(film.Map());
            context.SaveChanges();
        }

        public void DeleteFilm(int filmId)
        {
            using (var transaction = context.BeginTransaction())
            {
                try
                {
                    context.
                    ExecuteSqlCommand(false, "delete from film_category where film_id = {0}", filmId.ToString());
                    context.
                    ExecuteSqlCommand(false, "delete from film_actor where film_id = {0}", filmId.ToString());
                    context.Films.Remove(context.Films.Find(filmId));
                    context.SaveChanges();
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                }
            }
        }

        public Model.Film GetFilmById(int filmId)
        {
            var result = context.Films.FirstOrDefault(DbFilm => DbFilm.film_id == filmId);

            if (result == null)
                return default(Model.Film);

            Model.Film film = result.Map();

            List<int> categoriesOfFilm =
                context.GetCategoryOfFilm(filmId)
                .Select(ctf => { return ctf.category_id; }).ToList();

            film.Categories =
                context.Categorys
                .Where(category => categoriesOfFilm.Contains(category.category_id)).Map();

            return film;
        }

        public void UpdateFilm(Model.Film film)
        {
            var tableFilm =
                context.Films
                .Where(dbFilm => dbFilm.title.Equals(film.Title)).FirstOrDefault();

            if (tableFilm == null)
                return;

            tableFilm.length = film.Length != 0 ? film.Length : tableFilm.length;
            tableFilm.release_year = film.ReleaseYear != 0 ? film.ReleaseYear : tableFilm.release_year;          
            tableFilm.description = !string.IsNullOrEmpty(film.Description) ? film.Description : tableFilm.description;
            context.SaveChanges();
        }
    }
}
