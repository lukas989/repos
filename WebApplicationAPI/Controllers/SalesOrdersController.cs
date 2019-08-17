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
using Models;

namespace WebApplicationAPI.Controllers
{
    public class SalesOrdersController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/SalesOrders
        public IQueryable<VSalesOrders> GetSalesOrders()
        {
            return db.VSalesOrders;
        }

        // GET: api/SalesOrders/5
        [ResponseType(typeof(SalesOrders))]
        public IHttpActionResult GetSalesOrders(int id)
        {
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            if (salesOrders == null)
            {
                return NotFound();
            }

            return Ok(salesOrders);
        }

        // PUT: api/SalesOrders/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSalesOrders(int id, SalesOrders salesOrders)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != salesOrders.SalesOrderId)
            {
                return BadRequest();
            }

            db.Entry(salesOrders).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SalesOrdersExists(id))
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

        // POST: api/SalesOrders
        [ResponseType(typeof(SalesOrders))]
        public IHttpActionResult PostSalesOrders(SalesOrders salesOrders)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SalesOrders.Add(salesOrders);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = salesOrders.SalesOrderId }, salesOrders);
        }

        // DELETE: api/SalesOrders/5
        [ResponseType(typeof(SalesOrders))]
        public IHttpActionResult DeleteSalesOrders(int id)
        {
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            if (salesOrders == null)
            {
                return NotFound();
            }

            db.SalesOrders.Remove(salesOrders);
            db.SaveChanges();

            return Ok(salesOrders);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SalesOrdersExists(int id)
        {
            return db.SalesOrders.Count(e => e.SalesOrderId == id) > 0;
        }
    }
}