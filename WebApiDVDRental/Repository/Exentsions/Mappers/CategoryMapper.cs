using Model = DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Table = DatabaseClient.TableEntity;

namespace DatabaseClient.Exentsions.Mappers
{
    public static class CategoryMapper
    {
        public static Model.Category Map(this Table.Category category, int filmCount = 0)
        {
            var domainCategory = new Model.Category
            {
                CategoryId = category.category_id,
                FilmCount = filmCount,
                Name = category.name,
                lastUpdate = category.last_update
            };

            return domainCategory;
        }

        public static Table.Category Map(this Model.Category category)
        {
            var tableCategory = new Table.Category
            {
                name = category.Name
            };

            return tableCategory;
        }

        public static IEnumerable<Model.Category> Map(this IEnumerable<Table.Category> categories, int filmCount = 0)
        {
            return categories.Select(category => {return category.Map(filmCount);});
        }

        public static IEnumerable<Table.Category> Map(this IEnumerable<Model.Category> categories, int filmCount = 0)
        {
            return categories.Select(category => { return category.Map(); });
        }
    }
}
