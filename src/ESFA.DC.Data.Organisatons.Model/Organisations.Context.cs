﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ESFA.DC.Data.Organisatons.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using ESFA.DC.Data.Organisatons.Model.Interface;
    
    public partial class Organisations : DbContext, IOrganisations
    {
        public Organisations()
            : base("name=Organisations")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<MasterOrganisation> MasterOrganisations { get; set; }
        public virtual DbSet<Org_DataGeneration> Org_DataGeneration { get; set; }
        public virtual DbSet<Org_HMPP_Postcode> Org_HMPP_Postcode { get; set; }
        public virtual DbSet<Org_HMPP_UOP> Org_HMPP_UOP { get; set; }
        public virtual DbSet<Org_PartnerUKPRN> Org_PartnerUKPRN { get; set; }
        public virtual DbSet<Org_UKPRN_UPIN> Org_UKPRN_UPIN { get; set; }
        public virtual DbSet<Org_Version> Org_Version { get; set; }
        public virtual DbSet<Org_Funding> Org_Funding { get; set; }
        public virtual DbSet<Org_Details> Org_Details { get; set; }
        public virtual DbSet<Current_Version> Current_Version { get; set; }
    }
}
