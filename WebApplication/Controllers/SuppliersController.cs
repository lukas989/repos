using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplicationAPI.Models;
using System.Net.Http;
using WebApplicationLib;

namespace WebApplication.Controllers
{
    public class SuppliersController : Controller
    {

        // GET: Suppliers
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {
            IEnumerable<Suppliers> suppliers =await new HttpClientLib().GetAsync<IEnumerable<Suppliers>>("WebApplicationAPI", "/api/Suppliers/");
            return View(suppliers);
        }

        // GET: Suppliers/Details/5
        public async System.Threading.Tasks.Task<ActionResult> Details(int id)
        {
            Suppliers supplier = await new HttpClientLib().GetByIdAsync<Suppliers>("WebApplicationAPI", "/api/Suppliers/",id);
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
                await new HttpClientLib().PostAsync<Suppliers>("WebApplicationAPI", "/api/Suppliers/", supplier);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //// GET: Suppliers/Edit/5
        //public ActionResult Edit(int id)
        //{
        //    return View();
        //}

        // POST: Suppliers/Edit/5
        //[HttpPost]
        //public ActionResult Edit(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add update logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //// GET: Suppliers/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //// POST: Suppliers/Delete/5
        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
