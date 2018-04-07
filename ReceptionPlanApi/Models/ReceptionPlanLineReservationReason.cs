using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ReceptionPlanApi.Models
{
    public class ReceptionPlanLineReservationReason
    {
        public int RecPlanId { get; set; }
        public int RecPlanLineNo { get; set; }
        public string ReservationReason { get; set; }
        public int QtyConfirmed { get; set; }
        public bool IsDepComment { get; set; }

    }
}
