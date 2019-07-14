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
    public class PurchaseOrderLinesController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: PurchaseOrderLines
        public async System.Threading.Tasks.Task<ActionResult> IndexAsync(int purchaseOrderId)
        {
            IEnumerable<VPurchaseOrderLines> purchaseOrderLines = await new HttpClientLib().GetByIdAsync<IEnumerable<VPurchaseOrderLines>>("API", "/api/PurchaseOrderLines/", purchaseOrderId);
            return View(purchaseOrderLines.ToList());
        }

        // GET: PurchaseOrderLines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrderLines purchaseOrderLines = db.PurchaseOrderLines.Find(id);
            if (purchaseOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrderLines);
        }

        // GET: PurchaseOrderLines/Create
        public ActionResult Create()
        {
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name");
            ViewBag.PurchaseOrderId = new SelectList(db.PurchaseOrders, "PurchaseOrderId", "CurrencyId");
            return View();
        }

        // POST: PurchaseOrderLines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PurchaseOrderId,PurchaseOrderLineNo,ProductId,OrderedQty,RecivedQty,PriceTypeId,PurchaseOrderPrice,ExpectedDate,DiscountTypeId,DiscountValue,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] PurchaseOrderLines purchaseOrderLines)
        {
            if (ModelState.IsValid)
            {
                db.PurchaseOrderLines.Add(purchaseOrderLines);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", purchaseOrderLines.ProductId);
            ViewBag.PurchaseOrderId = new SelectList(db.PurchaseOrders, "PurchaseOrderId", "CurrencyId", purchaseOrderLines.PurchaseOrderId);
            return View(purchaseOrderLines);
        }

        // GET: PurchaseOrderLines/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrderLines purchaseOrderLines = db.PurchaseOrderLines.Find(id);
            if (purchaseOrderLines == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", purchaseOrderLines.ProductId);
            ViewBag.PurchaseOrderId = new SelectList(db.PurchaseOrders, "PurchaseOrderId", "CurrencyId", purchaseOrderLines.PurchaseOrderId);
            return View(purchaseOrderLines);
        }

        // POST: PurchaseOrderLines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PurchaseOrderId,PurchaseOrderLineNo,ProductId,OrderedQty,RecivedQty,PriceTypeId,PurchaseOrderPrice,ExpectedDate,DiscountTypeId,DiscountValue,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] PurchaseOrderLines purchaseOrderLines)
        {
            if (ModelState.IsValid)
            {
                db.Entry(purchaseOrderLines).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", purchaseOrderLines.ProductId);
            ViewBag.PurchaseOrderId = new SelectList(db.PurchaseOrders, "PurchaseOrderId", "CurrencyId", purchaseOrderLines.PurchaseOrderId);
            return View(purchaseOrderLines);
        }

        // GET: PurchaseOrderLines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseOrderLines purchaseOrderLines = db.PurchaseOrderLines.Find(id);
            if (purchaseOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrderLines);
        }

        // POST: PurchaseOrderLines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PurchaseOrderLines purchaseOrderLines = db.PurchaseOrderLines.Find(id);
            db.PurchaseOrderLines.Remove(purchaseOrderLines);
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
