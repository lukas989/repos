using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Http;
using Lib;
using Models;

namespace WebApplication.Controllers
{
    public class SuppliersController : Controller
    {

        // GET: Suppliers
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<Suppliers> suppliers =await new HttpClientLib().GetAsync<IEnumerable<Suppliers>>("API", "/api/Suppliers/");
            return View(suppliers);
        }

        // GET: Suppliers/Details/5
        public async System.Threading.Tasks.Task<ActionResult> Details(int id)
        {
            Suppliers supplier = await new HttpClientLib().GetByIdAsync<Suppliers>("API", "/api/Suppliers/",id);
            return View(supplier);
        }

        // GET: Suppliers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Suppliers/Create
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Create(Suppliers supplier)
        {
            try
            {
                new ObjectLib().InitObjec(supplier, Request.RequestContext.HttpContext.User.Identity.Name);
                // TODO: Add insert logic here
                await new HttpClientLib().PostAsync<Suppliers>("API", "/api/Suppliers/", supplier);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Suppliers/Edit/5
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id)
        {
            Suppliers supplier = await new HttpClientLib().GetByIdAsync<Suppliers>("API", "/api/Suppliers/", id);
            return View(supplier);
        }

        // POST: Suppliers/Edit/5
        [HttpPost]
        public async System.Threading.Tasks.Task<ActionResult> Edit(int id, Suppliers supplier)
        {
            try
            {
                // TODO: Add update logic here
                new ObjectLib().UpdateObject(supplier, Request.RequestContext.HttpContext.User.Identity.Name);
                await new HttpClientLib().PutAsync<Suppliers>("API", "/api/Suppliers/"+ id, supplier);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
