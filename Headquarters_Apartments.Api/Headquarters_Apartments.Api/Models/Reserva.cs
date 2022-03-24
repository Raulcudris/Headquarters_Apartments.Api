using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Reserva")]
    public class Reserva
    {
        [Key]
        public string  Id_Reserva { get; set; }
        public string Id_Sede { get; set; }
        public DateTime Fecha_Inicial { get; set; }
        public DateTime Fecha_Final { get; set; }
        public int Num_Personas { get; set; }
        public int Num_Habitaciones { get; set; }
        public double Valor_Reserva { get; set; }
        public string Estado_Reserva { get; set; }
    }
}
