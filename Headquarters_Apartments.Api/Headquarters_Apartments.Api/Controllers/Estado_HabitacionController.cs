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
    public class Estado_HabitacionController : ControllerBase
    {
        private readonly AppDbContext _context;

        public Estado_HabitacionController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Estado_Habitacion
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Estado_Habitacion>>> GetEstado_Habitacion()
        {
            return await _context.Estado_Habitacion.ToListAsync();
        }

        // GET: api/Estado_Habitacion/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Estado_Habitacion>> GetEstado_Habitacion(string id)
        {
            var Estado_Habitacion = await _context.Estado_Habitacion.FindAsync(id);

            if (Estado_Habitacion == null)
            {
                return NotFound();
            }

            return Estado_Habitacion;
        }

        // PUT: api/Estado_Habitacion/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstado_Habitacion(string id, Estado_Habitacion estado_habitacion)
        {
            if (id != estado_habitacion.Id_Estado)
            {
                return BadRequest();
            }

            _context.Entry(estado_habitacion).State = EntityState.Modified;

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
            return _context.Estado_Habitacion.Any(e => e.Id_Estado == id);
        }

        // POST: api/Estado_Habitacion
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Estado_Habitacion>> PostEstado_Habitacion(Estado_Habitacion estado_habitacion)
        {
            _context.Estado_Habitacion.Add(estado_habitacion);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEstado_Habitacion", new { id = estado_habitacion.Id_Estado }, estado_habitacion);
        }

        // DELETE: api/Estado_Habitacion/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Estado_Habitacion>> DeleteEstado_Habitacion(string id)
        {
            var Estado_Habitacion = await _context.Estado_Habitacion.FindAsync(id);
            if (Estado_Habitacion == null)
            {
                return NotFound();
            }

            _context.Estado_Habitacion.Remove(Estado_Habitacion);
            await _context.SaveChangesAsync();

            return Estado_Habitacion;
        }





    }
}
