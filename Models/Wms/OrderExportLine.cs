namespace Models.Wms
{
    public class OrderExportLine
    {
        public string OrderLineNo { get; set; }
        public string PartNumber { get; set; }
        public string OrderedQuantity { get; set; }
        public string CheckedQuantity { get; set; }
    }
}