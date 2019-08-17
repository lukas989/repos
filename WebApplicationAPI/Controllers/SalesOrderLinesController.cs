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
    public class SalesOrderLinesController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/SalesOrderLines
        public IQueryable<SalesOrderLines> GetSalesOrderLines()
        {
            return db.SalesOrderLines;
        }

        // GET: api/SalesOrderLines
        public IHttpActionResult GetSalesOrderLinesBySalesOrderId(int salesOrderId)
        {
            var vSalesOrderLines = db.VSalesOrderLines.Where(x => x.SalesOrderId == salesOrderId);
            return Ok(vSalesOrderLines);
        }


        // GET: api/SalesOrderLines/5
        [ResponseType(typeof(SalesOrderLines))]
        public IHttpActionResult GetSalesOrderLines(int id)
        {
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            if (salesOrderLines == null)
            {
                return NotFound();
            }

            return Ok(salesOrderLines);
        }

        // PUT: api/SalesOrderLines/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSalesOrderLines(int id, SalesOrderLines salesOrderLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != salesOrderLines.SalesOrderId)
            {
                return BadRequest();
            }

            db.Entry(salesOrderLines).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SalesOrderLinesExists(id))
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

        // POST: api/SalesOrderLines
        [ResponseType(typeof(SalesOrderLines))]
        public IHttpActionResult PostSalesOrderLines(SalesOrderLines salesOrderLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SalesOrderLines.Add(salesOrderLines);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SalesOrderLinesExists(salesOrderLines.SalesOrderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = salesOrderLines.SalesOrderId }, salesOrderLines);
        }

        // DELETE: api/SalesOrderLines/5
        [ResponseType(typeof(SalesOrderLines))]
        public IHttpActionResult DeleteSalesOrderLines(int id)
        {
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            if (salesOrderLines == null)
            {
                return NotFound();
            }

            db.SalesOrderLines.Remove(salesOrderLines);
            db.SaveChanges();

            return Ok(salesOrderLines);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SalesOrderLinesExists(int id)
        {
            return db.SalesOrderLines.Count(e => e.SalesOrderId == id) > 0;
        }
    }
}