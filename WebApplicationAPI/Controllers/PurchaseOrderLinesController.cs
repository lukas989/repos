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
    public class PurchaseOrderLinesController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/PurchaseOrderLines
        public IHttpActionResult GetPurchaseOrderLines(int purchaseOrderId)
        {
            var purchaseOrderLines = db.VPurchaseOrderLines.Where(x => x.PurchaseOrderId == purchaseOrderId);
            return Ok(purchaseOrderLines);
        }

        // GET: api/PurchaseOrderLines
        public IHttpActionResult GetPurchaseOrderLinesBySupplier(int supplierId)
        {
            var purchaseOrderLines = db.VPurchaseOrderLines.Where(x => x.SupplierId == supplierId);
            return Ok(purchaseOrderLines);
        }

        // GET: api/PurchaseOrderLines/5
        [ResponseType(typeof(PurchaseOrderLines))]
        public IHttpActionResult GetPurchaseOrderLines(int purchaseOrderId, int purchaseOrderLineNo)
        {
            PurchaseOrderLines purchaseOrderLine = db.PurchaseOrderLines.Find(purchaseOrderId, purchaseOrderLineNo);
            if (purchaseOrderLine == null)
            {
                return NotFound();
            }

            return Ok(purchaseOrderLine);
        }

        // PUT: api/PurchaseOrderLines/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPurchaseOrderLines(PurchaseOrderLines purchaseOrderLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Entry(purchaseOrderLines).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                    throw;
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/PurchaseOrderLines
        [ResponseType(typeof(PurchaseOrderLines))]
        public IHttpActionResult PostPurchaseOrderLines(PurchaseOrderLines purchaseOrderLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            purchaseOrderLines.PurchaseOrderLineNo = setMaxPurchaseOrderLineNo(purchaseOrderLines.PurchaseOrderId);
            db.PurchaseOrderLines.Add(purchaseOrderLines);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (PurchaseOrderLinesExists(purchaseOrderLines.PurchaseOrderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = purchaseOrderLines.PurchaseOrderId }, purchaseOrderLines);
        }

        private int setMaxPurchaseOrderLineNo(int purchaseOrderId)
        {
            int nextPurchaseOrderLineNo = 1;
            var purchaseOrderLines = db.PurchaseOrderLines.Where(x => x.PurchaseOrderId == purchaseOrderId);
            if (purchaseOrderLines.Count() > 0)
            {
                int maxPurchaseOrderLineNo = db.PurchaseOrderLines.Where(x => x.PurchaseOrderId == purchaseOrderId).Max(p => p.PurchaseOrderLineNo);
                nextPurchaseOrderLineNo = maxPurchaseOrderLineNo + 1;

            }
            return nextPurchaseOrderLineNo;
        }

        // DELETE: api/PurchaseOrderLines/5
        [ResponseType(typeof(PurchaseOrderLines))]
        public IHttpActionResult DeletePurchaseOrderLines(int purchaseOrderId, int purchaseOrderLineNo)
        {
            PurchaseOrderLines purchaseOrderLines = db.PurchaseOrderLines.Find(purchaseOrderId, purchaseOrderLineNo);
            if (purchaseOrderLines == null)
            {
                return NotFound();
            }

            db.PurchaseOrderLines.Remove(purchaseOrderLines);
            db.SaveChanges();

            return Ok(purchaseOrderLines);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PurchaseOrderLinesExists(int id)
        {
            return db.PurchaseOrderLines.Count(e => e.PurchaseOrderId == id) > 0;
        }
    }
}