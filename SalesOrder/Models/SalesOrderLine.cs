using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SalesOrder.Models
{
    public class SalesOrderLine
    {
        public string Cono { get; set; }
        public int SalesOrderId { get; set; }
        public string SalesOrderLineNo { get; set; }
        public string PartNumber { get; set; }
        public int OrderedQty { get; set; }
        public int RecivedQty { get; set; }
        public int PriceTypeId { get; set; }
        public decimal SalesOrderPrice { get; set; }
        public DateTime ExpectedDate { get; set; }
        public DateTime DeliveryDate { get; set; }
        public int DiscountTypeId { get; set; }
        public decimal DiscountValue { get; set; }
        public decimal DiscountPercent { get; set; }
        public string EntryAuthor { get; set; }
        public DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
