using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Wms
{
    public class OrderExport
    {
        public OrderExportHeader Header { get; set; }

        public List<OrderExportLine> Lines { get; set; }

}
}
