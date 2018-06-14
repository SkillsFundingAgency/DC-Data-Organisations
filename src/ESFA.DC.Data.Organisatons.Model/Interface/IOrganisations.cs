using System.Data.Entity;

namespace ESFA.DC.Data.Organisatons.Model.Interface
{
    public interface IOrganisations
    {
        DbSet<MasterOrganisation> MasterOrganisations { get; set; }

        DbSet<Org_DataGeneration> Org_DataGeneration { get; set; }

        DbSet<ORG_Details> ORG_Details { get; set; }

        DbSet<Org_Funding> ORG_Funding { get; set; }

        DbSet<Org_HMPP_Postcode> Org_HMPP_Postcode { get; set; }

        DbSet<Org_HMPP_UOP> Org_HMPP_UOP { get; set; }

        DbSet<Org_PartnerUKPRN> Org_PartnerUKPRN { get; set; }

        DbSet<Org_UKPRN_UPIN> Org_UKPRN_UPIN { get; set; }

        DbSet<Org_Version> Org_Version { get; set; }
    }
}
