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
        public string Supplier { get; set; }

        public IEnumerable<SelectListItem> PurchaseOrderStatusList { get; set; }
    }
}
