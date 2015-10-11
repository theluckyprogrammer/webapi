using DatabaseClient.TableEntity;
using DVDRental.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.Exentsions.Query
{
    public static class CategoryQuery
    {
        public static Category GetMostPlayedActorCategory(this DVDRentalContext context, int actorId)
        {
            var films = context.GetFilmsByActor(actorId);
            var filmIds = films.ToList().Select(film =>
            {
                return film.film_id;
            }).ToArray();

            var filmCategories = context.GetCategoryOfFilm(filmIds);
            var mostPlayedCategory = filmCategories.GroupBy(category =>
                {
                    return category.category_id;
                }).Select(group => new
                    {
                        CategoryId = group.Key,
                        Count = group.Count()
                    }).OrderByDescending(group => group.Count).FirstOrDefault();

            if (mostPlayedCategory != null)
                return GetCategories(context, mostPlayedCategory.CategoryId).SingleOrDefault();
            else
                return default(Category);

        }

        public static IQueryable<Category> GetCategories(this DVDRentalContext context, params int[] ids)
        {
            return context.Categorys.Where(category => ids.Contains(category.category_id));
        }
    }
}
