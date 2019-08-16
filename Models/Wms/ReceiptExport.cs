using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Wms
{
    public class ReceiptExport
    {
        public ReceiptExportHeader Header { get; set; }
        public List<ReceiptExportLine> Lines { get; set; }
    }
}
