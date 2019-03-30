using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Product
{
    public class ProductDetail
    {
        public Products Product { get; set; }
        public List<ProductBarcodes> ProductBarcodes { get; set; }
    }
}
