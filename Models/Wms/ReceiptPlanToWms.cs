using Models;
using System.Collections.Generic;

namespace WmsTransferSender
{
    public class ReceiptPlanToWms
    {
        public ReceiptPlans ReceiptPlans { get; set;}

        public Suppliers Supplier { get; set; }

        public List<VReceiptPlanLines> VReceiptPlanLines { get; set; }
    }
}