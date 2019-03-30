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
    public class ProductsController : Controller
    {

        // GET: Products
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<VProducts> Products = await new HttpClientLib().GetAsync<IEnumerable<VProducts>>("API", "/api/Products/");
            return View(Products);
        }

        // GET: Products/Details/5
        public async System.Threading.Tasks.Task<ActionResult> Details(int id)
        {
            Products product = await new HttpClientLib().GetByIdAsync<Products>("API", "/api/Products/", id);
            return View(product);
        }


        public async System.Threading.Tasks.Task<ActionResult> Create()
        {
            ProductEdit product = new ProductEdit();
            product.SuppliersList = await LoadSelectListItemSuppliersAsync();
            return View(product);
        }

        // POST: Products/Create
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Create(Products product)
        {
            try
            {
                new ObjectLib().InitObjec(product, Request.RequestContext.HttpContext.User.Identity.Name);
                // TODO: Add insert logic here
                await new HttpClientLib().PostAsync<Products>("API", "/api/Products/", product);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Products/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id)
        {
            ProductEdit product = await new HttpClientLib().GetByIdAsync<ProductEdit>("API", "/api/Products/", id);
            product.SuppliersList = await LoadSelectListItemSuppliersAsync();
            return View(product);
        }

        private async System.Threading.Tasks.Task<IEnumerable<SelectListItem>> LoadSelectListItemSuppliersAsync()
        {
            var suppliers = await new HttpClientLib().GetAsync<IEnumerable<Suppliers>>("API", "/api/Suppliers/");
            return from s in suppliers
              select new SelectListItem
              {
                  Selected = s.SupplierId.ToString() == "Active",
                  Text = s.Name,
                  Value = s.SupplierId.ToString()
              };
        }

        // POST: Products/Edit/5
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id, Products product)
        {
            try
            {
                // TODO: Add update logic here
                new ObjectLib().UpdateObject(product, Request.RequestContext.HttpContext.User.Identity.Name);
                await new HttpClientLib().PutAsync<Products>("API", "/api/Products/" + id, product);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
