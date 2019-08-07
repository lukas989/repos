using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ReceiptPlanLinesEdit : ReceiptPlanLines
    {
        public IEnumerable<VPurchaseOrderLines> VPurchaseOrderLines { get; set; }
        public VPurchaseOrderLines VPurchaseOrderLine { get; set; }
    }
}
