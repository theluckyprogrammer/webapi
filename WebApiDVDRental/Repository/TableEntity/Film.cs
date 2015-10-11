using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.TableEntity
{
    [Table("film")]
    public class Film
    {
        [Key]
        public int film_id { get; set; }

        public string title { get; set; }
        public string description { get; set; }
        public int release_year { get; set; }
        public int length { get; set; }      
    }
}
