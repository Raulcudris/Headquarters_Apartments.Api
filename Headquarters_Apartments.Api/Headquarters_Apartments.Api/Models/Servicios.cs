using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Otros_Servicios")]
    public class Servicios
    {
        [Key]
        public string Id_OTS { get; set; }
        public string Descripcion { get; set; }
        public double Valor { get; set; }
   
    }
}
