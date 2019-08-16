using Lib;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace WebApplicationLib
{
    public class LoadSelectListItem
    {

        public async Task<IEnumerable<SelectListItem>> SupplierAsync()
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


        public async System.Threading.Tasks.Task<IEnumerable<SelectListItem>> PurchaseOrderStatusAsync()
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

        public async Task<IEnumerable<SelectListItem>> ReceiptPlanStatusAsync()
        {
            var receiptPlanStatus = await new HttpClientLib().GetAsync<IEnumerable<ReceiptPlanStatus>>("API", "/api/ReceiptPlanStatus/");
            return from s in receiptPlanStatus
                   select new SelectListItem
                   {
                       Selected = s.ReceiptPlanStatusId.ToString() == "Active",
                       Text = s.Name,
                       Value = s.ReceiptPlanStatusId.ToString()
                   };
        }

        public async Task<IEnumerable<SelectListItem>> SalesOrderStatusAsync()
        {
            var salesOrderStatuses = await new HttpClientLib().GetAsync<IEnumerable<SalesOrderStatus>>("API", "/api/SalesOrderStatus/");
            return from s in salesOrderStatuses
                   select new SelectListItem
                   {
                       Selected = s.SalesOrderStatusId.ToString() == "Active",
                       Text = s.Name,
                       Value = s.SalesOrderStatusId.ToString()
                   };
        }
    }
}
