using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Wms
{
    public class ReceiptExportLine
    {
        public string PartNumber { get; set; }
        public string ExpectedQuantity { get; set; }
        public string ReceivedQuantity { get; set; }
    }
}
