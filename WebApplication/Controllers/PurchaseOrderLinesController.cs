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
        public async System.Threading.Tasks.Task<ActionResult> Create(int purchaseOrderId, int supplierId)
        {
            IEnumerable<Products> products = await new HttpClientLib().GetByIdAsync<IEnumerable<Products>>("API", "/api/Products/GetProductsBySupplierId/", supplierId);
            ViewBag.PurchaseOrderId = purchaseOrderId;
            ViewBag.Products = products;
            return View();
        }

        // POST: PurchaseOrderLines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create([Bind(Include = "PurchaseOrderId,PurchaseOrderLineNo,ProductId,OrderedQty,RecivedQty,PriceTypeId,PurchaseOrderPrice,ExpectedDate,DiscountTypeId,DiscountValue,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] PurchaseOrderLines purchaseOrderLines)
        {
            new ObjectLib().InitObjec(purchaseOrderLines, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PostAsync("API", "/api/PurchaseOrderLines/", purchaseOrderLines);
            return RedirectToAction("Edit", "PurchaseOrders", new { id = purchaseOrderLines.PurchaseOrderId });
        }

        // GET: PurchaseOrderLines/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int? purchaseOrderId, int? purchaseOrderLineNo)
        {
            if (purchaseOrderId == null || purchaseOrderLineNo == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("PurchaseOrderId", purchaseOrderId.ToString());
            paramList.Add("PurchaseOrderLineNo", purchaseOrderLineNo.ToString());

            PurchaseOrderLines purchaseOrderLines = await new HttpClientLib().GetByAsync<PurchaseOrderLines>("API", "/api/PurchaseOrderLines/", paramList);
            if (purchaseOrderLines == null)
            {
                return HttpNotFound();
            }

            Products product = await new HttpClientLib().GetByIdAsync<Products>("API", "/api/Products/", purchaseOrderLines.ProductId);
            purchaseOrderLines.Products = product;
            return View(purchaseOrderLines);
        }

        // POST: PurchaseOrderLines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Edit([Bind(Include = "PurchaseOrderId,PurchaseOrderLineNo,ProductId,OrderedQty,RecivedQty,PriceTypeId,PurchaseOrderPrice,ExpectedDate,DiscountTypeId,DiscountValue,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] PurchaseOrderLines purchaseOrderLines)
        {
            new ObjectLib().UpdateObject(purchaseOrderLines, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PutAsync("API", "/api/PurchaseOrderLines/", purchaseOrderLines);
            return RedirectToAction("Edit", "PurchaseOrders", new { id = purchaseOrderLines.PurchaseOrderId });
        }

        // GET: PurchaseOrderLines/Delete/5
        public async System.Threading.Tasks.Task<ActionResult> Delete(int? purchaseOrderId, int? purchaseOrderLineNo)
        {
            if (purchaseOrderId == null || purchaseOrderLineNo == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("PurchaseOrderId", purchaseOrderId.ToString());
            paramList.Add("PurchaseOrderLineNo", purchaseOrderLineNo.ToString());

            PurchaseOrderLines purchaseOrderLines = await new HttpClientLib().GetByAsync<PurchaseOrderLines>("API", "/api/PurchaseOrderLines/", paramList);
            if (purchaseOrderLines == null)
            {
                return HttpNotFound();
            }
            return View(purchaseOrderLines);
        }

        // POST: PurchaseOrderLines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> DeleteConfirmed(int? purchaseOrderId, int? purchaseOrderLineNo)
        {
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("PurchaseOrderId", purchaseOrderId.ToString());
            paramList.Add("PurchaseOrderLineNo", purchaseOrderLineNo.ToString());
            await new HttpClientLib().DeleteAsync("API", "/api/PurchaseOrderLines/", paramList);
            return RedirectToAction("Edit", "PurchaseOrders", new { id = purchaseOrderId });
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
