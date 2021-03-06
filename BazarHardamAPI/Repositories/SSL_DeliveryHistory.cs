//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BazarHardamAPI.Repositories
{
    using System;
    using System.Collections.Generic;
    
    public partial class SSL_DeliveryHistory
    {
        public long Id { get; set; }
        public System.Guid OrderId { get; set; }
        public decimal DeliveryCharge { get; set; }
        public decimal Vat { get; set; }
        public decimal TotalAmount { get; set; }
        public System.Guid VendorId { get; set; }
        public System.Guid UserId { get; set; }
        public string OrderNo { get; set; }
        public string Status { get; set; }
        public string StartLocation { get; set; }
        public string StartAddress { get; set; }
        public string EndLocation { get; set; }
        public string EndAddress { get; set; }
        public System.Guid DeliveryManId { get; set; }
        public System.Guid CreateUser { get; set; }
        public System.DateTime CreateDate { get; set; }
        public Nullable<System.Guid> EditUser { get; set; }
        public Nullable<System.DateTime> EditDate { get; set; }
        public string OCode { get; set; }
    }
}
