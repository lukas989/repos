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
    public class ReceiptPlansController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/ReceiptPlans
        public IQueryable<VReceiptPlans> GetReceiptPlans()
        {
            return db.VReceiptPlans;
        }

        // GET: api/ReceiptPlans/5
        [ResponseType(typeof(ReceiptPlans))]
        public IHttpActionResult GetReceiptPlans(int id)
        {
            ReceiptPlans receiptPlans = db.ReceiptPlans.Find(id);
            if (receiptPlans == null)
            {
                return NotFound();
            }

            return Ok(receiptPlans);
        }

        // PUT: api/ReceiptPlans/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutReceiptPlans(int id, ReceiptPlans receiptPlans)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != receiptPlans.ReceiptPlanId)
            {
                return BadRequest();
            }

            db.Entry(receiptPlans).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReceiptPlansExists(id))
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

        // POST: api/ReceiptPlans
        [ResponseType(typeof(ReceiptPlans))]
        public IHttpActionResult PostReceiptPlans(ReceiptPlans receiptPlans)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ReceiptPlans.Add(receiptPlans);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = receiptPlans.ReceiptPlanId }, receiptPlans);
        }

        // DELETE: api/ReceiptPlans/5
        [ResponseType(typeof(ReceiptPlans))]
        public IHttpActionResult DeleteReceiptPlans(int id)
        {
            ReceiptPlans receiptPlans = db.ReceiptPlans.Find(id);
            if (receiptPlans == null)
            {
                return NotFound();
            }

            db.ReceiptPlans.Remove(receiptPlans);
            db.SaveChanges();

            return Ok(receiptPlans);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ReceiptPlansExists(int id)
        {
            return db.ReceiptPlans.Count(e => e.ReceiptPlanId == id) > 0;
        }
    }
}