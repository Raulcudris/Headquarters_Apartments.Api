using Headquarters_Apartments.Api.Context;
using Headquarters_Apartments.Api.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Headquarters_Apartments.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Tipo_AlojamientoController : ControllerBase
    {
        private readonly AppDbContext _context;
        public Tipo_AlojamientoController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Tipo_Alojamiento
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Tipos_Alojamientos>>> GetTipo_Alojamiento()
        {
            return await _context.Tipos_Alojamientos.ToListAsync();
        }

        // GET: api/Tipo_Alojamiento/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Tipos_Alojamientos>> GetTipo_Alojamiento(string id)
        {
            var Alojamiento = await _context.Tipos_Alojamientos.FindAsync(id);

            if (Alojamiento == null)
            {
                return NotFound();
            }

            return Alojamiento;
        }


        // PUT: api/Tipo_Alojamiento/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTipo_Alojamiento(string id, Tipos_Alojamientos tipos_alojamientos)
        {
            if (id != tipos_alojamientos.Id_TA)
            {
                return BadRequest();
            }

            _context.Entry(tipos_alojamientos).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UsersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }
        private bool UsersExists(string id)
        {
            return _context.Tipos_Alojamientos.Any(e => e.Id_TA == id);
        }

        // POST: api/Tipo_Alojamiento
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Tipos_Alojamientos>> PostTipo_Alojamiento(Tipos_Alojamientos tipos_Alojamientos)
        {
            _context.Tipos_Alojamientos.Add(tipos_Alojamientos);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTipo_Alojamientos", new { id = tipos_Alojamientos.Id_TA }, tipos_Alojamientos);
        }

        // DELETE: api/Tipo_Alojamiento/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Tipos_Alojamientos>> DeleteTipo_Alojamiento(string id)
        {
            var Alojamiento = await _context.Tipos_Alojamientos.FindAsync(id);
            if (Alojamiento == null)
            {
                return NotFound();
            }

            _context.Tipos_Alojamientos.Remove(Alojamiento);
            await _context.SaveChangesAsync();

            return Alojamiento;
        }

    }
}
