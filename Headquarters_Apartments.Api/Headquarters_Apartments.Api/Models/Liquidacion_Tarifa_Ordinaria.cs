using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Liquidacion_Tarifa_Ordinaria")]
    public class Liquidacion_Tarifa_Ordinaria
    {
        [Key]
        public string Id_LTO { get; set; }
        public string Tipo_Tarifa { get; set; }
        public string Sede { get; set; }
        public string Numeracion { get; set; }
        public string Temporada { get; set; }
        public int Rango_Personas { get; set; }
        public double Valor { get; set; }

    }
}
