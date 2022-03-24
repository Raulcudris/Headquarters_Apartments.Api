using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Tipo_Alojamiento")]
    public class Tipos_Alojamientos
    {
        [Key]
        public string Id_TA { get; set; }
        public string Descripcion { get; set; }
    }
}
