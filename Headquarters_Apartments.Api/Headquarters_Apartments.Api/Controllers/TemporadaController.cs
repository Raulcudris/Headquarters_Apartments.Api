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
    public class TemporadaController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TemporadaController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Temporada
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Temporada>>> GetTemporadas()
        {
            return await _context.Temporadas.ToListAsync();
        }

        // GET: api/Temporada/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Temporada>> GetTemporada(string id)
        {
            var Temporada = await _context.Temporadas.FindAsync(id);

            if (Temporada == null)
            {
                return NotFound();
            }

            return Temporada;
        }

        // PUT: api/Temporada/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTemporada(string id, Temporada temp)
        {
            if (id != temp.Id_Temporada)
            {
                return BadRequest();
            }

            _context.Entry(temp).State = EntityState.Modified;

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
            return _context.Temporadas.Any(e => e.Id_Temporada == id);
        }

        // POST: api/Users
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<User>> PostUsers(Temporada temp)
        {
            _context.Temporadas.Add(temp);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTemporada", new { id = temp.Id_Temporada }, temp);
        }


        // DELETE: api/Temporada/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Temporada>> DeleteTemporada(string  id)
        {
            var temp = await _context.Temporadas.FindAsync(id);
            if (temp == null)
            {
                return NotFound();
            }

            _context.Temporadas.Remove(temp);
            await _context.SaveChangesAsync();

            return temp;
        }



    }
}
