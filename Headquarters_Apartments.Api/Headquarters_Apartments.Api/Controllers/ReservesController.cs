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
    public class ReservesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ReservesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Reserves
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reserve>>> GetReserves()
        {
            return await _context.Reserves.ToListAsync();
        }

        // GET: api/Reserves/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Reserve>> GetReserve(int id)
        {
            var reserves = await _context.Reserves.FindAsync(id);

            if (reserves == null)
            {
                return NotFound();
            }

            return reserves;
        }

        // PUT: api/Reserves/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutReserves(int id, Reserve reserves)
        {
            if (id != reserves.Id_Reserve)
            {
                return BadRequest();
            }

            _context.Entry(reserves).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReserveExists(id))
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

        // POST: api/Reserves
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Reserve>> PostReserve(Reserve reserves)
        {
            _context.Reserves.Add(reserves);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetReserves", new { id = reserves.Id_Reserve }, reserves);
        }

        // DELETE: api/Reserve/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Reserve>> DeleteReserve(int id)
        {
            var reserves = await _context.Reserves.FindAsync(id);
            if (reserves == null)
            {
                return NotFound();
            }

            _context.Reserves.Remove(reserves);
            await _context.SaveChangesAsync();

            return reserves;
        }

        private bool ReserveExists(int id)
        {
            return _context.Reserves.Any(e => e.Id_Reserve == id);
        }

    }
}
