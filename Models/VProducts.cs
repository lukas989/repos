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
    
    public partial class VProducts
    {
        public string VProductId { get; set; }
        public int ProductId { get; set; }
        public string Product { get; set; }
        public string VSupplierId { get; set; }
        public int SupplierId { get; set; }
        public string Supplier { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> Weight { get; set; }
        public Nullable<decimal> Height { get; set; }
        public Nullable<decimal> Width { get; set; }
        public Nullable<decimal> Depth { get; set; }
        public string EntryAuthor { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public System.DateTime LastUpdate { get; set; }
        public Nullable<System.DateTime> WmsUpdate { get; set; }
    }
}
