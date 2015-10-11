using DVDRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contract.DatabaseContext
{
    public interface IFilmContext : IDisposable
    {
        Film GetFilmById(int filmId);
        void AddFilm(Film film);
        void UpdateFilm(Film film);
        void AddCategoryToFilm(int filmId, int categoryId);
        void DeleteFilm(int filmId);
    }
}
