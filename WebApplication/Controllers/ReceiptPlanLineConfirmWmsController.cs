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
    public class ReceiptPlanLineConfirmWmsController : Controller
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: ReceiptPlanLineConfirmWms
        public async System.Threading.Tasks.Task<ActionResult> Index()
        {

            IEnumerable<ReceiptPlanLineConfirmWms> receiptPlanLineConfirmWms = await new HttpClientLib().GetAsync<IEnumerable<ReceiptPlanLineConfirmWms>>("API", "/api/wms/ReceiptPlanLineConfirmWms/");
            return View(receiptPlanLineConfirmWms);
        }
    }
}
