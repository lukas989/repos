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
    
    public partial class VSalesOrders
    {
        public int SalesOrderId { get; set; }
        public string VSalesOrderId { get; set; }
        public int SalesOrderStatusId { get; set; }
        public string SalesOrderStatus { get; set; }
        public int CustomerId { get; set; }
        public string VCustomerId { get; set; }
        public string NameCustomer { get; set; }
        public Nullable<int> SalesOrderLines { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<System.DateTime> ExpectedDate { get; set; }
        public string CurrencyId { get; set; }
        public decimal CurrencyRate { get; set; }
        public string EntryAuthor { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> WmsUpdate { get; set; }
    }
}
