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
    public class SalesOrdersController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: SalesOrders
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<VSalesOrders> vSalesOrders = await new HttpClientLib().GetAsync<IEnumerable<VSalesOrders>>("API", "/api/SalesOrders/");
            return View(vSalesOrders.ToList());
        }

        // GET: SalesOrders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            if (salesOrders == null)
            {
                return HttpNotFound();
            }
            return View(salesOrders);
        }

        // GET: SalesOrders/Create
        public ActionResult Create()
        {
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "Name");
            ViewBag.SalesOrderStatusId = new SelectList(db.SalesOrderStatus, "SalesOrderStatusId", "Name");
            return View();
        }

        // POST: SalesOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SalesOrderId,SalesOrderStatusId,CustomerId,ExpectedDate,CurrencyId,CurrencyRate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrders salesOrders)
        {
            if (ModelState.IsValid)
            {
                db.SalesOrders.Add(salesOrders);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "Name", salesOrders.CustomerId);
            ViewBag.SalesOrderStatusId = new SelectList(db.SalesOrderStatus, "SalesOrderStatusId", "Name", salesOrders.SalesOrderStatusId);
            return View(salesOrders);
        }

        // GET: SalesOrders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            if (salesOrders == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "Name", salesOrders.CustomerId);
            ViewBag.SalesOrderStatusId = new SelectList(db.SalesOrderStatus, "SalesOrderStatusId", "Name", salesOrders.SalesOrderStatusId);
            return View(salesOrders);
        }

        // POST: SalesOrders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SalesOrderId,SalesOrderStatusId,CustomerId,ExpectedDate,CurrencyId,CurrencyRate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrders salesOrders)
        {
            if (ModelState.IsValid)
            {
                db.Entry(salesOrders).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "CustomerId", "Name", salesOrders.CustomerId);
            ViewBag.SalesOrderStatusId = new SelectList(db.SalesOrderStatus, "SalesOrderStatusId", "Name", salesOrders.SalesOrderStatusId);
            return View(salesOrders);
        }

        // GET: SalesOrders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            if (salesOrders == null)
            {
                return HttpNotFound();
            }
            return View(salesOrders);
        }

        // POST: SalesOrders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SalesOrders salesOrders = db.SalesOrders.Find(id);
            db.SalesOrders.Remove(salesOrders);
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
