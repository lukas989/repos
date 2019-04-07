using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Models
{
    public class PurchaseOrderCreate : PurchaseOrders
    {

        public string PurchaseOrderStatus { get; set; }
        public IEnumerable<SelectListItem> SuppliersList { get; set; }

    }
}
