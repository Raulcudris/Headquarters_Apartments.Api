using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Estado_Habitacion")]
    public class Estado_Habitacion
    {
        [Key]
        public string Id_Estado { get; set; }
        public string Descripcion { get; set; }
    }
}
