//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplicationModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductBarcodes
    {
        public int ProductId { get; set; }
        public string BarCode { get; set; }
        public string BarCodeType { get; set; }
        public string EntryAuthor { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public System.DateTime LastUpdate { get; set; }
    
        public virtual Products Products { get; set; }
    }
}
