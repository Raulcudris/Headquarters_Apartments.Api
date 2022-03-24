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
    public class Liquidacion_Tarifa_ExtraController : ControllerBase
    {
        private readonly AppDbContext _context;
        public Liquidacion_Tarifa_ExtraController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Liquidacion_Tarifa_Extra
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Liquidacion_Tarifa_Extra>>> GetLiquidacion_Tarifa_Extras()
        {
            return await _context.Liquidacion_Tarifa_Extras.ToListAsync();
        }

        // GET: api/Liquidacion_Tarifa_Extra
        [HttpGet("{id}")]
        public async Task<ActionResult<Liquidacion_Tarifa_Extra>> GetLiquidacion_Tarifa_Extras(string id)
        {
            var liquidacion_Tarifa_Extra = await _context.Liquidacion_Tarifa_Extras.FindAsync(id);

            if (liquidacion_Tarifa_Extra == null)
            {
                return NotFound();
            }

            return liquidacion_Tarifa_Extra;
        }

        // PUT: api/Liquidacion_Tarifa_Extra/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutLiquidacion_Tarifa_Extras(string id, Liquidacion_Tarifa_Extra liquidacion_Tarifa_Extra)
        {
            if (id != liquidacion_Tarifa_Extra.Id_LTE)
            {
                return BadRequest();
            }

            _context.Entry(liquidacion_Tarifa_Extra).State = EntityState.Modified;

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
            return _context.Liquidacion_Tarifa_Extras.Any(e => e.Id_LTE == id);
        }

        // POST: api/Liquidacion_Tarifa_Extra
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Liquidacion_Tarifa_Extra>> PostLiquidacion_Tarifa_Extras(Liquidacion_Tarifa_Extra liquidacion_Tarifa_Extra)
        {
            _context.Liquidacion_Tarifa_Extras.Add(liquidacion_Tarifa_Extra);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetLiquidacion_Tarifa_Extras", new { id = liquidacion_Tarifa_Extra.Id_LTE }, liquidacion_Tarifa_Extra);
        }

        // DELETE: api/Liquidacion_Tarifa_Extra/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Liquidacion_Tarifa_Extra>> DeleteLiquidacion_Tarifa_Extras(string id)
        {
            var liquidacion_tarifa_extra = await _context.Liquidacion_Tarifa_Extras.FindAsync(id);
            if (liquidacion_tarifa_extra == null)
            {
                return NotFound();
            }

            _context.Liquidacion_Tarifa_Extras.Remove(liquidacion_tarifa_extra);
            await _context.SaveChangesAsync();

            return liquidacion_tarifa_extra;
        }

    }
}
