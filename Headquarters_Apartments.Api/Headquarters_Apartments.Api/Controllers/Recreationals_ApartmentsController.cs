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
    public class Recreationals_ApartmentsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public Recreationals_ApartmentsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Recreationals_Apartments
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Recreational_Apartment>>> GetRecreationals_Apartments()
        {
            return await _context.Recreational_Apartments.ToListAsync();
        }

        // GET: api/Recreationals_Apartments/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Recreational_Apartment>> GetRecreational_Apartment(int id)
        {
            var Recreational_Apartments = await _context.Recreational_Apartments.FindAsync(id);

            if (Recreational_Apartments == null)
            {
                return NotFound();
            }

            return Recreational_Apartments;
        }

        // PUT: api/Recreationals_Apartments/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRecreationals_Apartments(int id, Recreational_Apartment recreationals_apartments)
        {
            if (id != recreationals_apartments.Id)
            {
                return BadRequest();
            }

            _context.Entry(recreationals_apartments).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Recreationals_ApartmentsExists(id))
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

        // POST: api/Recreationals_Apartments   
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Recreational_Apartment>> PostRecreationals_Apartments(Recreational_Apartment recreationals_apartments)
        {
            _context.Recreational_Apartments.Add(recreationals_apartments);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetRecreationals_Apartments", new { id = recreationals_apartments.Id }, recreationals_apartments);
        }

        // DELETE: api/Recreationals_Apartments/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Recreational_Apartment>> DeleteRecreationals_Apartments(int id)
        {
            var recreationals_apartments = await _context.Recreational_Apartments.FindAsync(id);
            if (recreationals_apartments == null)
            {
                return NotFound();
            }

            _context.Recreational_Apartments.Remove(recreationals_apartments);
            await _context.SaveChangesAsync();

            return recreationals_apartments;
        }

        private bool Recreationals_ApartmentsExists(int id)
        {
            return _context.Recreational_Apartments.Any(e => e.Id == id);
        }


    }
}
