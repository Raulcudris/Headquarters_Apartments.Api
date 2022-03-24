using Headquarters_Apartments.Api.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> Options) : base(Options)
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Temporada> Temporadas { get; set; }
        public DbSet<Sede>Sedes { get; set; }
        public DbSet<Tipos_Alojamientos> Tipos_Alojamientos { get; set; }
        public DbSet<Servicios> Servicios { get; set; }
        public DbSet<Estado_Habitacion> Estado_Habitacion { get; set; }
        public DbSet<Alojamiento>Alojamientos { get; set; }
        public DbSet<Liquidacion_Tarifa_Extra> Liquidacion_Tarifa_Extras { get; set; }
        public DbSet<Liquidacion_Tarifa_Ordinaria> liquidacion_Tarifa_Ordinarias { get; set; }
        public DbSet<Reserva>Reservas { get; set; }


    }
}
