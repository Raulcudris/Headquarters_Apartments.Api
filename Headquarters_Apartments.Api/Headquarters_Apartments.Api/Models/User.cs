using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Usuario")]
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string Numero_Documento { get; set; }
        public string Nombre { get; set; }
        public DateTime Fecha_Nacimiento { get; set; }
        public string Celular { get; set; }
        public string Correo_Electronico { get; set; }
        public string Departamento { get; set; }
        public string Municipio { get; set; }
        public string Barrio { get; set; }
        public string Direccion { get; set; }
        public string Telefono_Fijo { get; set; }
        public string Clave { get; set; }
        public string Confirmar_Clave { get; set; }       


    }
}
