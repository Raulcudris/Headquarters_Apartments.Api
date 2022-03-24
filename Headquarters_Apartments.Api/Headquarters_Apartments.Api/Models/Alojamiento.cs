using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Alojamiento")]
    public class Alojamiento
    {
        [Key]
        public string Id_Alo { get; set; }
        public string Id_Sede  { get; set; }
        public string Tipo_Alojamiento { get; set; }
        public string Descripcion { get; set; }
        public string Numeracion { get; set; }
        public int Numero_Habitacion { get; set; }
        public int Capacidad { get; set; }
        public string Id_LTO { get; set; }
        public string Id_LTE { get; set; }
        public string Estado { get; set; }
        public string Servicios { get; set; }
    }
}
