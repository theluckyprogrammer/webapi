using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DatabaseClient.TableEntity
{
    [Table("actor")]
    public class Actor
    {
        [Key]
        public int actor_id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }

        
        public DateTime last_update { get; set; }
    }
}
