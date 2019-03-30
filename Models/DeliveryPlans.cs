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
    
    public partial class DeliveryPlans
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeliveryPlans()
        {
            this.DeliveryPlanLines = new HashSet<DeliveryPlanLines>();
        }
    
        public int DeliveryPlanId { get; set; }
        public int DeliveryPlanStatusId { get; set; }
        public int CustomerId { get; set; }
        public Nullable<System.DateTime> ExpectedDate { get; set; }
        public string EntryAuthor { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string LastAuthor { get; set; }
        public System.DateTime LastUpdate { get; set; }
    
        public virtual Customers Customers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeliveryPlanLines> DeliveryPlanLines { get; set; }
        public virtual DeliveryPlanStatus DeliveryPlanStatus { get; set; }
    }
}
