using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Models;

namespace WebApplication.Controllers
{
    public class SalesOrderLinesController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: SalesOrderLines
        public ActionResult Index()
        {
            var salesOrderLines = db.VSalesOrderLines;
            return View(salesOrderLines.ToList());
        }

        // GET: SalesOrderLines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            if (salesOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(salesOrderLines);
        }

        // GET: SalesOrderLines/Create
        public ActionResult Create()
        {
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name");
            ViewBag.SalesOrderId = new SelectList(db.SalesOrders, "SalesOrderId", "CurrencyId");
            return View();
        }

        // POST: SalesOrderLines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SalesOrderId,SalesOrderLineNo,ProductId,OrderedQty,RecivedQty,PurchaseOrderPrice,ExpectedDate,DeliveryDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrderLines salesOrderLines)
        {
            if (ModelState.IsValid)
            {
                db.SalesOrderLines.Add(salesOrderLines);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", salesOrderLines.ProductId);
            ViewBag.SalesOrderId = new SelectList(db.SalesOrders, "SalesOrderId", "CurrencyId", salesOrderLines.SalesOrderId);
            return View(salesOrderLines);
        }

        // GET: SalesOrderLines/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            if (salesOrderLines == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", salesOrderLines.ProductId);
            ViewBag.SalesOrderId = new SelectList(db.SalesOrders, "SalesOrderId", "CurrencyId", salesOrderLines.SalesOrderId);
            return View(salesOrderLines);
        }

        // POST: SalesOrderLines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SalesOrderId,SalesOrderLineNo,ProductId,OrderedQty,RecivedQty,PurchaseOrderPrice,ExpectedDate,DeliveryDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrderLines salesOrderLines)
        {
            if (ModelState.IsValid)
            {
                db.Entry(salesOrderLines).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", salesOrderLines.ProductId);
            ViewBag.SalesOrderId = new SelectList(db.SalesOrders, "SalesOrderId", "CurrencyId", salesOrderLines.SalesOrderId);
            return View(salesOrderLines);
        }

        // GET: SalesOrderLines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            if (salesOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(salesOrderLines);
        }

        // POST: SalesOrderLines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SalesOrderLines salesOrderLines = db.SalesOrderLines.Find(id);
            db.SalesOrderLines.Remove(salesOrderLines);
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
