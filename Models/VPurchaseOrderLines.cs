//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class VPurchaseOrderLines
    {
        public int PurchaseOrderId { get; set; }
        public int PurchaseOrderLineNo { get; set; }
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int OrderedQty { get; set; }
        public Nullable<int> RecivedQty { get; set; }
        public int PriceTypeId { get; set; }
        public decimal PurchaseOrderPrice { get; set; }
        public Nullable<System.DateTime> ExpectedDate { get; set; }
        public int DiscountTypeId { get; set; }
        public Nullable<int> DiscountValue { get; set; }
        public string EntryAuthor { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public System.DateTime LastUpdate { get; set; }
    }
}
