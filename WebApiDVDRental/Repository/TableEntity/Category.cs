using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseClient.TableEntity
{
    [Table("category")]
    public class Category
    {
        [Key]
        public int category_id { get; set; }
        public string name { get; set; }
       
        public DateTime last_update { get; set; }
    }
}
