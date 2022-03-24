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
    public class ServiciosController : ControllerBase
    {
        private readonly AppDbContext _context;
        public ServiciosController(AppDbContext context)
        {
            _context = context;
        }
        // GET: api/Servicios
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Servicios>>> GetServicios()
        {
            return await _context.Servicios.ToListAsync();
        }

        // GET: api/Servicios/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Servicios>> GetServicios(string id)
        {
            var Servicios = await _context.Servicios.FindAsync(id);

            if (Servicios == null)
            {
                return NotFound();
            }

            return Servicios;
        }

        // PUT: api/Servicios/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutServicios(string id, Servicios servicios)
        {
            if (id != servicios.Id_OTS)
            {
                return BadRequest();
            }

            _context.Entry(servicios).State = EntityState.Modified;

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
            return _context.Servicios.Any(e => e.Id_OTS == id);
        }


        // POST: api/Servicios
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Servicios>> PostServicios(Servicios servicios)
        {
            _context.Servicios.Add(servicios);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetServicios", new { id = servicios.Id_OTS }, servicios);
        }

        // DELETE: api/Servicios/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Servicios>> DeleteServicios(string id)
        {
            var servicios = await _context.Servicios.FindAsync(id);
            if (servicios == null)
            {
                return NotFound();
            }

            _context.Servicios.Remove(servicios);
            await _context.SaveChangesAsync();

            return servicios;
        }


    }
}
