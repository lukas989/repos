using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Lib;
using Models;
using WebApplicationLib;

namespace WebApplication.Controllers
{
    public class PurchaseOrdersController : Controller
    {

        // GET: PurchaseOrders
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<VPurchaseOrders> PurchaseOrders = await new HttpClientLib().GetAsync<IEnumerable<VPurchaseOrders>>("API", "/api/PurchaseOrders/");
            return View(PurchaseOrders);
        }

        // GET: PurchaseOrders/Details/5
        public async System.Threading.Tasks.Task<ActionResult> Details(int id)
        {
            PurchaseOrders PurchaseOrder = await new HttpClientLib().GetByIdAsync<PurchaseOrders>("API", "/api/PurchaseOrders/", id);
            return View(PurchaseOrder);
        }


        public async System.Threading.Tasks.Task<ActionResult> Create()
        {
            var loadSelectListItem = new LoadSelectListItem();
            PurchaseOrderEdit PurchaseOrder = new PurchaseOrderEdit();
            PurchaseOrder.PurchaseOrderStatusList = await loadSelectListItem.PurchaseOrderStatusAsync();
            PurchaseOrder.SupplierList = await loadSelectListItem.SupplierAsync();
            return View(PurchaseOrder);
        }

        // POST: PurchaseOrders/Create
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Create(PurchaseOrders PurchaseOrder)
        {
            try
            {
                new ObjectLib().InitObjec(PurchaseOrder, Request.RequestContext.HttpContext.User.Identity.Name);
                // TODO: Add insert logic here
                await new HttpClientLib().PostAsync<PurchaseOrders>("API", "/api/PurchaseOrders/", PurchaseOrder);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: PurchaseOrders/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id)
        {
            var loadSelectListItem = new LoadSelectListItem();
            PurchaseOrderEdit PurchaseOrder = await new HttpClientLib().GetByIdAsync<PurchaseOrderEdit>("API", "/api/PurchaseOrders/", id);
            PurchaseOrder.PurchaseOrderStatusList = await loadSelectListItem.PurchaseOrderStatusAsync();
            PurchaseOrder.SupplierList = await loadSelectListItem.SupplierAsync();
            Dictionary<string, string> paramList = new Dictionary<string, string>();
            paramList.Add("purchaseOrderId", id.ToString());
            PurchaseOrder.VPurchaseOrderLines = await new HttpClientLib().GetByAsync<IEnumerable<VPurchaseOrderLines>>("API", "/api/PurchaseOrderLines/", paramList);

            return View(PurchaseOrder);
        }

        // POST: PurchaseOrders/Edit/5
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id, PurchaseOrderEdit PurchaseOrder)
        {
            try
            {
                // TODO: Add update logic here
                new ObjectLib().UpdateObject(PurchaseOrder, Request.RequestContext.HttpContext.User.Identity.Name);
                await new HttpClientLib().PutAsync<PurchaseOrders>("API", "/api/PurchaseOrders/" + id, PurchaseOrder);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
