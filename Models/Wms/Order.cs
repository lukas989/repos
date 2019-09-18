using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Wms
{
    public class Order
    {
        public Customer Customer { get; set; }
        public OrderHeader OrderHeader { get; set; }
        public List<OrderLine> OrderLines { get; set; }
    }
}
