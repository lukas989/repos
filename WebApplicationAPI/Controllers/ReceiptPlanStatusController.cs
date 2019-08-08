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
    public class ReceiptPlanStatusController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/ReceiptPlanStatus
        public IQueryable<ReceiptPlanStatus> GetReceiptPlanStatus()
        {
            return db.ReceiptPlanStatus;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ReceiptPlanStatusExists(int id)
        {
            return db.ReceiptPlanStatus.Count(e => e.ReceiptPlanStatusId == id) > 0;
        }
    }
}