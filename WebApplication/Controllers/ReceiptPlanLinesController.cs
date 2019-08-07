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
    public class ReceiptPlanLinesController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: ReceiptPlanLines
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<VReceiptPlanLines> receiptPlanLines = await new HttpClientLib().GetAsync<IEnumerable<VReceiptPlanLines>>("API", "/api/ReceiptPlanLines/");
            return View(receiptPlanLines.ToList());
        }

        // GET: ReceiptPlanLines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReceiptPlanLines receiptPlanLines = db.ReceiptPlanLines.Find(id);
            if (receiptPlanLines == null)
            {
                return HttpNotFound();
            }
            return View(receiptPlanLines);
        }

        // GET: ReceiptPlanLines/Create
        public async System.Threading.Tasks.Task<ActionResult> Create(int receiptPlanId, int supplierId)
        {
            ReceiptPlanLinesEdit receiptPlanLinesEdit = new ReceiptPlanLinesEdit() { ReceiptPlanId = receiptPlanId};
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("supplierId", supplierId.ToString());
            receiptPlanLinesEdit.VPurchaseOrderLines = await new HttpClientLib().GetByAsync<IEnumerable<VPurchaseOrderLines>>("API", "/api/PurchaseOrderLines/GetPurchaseOrderLinesBySupplier/", paramList);
            return View(receiptPlanLinesEdit);
        }
        public async System.Threading.Tasks.Task<ActionResult> Create2(int purchaseOrderId,int purchaseOrderLineNo, int receiptPlanId)
        {
            ReceiptPlanLinesEdit receiptPlanLinesEdit = new ReceiptPlanLinesEdit()
            {
                PurchaseOrderId = purchaseOrderId,
                PurchaseOrderLineNo = purchaseOrderLineNo,
                ReceiptPlanId = receiptPlanId
            };
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("purchaseOrderId", purchaseOrderId.ToString());
            IEnumerable<VPurchaseOrderLines> purchaseOrderLines = await new HttpClientLib().GetByAsync<IEnumerable<VPurchaseOrderLines>>("API", "/api/PurchaseOrderLines/", paramList);
            receiptPlanLinesEdit.VPurchaseOrderLine = purchaseOrderLines.FirstOrDefault(x => x.PurchaseOrderId == purchaseOrderId && x.PurchaseOrderLineNo == purchaseOrderLineNo);
            return View(receiptPlanLinesEdit);
        }

        // POST: ReceiptPlanLines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async System.Threading.Tasks.Task<ActionResult> Create2([Bind(Include = "ReceiptPlanId,ReceiptPlanLineNo,PurchaseOrderId,PurchaseOrderLineNo,ExpectedQty,RecivedQty,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlanLines receiptPlanLines)
        {
            new ObjectLib().InitObjec(receiptPlanLines, Request.RequestContext.HttpContext.User.Identity.Name);
            await new HttpClientLib().PostAsync("API", "/api/ReceiptPlanLines/", receiptPlanLines);
            return RedirectToAction("Edit", "ReceiptPlans", new { id = receiptPlanLines.ReceiptPlanId });
        }

        // GET: ReceiptPlanLines/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int? receiptPlanId, int? receiptPlanLineNo )
        {
            if (receiptPlanId == null || receiptPlanLineNo == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }


            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("ReceiptPlanId", receiptPlanId.ToString());
            paramList.Add("ReceiptPlanLineNo", receiptPlanLineNo.ToString());

            ReceiptPlanLines receiptPlanLines = await new HttpClientLib().GetByAsync<ReceiptPlanLines>("API", "/api/ReceiptPlanLines/", paramList);
            if (receiptPlanLineNo == null)
            {
                return HttpNotFound();
            }
            return View(receiptPlanLines);
        }

        // POST: ReceiptPlanLines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ReceiptPlanId,ReceiptPlanLineNo,PurchaseOrderId,PurchaseOrderLineNo,ExpectedQty,RecivedQty,EntryAuthor,EntryDate,LastAuthor,LastUpdate")] ReceiptPlanLines receiptPlanLines)
        {
            if (ModelState.IsValid)
            {
                db.Entry(receiptPlanLines).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PurchaseOrderId = new SelectList(db.PurchaseOrders, "PurchaseOrderId", "CurrencyId", receiptPlanLines.PurchaseOrderId);
            ViewBag.ReceiptPlanId = new SelectList(db.ReceiptPlans, "ReceiptPlanId", "EntryAuthor", receiptPlanLines.ReceiptPlanId);
            return View(receiptPlanLines);
        }

        // GET: ReceiptPlanLines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ReceiptPlanLines receiptPlanLines = db.ReceiptPlanLines.Find(id);
            if (receiptPlanLines == null)
            {
                return HttpNotFound();
            }
            return View(receiptPlanLines);
        }

        // POST: ReceiptPlanLines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ReceiptPlanLines receiptPlanLines = db.ReceiptPlanLines.Find(id);
            db.ReceiptPlanLines.Remove(receiptPlanLines);
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
