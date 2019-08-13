using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WmsTransferSender.Models.Wms
{
    public class ReceiptLine
    {
        public string PartNumber { get; set; }
        public int ExpectedQuantity { get; set; }
    }
}
