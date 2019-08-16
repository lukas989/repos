using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Models
{
    public class SalesOrderEdit : SalesOrders
    {
        public IEnumerable<SelectListItem> SalesOrderStatusSelectListItem { get; set; }

    }
}
