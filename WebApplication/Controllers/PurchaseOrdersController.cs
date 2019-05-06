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
            PurchaseOrderEdit PurchaseOrder = new PurchaseOrderEdit();
            PurchaseOrder.PurchaseOrderStatusList = await LoadSelectListItemPurchaseOrderStatusAsync();
            PurchaseOrder.SupplierList = await LoadSelectListItemSupplierAsync();
            return View(PurchaseOrder);
        }

        private async Task<IEnumerable<SelectListItem>> LoadSelectListItemSupplierAsync()
        {
            var purchaseOrderStatus = await new HttpClientLib().GetAsync<IEnumerable<Suppliers>>("API", "/api/Suppliers/");
            return from s in purchaseOrderStatus
                   select new SelectListItem
                   {
                       Selected = s.SupplierId.ToString() == "Active",
                       Text = s.Name,
                       Value = s.SupplierId.ToString()
                   };
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
            PurchaseOrderEdit PurchaseOrder = await new HttpClientLib().GetByIdAsync<PurchaseOrderEdit>("API", "/api/PurchaseOrders/", id);
            PurchaseOrder.PurchaseOrderStatusList = await LoadSelectListItemPurchaseOrderStatusAsync();
            PurchaseOrder.SupplierList = await LoadSelectListItemSupplierAsync();

            return View(PurchaseOrder);
        }

        private async System.Threading.Tasks.Task<IEnumerable<SelectListItem>> LoadSelectListItemPurchaseOrderStatusAsync()
        {
            var purchaseOrderStatus = await new HttpClientLib().GetAsync<IEnumerable<PurchaseOrderStatus>>("API", "/api/PurchaseOrderStatus/");
            return from s in purchaseOrderStatus
                   select new SelectListItem
                   {
                       Selected = s.PurchaseOrderStatusId.ToString() == "Active",
                       Text = s.Name,
                       Value = s.PurchaseOrderStatusId.ToString()
                   };
        }

        // POST: PurchaseOrders/Edit/5
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id, PurchaseOrders PurchaseOrder)
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
