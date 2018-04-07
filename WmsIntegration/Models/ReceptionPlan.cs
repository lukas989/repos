using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WmsIntegration.Models
{
    public class ReceptionPlan
    {
        public ReceptionPlanSupplier Supplier { get; set; }

        public ReceptionPlanHeader Header { get; set; }

        public List<ReceptionPlanLine> Lines { get; set; }
    }
}
