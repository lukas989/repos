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
    public class ReceiptPlanLinesController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/ReceiptPlanLines
        public IHttpActionResult GetReceiptPlanLines(int receiptPlanId)
        {
            //return db.VReceiptPlanLines;
            var receiptPlanLines = db.VReceiptPlanLines.Where(x => x.ReceiptPlanId == receiptPlanId);
            return Ok(receiptPlanLines);
        }


        // GET: api/ReceiptPlanLines/5
        [ResponseType(typeof(ReceiptPlanLines))]
        public IHttpActionResult GetReceiptPlanLines(int receiptPlanId, int receiptPlanLineNo)
        {
            ReceiptPlanLines receiptPlanLines = db.ReceiptPlanLines.Find(receiptPlanId, receiptPlanLineNo);
            if (receiptPlanLines == null)
            {
                return NotFound();
            }

            return Ok(receiptPlanLines);
        }

        // PUT: api/ReceiptPlanLines/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutReceiptPlanLines(ReceiptPlanLines receiptPlanLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            
            db.Entry(receiptPlanLines).State = EntityState.Modified;

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

        // POST: api/ReceiptPlanLines
        [ResponseType(typeof(ReceiptPlanLines))]
        public IHttpActionResult PostReceiptPlanLines(ReceiptPlanLines receiptPlanLines)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            receiptPlanLines.ReceiptPlanLineNo = setMaxReceiptPlanLineNo(receiptPlanLines.ReceiptPlanId);

            db.ReceiptPlanLines.Add(receiptPlanLines);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ReceiptPlanLinesExists(receiptPlanLines.ReceiptPlanId, receiptPlanLines.ReceiptPlanLineNo))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = receiptPlanLines.ReceiptPlanId }, receiptPlanLines);
        }

        private int setMaxReceiptPlanLineNo(int receiptPlanId)
        {
            int nextReceiptPlanLineNo = 1;
            var receiptPlanLines = db.ReceiptPlanLines.Where(x => x.ReceiptPlanId == receiptPlanId);
            if (receiptPlanLines.Count() > 0)
            {
                int maxReceiptPlanLineNo = db.ReceiptPlanLines.Where(x => x.ReceiptPlanId == receiptPlanId).Max(p => p.ReceiptPlanLineNo);
                nextReceiptPlanLineNo = maxReceiptPlanLineNo + 1;

            }
            return nextReceiptPlanLineNo;
        }

        // DELETE: api/ReceiptPlanLines/5
        [ResponseType(typeof(ReceiptPlanLines))]
        public IHttpActionResult DeleteReceiptPlanLines(int receiptPlanId, int receiptPlanLineNo)
        {
            ReceiptPlanLines receiptPlanLines = db.ReceiptPlanLines.Find(receiptPlanId,receiptPlanLineNo);
            if (receiptPlanLines == null)
            {
                return NotFound();
            }

            db.ReceiptPlanLines.Remove(receiptPlanLines);
            db.SaveChanges();

            return Ok(receiptPlanLines);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ReceiptPlanLinesExists(int receiptPlanId, int receiptPlanLineNo)
        {
            return db.ReceiptPlanLines.Count(e => e.ReceiptPlanId == receiptPlanId && e.ReceiptPlanLineNo == receiptPlanLineNo) > 0;
        }
    }
}