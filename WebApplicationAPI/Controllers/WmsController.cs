using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Models;
using Models.Wms;

namespace WebApplicationAPI.Controllers
{
    public class WmsController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        [HttpPut]
        [Route("api/Wms/ReceiptExport")]
        public IHttpActionResult ReceiptExport([FromBody]ReceiptExport receiptExport)
        {
            return Ok();
        }

        [HttpPut]
        [Route("api/Wms/ItemExport")]
        public IHttpActionResult ItemExport([FromBody]ItemExport itemExport)
        {
            var product = db.Products.FirstOrDefault(x => x.ProductId == itemExport.PartNumber);
            Mapper.Map<ItemExport, Products>(itemExport, product);
            var currentDateTime = DateTime.Now;
            product.LastUpdate = currentDateTime;
            product.WmsUpdate = currentDateTime;
            product.LastAuthor = "Wms";
            db.SaveChanges();
            return Ok();
        }
    }
}