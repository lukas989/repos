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
        public ActionResult Create()
        {
            ViewBag.ReceiptPlanStatusId = new SelectList(db.ReceiptPlanStatus, "ReceiptPlanStatusId", "Name");
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name");
            return View();
        }

        // POST: ReceiptPlans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ReceiptPlanId,ReceiptPlanStatusId,SupplierId,ExpectedDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlans receiptPlans)
        {
            if (ModelState.IsValid)
            {
                db.ReceiptPlans.Add(receiptPlans);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ReceiptPlanStatusId = new SelectList(db.ReceiptPlanStatus, "ReceiptPlanStatusId", "Name", receiptPlans.ReceiptPlanStatusId);
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name", receiptPlans.SupplierId);
            return View(receiptPlans);
        }

        // GET: ReceiptPlans/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.ReceiptPlanStatusId = new SelectList(db.ReceiptPlanStatus, "ReceiptPlanStatusId", "Name", receiptPlans.ReceiptPlanStatusId);
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name", receiptPlans.SupplierId);
            return View(receiptPlans);
        }

        // POST: ReceiptPlans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReceiptPlanId,ReceiptPlanStatusId,SupplierId,ExpectedDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlans receiptPlans)
        {
            if (ModelState.IsValid)
            {
                db.Entry(receiptPlans).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ReceiptPlanStatusId = new SelectList(db.ReceiptPlanStatus, "ReceiptPlanStatusId", "Name", receiptPlans.ReceiptPlanStatusId);
            ViewBag.SupplierId = new SelectList(db.Suppliers, "SupplierId", "Name", receiptPlans.SupplierId);
            return View(receiptPlans);
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
