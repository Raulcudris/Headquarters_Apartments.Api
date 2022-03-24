using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Sedes")]
    public class Sede
    {
        [Key]
        public string Id_Sede { get; set; }
        public string Nombre { get; set; }
        public string Tipo { get; set; }
        public string Ubicación { get; set; }
        public int Capacidad { get; set; }
    }
}
