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
    public class PurchaseOrdersController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/PurchaseOrders
        public IQueryable<VPurchaseOrders> GetPurchaseOrders()
        {
            return db.VPurchaseOrders;
        }

        // GET: api/PurchaseOrders/5
        [ResponseType(typeof(PurchaseOrders))]
        public IHttpActionResult GetPurchaseOrders(int id)
        {
            PurchaseOrderEdit purchaseOrderEdit = new PurchaseOrderEdit();
            PurchaseOrders purchaseOrders = db.PurchaseOrders.Find(id);
            if (purchaseOrders == null)
            {
                return NotFound();
            }
            Suppliers supplier = db.Suppliers.Find(purchaseOrders.SupplierId);
            purchaseOrderEdit = purchaseOrders as PurchaseOrderEdit;
            //purchaseOrderEdit.Supplier = supplier.Name;
            return Ok(purchaseOrders);
        } 

        // PUT: api/PurchaseOrders/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPurchaseOrders(int id, PurchaseOrders purchaseOrders)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != purchaseOrders.PurchaseOrderId)
            {
                return BadRequest();
            }

            db.Entry(purchaseOrders).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PurchaseOrdersExists(id))
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

        // POST: api/PurchaseOrders
        [ResponseType(typeof(PurchaseOrders))]
        public IHttpActionResult PostPurchaseOrders(PurchaseOrders purchaseOrders)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.PurchaseOrders.Add(purchaseOrders);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = purchaseOrders.PurchaseOrderId }, purchaseOrders);
        }

        // DELETE: api/PurchaseOrders/5
        [ResponseType(typeof(PurchaseOrders))]
        public IHttpActionResult DeletePurchaseOrders(int id)
        {
            PurchaseOrders purchaseOrders = db.PurchaseOrders.Find(id);
            if (purchaseOrders == null)
            {
                return NotFound();
            }

            db.PurchaseOrders.Remove(purchaseOrders);
            db.SaveChanges();

            return Ok(purchaseOrders);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PurchaseOrdersExists(int id)
        {
            return db.PurchaseOrders.Count(e => e.PurchaseOrderId == id) > 0;
        }
    }
}