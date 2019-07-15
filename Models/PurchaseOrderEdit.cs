using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Models
{
    public class PurchaseOrderEdit : PurchaseOrders
    {
        public IEnumerable<SelectListItem> SupplierList { get; set; }

        public DateTime ExpectedDateValue { get; set; }

        public IEnumerable<SelectListItem> PurchaseOrderStatusList { get; set; }

        public IEnumerable<VPurchaseOrderLines> PurchaseOrderLines { get; set; }
    }
}
