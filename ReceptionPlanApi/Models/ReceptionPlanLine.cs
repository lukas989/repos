using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReceptionPlanApi.Models
{
    public class ReceptionPlanLine
    {
        public int RecPlanId { get; set; }
        public int RecPlanLineNo { get; set; }
        public string SalesOrderCono { get; set; }
        public int SalesOrderId { get; set; }
        public int SalesOrderLineNo { get; set; }
        public string TargetStockId { get; set; }
        public int QtyReceived { get; set; }
        public string PackageType { get; set; }
        public string ScanSN { get; set; }
        public int QtyConfirmed { get; set; }
        public int QtyReceivedOutstanding { get; set; }
        public string UnitOfMeasurement { get; set; }
        public string EntryAuthor { get; set; }
        public DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public DateTime LastUpdate { get; set; }

    }
}
