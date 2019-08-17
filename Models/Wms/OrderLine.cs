namespace Models.Wms
{
    public class OrderLine
    {
        public string CurrencyId { get; set; }
        public string OrderLineNo { get; set; }
        public string PartNumber { get; set; }
        public string Price { get; set; }
        public string Quantity { get; set; }
    }
}