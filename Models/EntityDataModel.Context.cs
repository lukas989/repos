﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WmsConnectionEntities : DbContext
    {
        public WmsConnectionEntities()
            : base("name=WmsConnectionEntities")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CustomerAddress> CustomerAddress { get; set; }
        public virtual DbSet<CustomerAddressTypes> CustomerAddressTypes { get; set; }
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<DeliveryPlanLines> DeliveryPlanLines { get; set; }
        public virtual DbSet<DeliveryPlans> DeliveryPlans { get; set; }
        public virtual DbSet<DeliveryPlanStatus> DeliveryPlanStatus { get; set; }
        public virtual DbSet<ProductBarcodes> ProductBarcodes { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<PurchaseOrderLines> PurchaseOrderLines { get; set; }
        public virtual DbSet<PurchaseOrders> PurchaseOrders { get; set; }
        public virtual DbSet<PurchaseOrderStatus> PurchaseOrderStatus { get; set; }
        public virtual DbSet<ReceiptPlanLines> ReceiptPlanLines { get; set; }
        public virtual DbSet<ReceiptPlans> ReceiptPlans { get; set; }
        public virtual DbSet<ReceiptPlanStatus> ReceiptPlanStatus { get; set; }
        public virtual DbSet<SalesOrderLines> SalesOrderLines { get; set; }
        public virtual DbSet<SalesOrders> SalesOrders { get; set; }
        public virtual DbSet<SalesOrderStatus> SalesOrderStatus { get; set; }
        public virtual DbSet<Suppliers> Suppliers { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}
