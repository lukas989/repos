using System;

namespace WmsIntegration.Models
{
    public class ReceptionPlanHeader
    {
        public string ErCode { get; set; }
        public string LogisticSite { get; set; }
        public int Depositor { get; set; }
        public string ErType { get; set; }
        public string Cono { get; set; }
        public string ReceivingLocation { get; set; }

        public DateTime? ExpectedDate { get; set; }

    }
}