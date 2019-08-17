using Models;
using System.Collections.Generic;

namespace WmsTransferSender
{
    internal class SalesOrderToWms
    {
        public SalesOrders SalesOrder { get; set; }
        public Customers Customers { get; set; }

        public List<SalesOrderLines> SalesOrderLines { get; set; }

    }
}