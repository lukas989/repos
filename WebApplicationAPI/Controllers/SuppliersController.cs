using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApplicationAPI.Models;

namespace WebApplicationAPI.Controllers
{
    public class SuppliersController : ApiController
    {
        private WmsIntegration_v2Entities1 db = new WmsIntegration_v2Entities1();

        // GET: api/Suppliers
        public IQueryable<Suppliers> GetSuppliers()
        {
            return db.Suppliers;
        }

        // GET: api/Suppliers/5
        [ResponseType(typeof(Suppliers))]
        public IHttpActionResult GetSuppliers(int id)
        {
            Suppliers suppliers = db.Suppliers.Find(id);
            if (suppliers == null)
            {
                return NotFound();
            }

            return Ok(suppliers);
        }

        // PUT: api/Suppliers/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSuppliers(int id, Suppliers suppliers)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != suppliers.SupplierId)
            {
                return BadRequest();
            }

            db.Entry(suppliers).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SuppliersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Suppliers
        [ResponseType(typeof(Suppliers))]
        public IHttpActionResult PostSuppliers(Suppliers suppliers)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Suppliers.Add(suppliers);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = suppliers.SupplierId }, suppliers);
        }

        // DELETE: api/Suppliers/5
        [ResponseType(typeof(Suppliers))]
        public IHttpActionResult DeleteSuppliers(int id)
        {
            Suppliers suppliers = db.Suppliers.Find(id);
            if (suppliers == null)
            {
                return NotFound();
            }

            db.Suppliers.Remove(suppliers);
            db.SaveChanges();

            return Ok(suppliers);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SuppliersExists(int id)
        {
            return db.Suppliers.Count(e => e.SupplierId == id) > 0;
        }
    }
}