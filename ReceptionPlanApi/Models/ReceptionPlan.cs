using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReceptionPlanApi.Models
{
    public class ReceptionPlan
    {
        public int ReceptionPlanId { get; set; }

        public int SupplierId { get; set; }

        // public string SupplierName { get; set; }

        public string ReceivingLocation { get; set; }

        public DateTime ExpectedReceiveDate { get; set; } //ExpectedDate

        public string RegionId { get; set; } // LogisticSite
        public int Depositor { get; set; } // Zawsze 3 
        public string TransportType { get; set; } // ErType
        public string Cono { get; set; }


        public string EntryAuthor { get; set; }
        public DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public DateTime LastUpdate { get; set; }

    }

}
