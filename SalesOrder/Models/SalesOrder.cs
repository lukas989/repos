using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalesOrder.Models
{
    public class SalesOrder
    {
        public int SalesOrderId { get; set; }

        public string Cono { get; set; }
        public int SalesOrderStatusId { get; set; }

        public string SupplierId { get; set; }
        public string ExpectedDate { get; set; }
        public string CurrencyId { get; set; }
        public string CurrencyRate { get; set; }
        public string StockCode { get; set; }
        public string RegionId { get; set; }

        public string EntryAuthor { get; set; }
        public DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
