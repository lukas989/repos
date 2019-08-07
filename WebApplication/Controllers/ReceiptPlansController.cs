using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Lib;
using Models;
using WebApplicationLib;

namespace WebApplication.Controllers
{
    public class ReceiptPlansController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: ReceiptPlans
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<VReceiptPlans> receiptPlans = await new HttpClientLib().GetAsync<IEnumerable<VReceiptPlans>>("API", "/api/ReceiptPlans/");
            return View(receiptPlans.ToList());
        }

        // GET: ReceiptPlans/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReceiptPlans receiptPlans = db.ReceiptPlans.Find(id);
            if (receiptPlans == null)
            {
                return HttpNotFound();
            }
            return View(receiptPlans);
        }

        // GET: ReceiptPlans/Create
        public async System.Threading.Tasks.Task<ActionResult> Create()
        {
            LoadSelectListItem loadSelectListItem = new LoadSelectListItem();
            ReceiptPlansEdit receiptPlansEdit = new ReceiptPlansEdit();
            receiptPlansEdit.ReceiptPlanStatusSelectListItem = await loadSelectListItem.ReceiptPlanStatusAsync();
            receiptPlansEdit.SuppliersSelectListItem = await loadSelectListItem.SupplierAsync();
            return View(receiptPlansEdit);
        }

        // POST: ReceiptPlans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create([Bind(Include = "ReceiptPlanId,ReceiptPlanStatusId,SupplierId,ExpectedDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlans receiptPlans)
        {
            new ObjectLib().InitObjec(receiptPlans, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PostAsync("API", "/api/ReceiptPlans/", receiptPlans);
            return RedirectToAction("Index"); 
        }

        // GET: ReceiptPlans/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int? id)
        {
            ReceiptPlansEdit receiptPlans;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            receiptPlans = await new HttpClientLib().GetByIdAsync<ReceiptPlansEdit>("API", "/api/ReceiptPlans/", (int)id);
            if (receiptPlans == null)
            {
                return HttpNotFound();
            }
            LoadSelectListItem loadSelectListItem = new LoadSelectListItem();
            receiptPlans.ReceiptPlanStatusSelectListItem = await loadSelectListItem.ReceiptPlanStatusAsync();
            receiptPlans.SuppliersSelectListItem = await loadSelectListItem.SupplierAsync();
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("ReceiptPlanId", id.ToString());
            receiptPlans.VReceiptPlanLines = await new HttpClientLib().GetByAsync<IEnumerable<VReceiptPlanLines>>("API", "/api/ReceiptPlanLines/", paramList);
            return View(receiptPlans);
        }

        // POST: ReceiptPlans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Edit([Bind(Include = "ReceiptPlanId,ReceiptPlanStatusId,SupplierId,ExpectedDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlans receiptPlans)
        {
            new ObjectLib().UpdateObject(receiptPlans, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PutAsync("API", "/api/ReceiptPlans/", receiptPlans.ReceiptPlanId, receiptPlans);
            return RedirectToAction("Index");
        }

        // GET: ReceiptPlans/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReceiptPlans receiptPlans = db.ReceiptPlans.Find(id);
            if (receiptPlans == null)
            {
                return HttpNotFound();
            }
            return View(receiptPlans);
        }

        // POST: ReceiptPlans/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReceiptPlans receiptPlans = db.ReceiptPlans.Find(id);
            db.ReceiptPlans.Remove(receiptPlans);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
