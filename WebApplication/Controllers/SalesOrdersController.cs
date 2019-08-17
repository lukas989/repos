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
        public async System.Threading.Tasks.Task<ActionResult> Create()
        {
            IEnumerable<Customers> customers = await new HttpClientLib().GetAsync<IEnumerable<Customers>>("API", "/api/Customers/");
            return View(customers);
        }

        public async System.Threading.Tasks.Task<ActionResult> Create2(int CustomerId)
        {
            var loadSelectListItem = new LoadSelectListItem();
            var salesOrderEdit = new SalesOrderEdit() { CustomerId = CustomerId };
            salesOrderEdit.SalesOrderStatusSelectListItem = await loadSelectListItem.SalesOrderStatusAsync();

            return View(salesOrderEdit);
        }

        // POST: SalesOrders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create2([Bind(Include = "SalesOrderId,SalesOrderStatusId,CustomerId,ExpectedDate,CurrencyId,CurrencyRate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrders salesOrders)
        {
            try
            {
                new ObjectLib().InitObjec(salesOrders, Request.RequestContext.HttpContext.User.Identity.Name);
                // TODO: Add insert logic here
                await new HttpClientLib().PostAsync<SalesOrders>("API", "/api/SalesOrders/", salesOrders);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SalesOrders/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int? salesOrderId)
        {
            if (salesOrderId == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var loadSelectListItem = new LoadSelectListItem();
            SalesOrderEdit salesOrderEdit = await new HttpClientLib().GetByIdAsync<SalesOrderEdit>("API", "/api/SalesOrders/", (int)salesOrderId);
            salesOrderEdit.SalesOrderStatusSelectListItem = await loadSelectListItem.SalesOrderStatusAsync();
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("salesOrderId", salesOrderId.ToString());
            salesOrderEdit.VSalesOrderLines = await new HttpClientLib().GetByAsync<IEnumerable<VSalesOrderLines>>("API", "/api/SalesOrderLines/", paramList);
            return View(salesOrderEdit);
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
