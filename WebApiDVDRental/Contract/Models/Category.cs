using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DVDRental.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public DateTime lastUpdate { get; set; }
        public int FilmCount { get; set; }       
    }
}