using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Models
{
    [Table("Users")]
    public class User
    {
        [Key]
        public int Id { get; set; }
        public string Number_Document { get; set; }
        public string Name { get; set; }
        public DateTime Birth_date { get; set; }
        public string Cell_phone { get; set; }
        public string Email { get; set; }
        public string Department { get; set; }
        public string municipality { get; set; }
        public string neighborhood { get; set; }
        public string Residence_Adress { get; set; }
        public string Residence_Telephone { get; set; }
        public string Question_Secret { get; set; }
        public string Answer_Secret { get; set; }
        public string Password { get; set; }
        public string Confirm_Password { get; set; }


    }
}
