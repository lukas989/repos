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
        public ActionResult Create(int salesOrderId, int productId)
        {
            SalesOrderLinesEdit salesOrderLinesEdit = new SalesOrderLinesEdit() { SalesOrderId = salesOrderId, ProductId = productId, ExpectedDate = DateTime.Now };
            return View(salesOrderLinesEdit);
        }

        public async System.Threading.Tasks.Task<ActionResult> SelectProduct(int salesOrderId)
        {
            SalesOrderLinesEdit salesOrderLinesEdit = new SalesOrderLinesEdit() { SalesOrderId= salesOrderId };
            salesOrderLinesEdit.ProductList = await new HttpClientLib().GetAsync<IEnumerable<VProducts>>("API", "/api/Products/");
            return View(salesOrderLinesEdit);

        }


        // POST: SalesOrderLines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create([Bind(Include = "SalesOrderId,SalesOrderLineNo,ProductId,OrderedQty,RecivedQty,PurchaseOrderPrice,ExpectedDate,DeliveryDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrderLines salesOrderLines)
        {
            new ObjectLib().InitObjec(salesOrderLines, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PostAsync("API", "/api/SalesOrderLines/", salesOrderLines);
            return RedirectToAction("Edit", "SalesOrders", new { SalesOrderId = salesOrderLines.SalesOrderId });
        }

        // GET: SalesOrderLines/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int? salesOrderId, int? salesOrderLineNo )
        {
            if (salesOrderId == null || salesOrderLineNo == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("SalesOrderId", salesOrderId.ToString());
            paramList.Add("SalesOrderLineNo", salesOrderLineNo.ToString());
            SalesOrderLines salesOrderLines = await new HttpClientLib().GetByAsync<SalesOrderLines>("API", "/api/SalesOrderLines/", paramList);
            if (salesOrderLines == null)
            {
                return HttpNotFound();
            }
            //ViewBag.ProductId = new SelectList(db.Products, "ProductId", "Name", salesOrderLines.ProductId);
            //ViewBag.SalesOrderId = new SelectList(db.SalesOrders, "SalesOrderId", "CurrencyId", salesOrderLines.SalesOrderId);
            return View(salesOrderLines);
        }

        // POST: SalesOrderLines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Edit([Bind(Include = "SalesOrderId,SalesOrderLineNo,ProductId,OrderedQty,RecivedQty,PurchaseOrderPrice,ExpectedDate,DeliveryDate,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] SalesOrderLines salesOrderLines)
        {
            new ObjectLib().UpdateObject(salesOrderLines, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PutAsync("API", "/api/SalesOrderLines/", salesOrderLines);
            return RedirectToAction("Edit", "SalesOrders", new { salesOrderLines.SalesOrderId });
        }

        // GET: SalesOrderLines/Delete/5
        public async System.Threading.Tasks.Task<ActionResult> Delete(int? salesOrderId, int? salesOrderLineNo)
        {
            if (salesOrderId == null || salesOrderLineNo == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("SalesOrderId", salesOrderId.ToString());
            paramList.Add("SalesOrderLineNo", salesOrderLineNo.ToString());
            SalesOrderLines salesOrderLines = await new HttpClientLib().GetByAsync<SalesOrderLines>("API", "/api/SalesOrderLines/", paramList);
            if (salesOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(salesOrderLines);
        }

        // POST: SalesOrderLines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> DeleteConfirmed(int? salesOrderId, int? salesOrderLineNo)
        {
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("SalesOrderId", salesOrderId.ToString());
            paramList.Add("SalesOrderLineNo", salesOrderLineNo.ToString());
            await new HttpClientLib().DeleteAsync("API", "/api/SalesOrderLines/", paramList);
            return RedirectToAction("Edit", "SalesOrders", new { salesOrderId });
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
