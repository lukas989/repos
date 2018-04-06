namespace WmsIntegration.Models
{
    public class ReceptionPlanLine
    {
        public string PartNumber { get; set; }
        public int ExpectedQuantity { get; set; }
        public string UnitOfMeasurment { get; set; }
        public bool ScanSn { get; set; }
        public string SplitLogisticSite { get; set; }
        public string SSCC { get; set; }
    }
}