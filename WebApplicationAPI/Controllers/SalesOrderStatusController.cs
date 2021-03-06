﻿using System;
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
    public class SalesOrderStatusController : ApiController
    {
        private WmsConnectionEntities db = new WmsConnectionEntities();

        // GET: api/SalesOrderStatus
        public IQueryable<SalesOrderStatus> GetSalesOrderStatus()
        {
            return db.SalesOrderStatus;
        }
    }
}