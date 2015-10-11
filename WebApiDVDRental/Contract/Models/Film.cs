using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DVDRental.Models
{
    public class Film
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public string Title { get; set; }
        public int Length { get; set; }
        public int ReleaseYear { get; set; }

        public IEnumerable<Category> Categories;
        IEnumerable<Actor> actors;
    }
}