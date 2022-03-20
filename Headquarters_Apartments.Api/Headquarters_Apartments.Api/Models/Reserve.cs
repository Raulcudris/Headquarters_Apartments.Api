using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Reserve")]
    public class Reserve
    {
        [Key]
        public int Id_Reserve { get; set; }
        public int Number_Document { get; set; }
        public DateTime Date_Arrival { get; set; }
        public DateTime Date_Departure { get; set; }
        public int Nigths { get; set; }
        public int Number_People { get; set; }
        public double Services_Laundry { get; set; }
        public int Rooms { get; set; }
        public int Days_Ordinary { get; set; }
        public int Days_Special { get; set; }
        public double Value_Total { get; set; }
        public string Description { get; set; }
    }
}
