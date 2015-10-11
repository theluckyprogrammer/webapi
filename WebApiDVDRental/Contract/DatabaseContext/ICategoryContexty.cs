using DVDRental.Models;
using System;

namespace Contract.DatabaseContext
{
    public interface ICategoryContext :IDisposable
    {
        Category GetCategoryById(int categoryId);
        void AddCategory(Category category);
        void UpdateCategory(Category category, int categoryId);
        void DeleteCategory(int categoryId);
    }
}
