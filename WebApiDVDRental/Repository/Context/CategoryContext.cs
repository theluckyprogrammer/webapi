using Contract.DatabaseContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model = DVDRental.Models;
using DatabaseClient.Exentsions.Mappers;

namespace DatabaseClient.Repositories
{
    public class CategoryContext : Context, ICategoryContext
    {
        public void AddCategory(Model.Category category)
        {
            context.Categorys.Add(category.Map());
        }

        public void DeleteCategory(int categoryId)
        {
            context.Categorys.Remove(context.Categorys.Find(categoryId));
        }
              
        public Model.Category GetCategoryById(int categoryId)
        {
            return context.Categorys.Find(context.Categorys.Find(categoryId)).Map();
        }

        public void UpdateCategory(Model.Category category, int categoryId)
        {
            var tableCategory = context.Categorys.Find(categoryId);
            tableCategory.name = category.Name;
            tableCategory.category_id = category.CategoryId;
            context.SaveChanges();
        }
    }
}
