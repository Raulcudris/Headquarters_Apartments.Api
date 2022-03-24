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
    public class Liquidacion_Tarifa_OrdinariaController : ControllerBase
    {
        private readonly AppDbContext _context;
        public Liquidacion_Tarifa_OrdinariaController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Liquidacion_Tarifa_Ordinaria
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Liquidacion_Tarifa_Ordinaria>>> GetLiquidacion_Tarifa_Ordinarias()
        {
            return await _context.liquidacion_Tarifa_Ordinarias.ToListAsync();
        }

        // GET: api/Liquidacion_Tarifa_Ordinaria/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Liquidacion_Tarifa_Ordinaria>> GetLiquidacion_Tarifa_Ordinarias(string id)
        {
            var liquidacion_Tarifa_ordinaria = await _context.liquidacion_Tarifa_Ordinarias.FindAsync(id);

            if (liquidacion_Tarifa_ordinaria == null)
            {
                return NotFound();
            }

            return liquidacion_Tarifa_ordinaria;
        }


        // PUT: api/Liquidacion_Tarifa_Ordinaria/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutLiquidacion_Tarifa_Ordinarias(string id, Liquidacion_Tarifa_Ordinaria liquidacion_Tarifa_Ordinaria)
        {
            if (id != liquidacion_Tarifa_Ordinaria.Id_LTO)
            {
                return BadRequest();
            }

            _context.Entry(liquidacion_Tarifa_Ordinaria).State = EntityState.Modified;

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
            return _context.liquidacion_Tarifa_Ordinarias.Any(e => e.Id_LTO == id);
        }

        // POST: api/Liquidacion_Tarifa_Ordinaria
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Liquidacion_Tarifa_Ordinaria>> PostLiquidacion_Tarifa_Ordinaria(Liquidacion_Tarifa_Ordinaria liquidacion_Tarifa_Ordinaria)
        {
            _context.liquidacion_Tarifa_Ordinarias.Add(liquidacion_Tarifa_Ordinaria);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetLiquidacion_Tarifa_Ordinaria", new { id = liquidacion_Tarifa_Ordinaria.Id_LTO }, liquidacion_Tarifa_Ordinaria);
        }

        // DELETE: api/Liquidacion_Tarifa_Ordinaria/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Liquidacion_Tarifa_Ordinaria>> DeleteLiquidacion_Tarifa_Ordinaria(string id)
        {
            var liquidacion_tarifa_ordinaria = await _context.liquidacion_Tarifa_Ordinarias.FindAsync(id);
            if (liquidacion_tarifa_ordinaria == null)
            {
                return NotFound();
            }

            _context.liquidacion_Tarifa_Ordinarias.Remove(liquidacion_tarifa_ordinaria);
            await _context.SaveChangesAsync();

            return liquidacion_tarifa_ordinaria;
        }


    }
}
