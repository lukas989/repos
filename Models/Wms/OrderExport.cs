using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace Models.Wms
{
    public class OrderExport
    {
        public OrderExportHeader Header { get; set; }
        public List<OrderExportLine> OrderExportLines { get; set; }

    }
}
