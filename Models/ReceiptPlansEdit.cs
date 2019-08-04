using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Models
{
    public class ReceiptPlansEdit : ReceiptPlans
    {
        public IEnumerable<SelectListItem> ReceiptPlanStatusSelectListItem { get; set; }
        public IEnumerable<SelectListItem> SuppliersSelectListItem { get; set; }
        public IEnumerable<VReceiptPlanLines> VReceiptPlanLines { get; set; }

    }
}
