using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Temporadas")]
    public class Temporada
    {
        [Key]
        public string Id_Temporada { get; set; }
        public DateTime Fecha_Inicial { get; set; }
        public DateTime Fecha_Final { get; set; }
        public string Tipo_Temporada { get; set; }

    }
}
