using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DVDRental.Models
{
    public class Actor
    {        
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int FilmCount { get; set; }

        public Category MostPLayedFilmCategory { get; set; }
        public IEnumerable<Film> ThreeLongestFilms { get; set; }
    }
}