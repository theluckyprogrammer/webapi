using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.TableEntity
{
  
    public class FilmToCategory
    {
        public int category_id { get; set; }
        public int film_id { get; set; }

        [Timestamp]
        public byte?[] last_update { get; set; }
    }
}
