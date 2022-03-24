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
    public class AlojamientosController : ControllerBase
    {
        private readonly AppDbContext _context;
        public AlojamientosController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Alojamientos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Alojamiento>>> GetAlojamientos()
        {
            return await _context.Alojamientos.ToListAsync();
        }

        // GET: api/Alojamientos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Alojamiento>> GetAlojamientos(string id)
        {
            var Alojamiento = await _context.Alojamientos.FindAsync(id);

            if (Alojamiento == null)
            {
                return NotFound();
            }

            return Alojamiento;
        }

        // PUT: api/Alojamientos/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAlojamientos(string id, Alojamiento alojamiento)
        {
            if (id != alojamiento.Id_Alo)
            {
                return BadRequest();
            }

            _context.Entry(alojamiento).State = EntityState.Modified;

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
            return _context.Alojamientos.Any(e => e.Id_Alo == id);
        }

        // POST: api/Alojamientos
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Alojamiento>>PostAlojamientos(Alojamiento alojamiento)
        {
            _context.Alojamientos.Add(alojamiento);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAlojamientos", new { id = alojamiento.Id_Alo }, alojamiento);
        }

        // DELETE: api/Alojamientos/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Alojamiento>> DeleteAlojamientos(string id)
        {
            var alojamiento = await _context.Alojamientos.FindAsync(id);
            if (alojamiento == null)
            {
                return NotFound();
            }

            _context.Alojamientos.Remove(alojamiento);
            await _context.SaveChangesAsync();

            return alojamiento;
        }



    }
}
