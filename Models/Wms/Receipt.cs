using System.Collections.Generic;
using WmsTransferSender.Models.Wms;

namespace WmsTransferSender
{
    public class Receipt
    {
        public Supplier Supplier { get; set; }
        public ReceiptHeader ReceiptHeader { get; set; }
        public List<ReceiptLine> ReceiptLines { get; set; }
    }
}