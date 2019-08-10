using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WmsTransferSender.Models.Wms
{

    public class Item
    {
        public string PartNumber { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> Weight { get; set; }
        public Nullable<decimal> Height { get; set; }
        public Nullable<decimal> Width { get; set; }
        public Nullable<decimal> Depth { get; set; }
    }
}
