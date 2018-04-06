namespace WmsIntegration.Models
{
    public class ReceptionPlanConfirmLine
    {
        public string PartNumber { get; set; }
        public int ExpectedQuantity { get; set; }
        public int ReceivedQuantity { get; set; }
        public string UnitOfMeasurement { get; set; }
        public string DepComment { get; set; }
        public string ReservationReason { get; set; }

    }
}