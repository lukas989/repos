﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WmsIntegration.Models
{
    public class ReceptionPlanConfirmModel
    {
        public ReceptionPlanConfirmHeader Header { get; set; }

        public List<ReceptionPlanConfirmLine> Lines { get; set; }

    }
}
