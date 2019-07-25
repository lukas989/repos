using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Models;

namespace WebApplicationAPI.Controllers
{
    public class ProductsController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/Products
        public IQueryable<VProducts> GetProducts()
        {
            return db.VProducts;
        }

        // GET: api/Products/5
        [HttpGet]
        [ResponseType(typeof(Products))]
        public IHttpActionResult GetProductsById(int id)
        {
            Products products = db.Products.Find(id);
            var listProductBarcodes =  db.ProductBarcodes.Where(x => x.ProductId == id).ToList();
            if (listProductBarcodes != null && listProductBarcodes.Count !=  0)
            { products.ProductBarcodes = listProductBarcodes; }
            
            if (products == null)
            {
                return NotFound();
            }

            return Ok(products);
        }
        [HttpGet]
        public IQueryable<Products> GetProductsBySupplierId(int id)
        {
            return db.Products.Where(x => x.SupplierId == id);
        }


        // PUT: api/Products/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProducts(int id, Products products)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != products.ProductId)
            {
                return BadRequest();
            }

            db.Entry(products).State = EntityState.Modified;

            try
            {
                try
                {
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                }
                
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Products
        [ResponseType(typeof(Products))]
        public IHttpActionResult PostProducts(Products products)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Products.Add(products);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = products.ProductId }, products);
        }

        // DELETE: api/Products/5
        [ResponseType(typeof(Products))]
        public IHttpActionResult DeleteProducts(int id)
        {
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return NotFound();
            }

            db.Products.Remove(products);
            db.SaveChanges();

            return Ok(products);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProductsExists(int id)
        {
            return db.Products.Count(e => e.ProductId == id) > 0;
        }
    }
}